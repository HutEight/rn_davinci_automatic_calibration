#!/bin/bash

##Colours
  Red_t='\e[31m';
  Blue_t='\e[34m';
  Green_t='\e[32m';
  Lt_Red_t='\e[91m';
  Lt_Blue_t='\e[94m';
  Lt_Green_t='\e[92m';
  Dark_Grey_t='\e[90m';
  Lt_Grey_t='\e[37m';
  White_t='\e[97m';
  NC='\033[0m' # No Color
##Types
  Bold_t='\e[1m';
  Dim_t='\e[2m';
  Underlined_t='\e[4m';
  Blink_t='\e[5m';
  Hidden_t='\e[8m';
  RS='\e[0m'; #Reset all attributes
##BAE LOGO
BAE_SYSTEMS='\e[41m BAE_SYSTEMS \033[0m';


#############
echo -e "\n\n${BAE_SYSTEMS}"
 date

echo -e "\n  ${Underlined_t}GREEN ARM PRIMATIC OFFSETS ACQUISITION SCRIPT${RS}\n"
echo -e "${Bold_t}J2 encoder test.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;

#############

rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180809_j2_incremental_PSM2/01_j2_pre_pose.jsp;
sleep 10;
echo -e "\n  ${Bold_t}Armed moved to Small spheres prepose${RS}\n"

echo -e "\n  ${Bold_t}${Green_t}Please tape the gap between the shaft and the tube..${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;
#############
echo -e "\n  Recording 02_j2_arc..\n"
echo -e "Reading playfile: 02_j2_arc.jsp"
rosbag record --duration=195 -O  02_j2_arc.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180809_j2_incremental_PSM2/02_j2_arc.jsp;
sleep 195;
echo -e "\n  ${Bold_t}02_j2_arc Recording Complete!${RS}\n"


echo -e "\n  Recording 03_j2_still_samples_j4_90_deg..\n"
echo -e "Reading playfile: 03_j2_still_samples_j4_90_deg.jsp"
rosbag record --duration=205 -O  03_j2_still_samples_j4_90_deg.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180809_j2_incremental_PSM2/03_j2_still_samples_j4_90_deg.jsp;
sleep 205;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


#############


scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/02_j2_arc.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_j2_still_samples_j4_90_deg.bag $PWD/outputs_conversion;



echo -e "\t\033[1;37mConversion Complete!\033[0m";



mv $PWD/outputs_conversion/02_j2_arc/polaris_sensor/targets.csv $PWD/02_j2_arc.csv;
mv $PWD/outputs_conversion/03_j2_still_samples_j4_90_deg/polaris_sensor/targets.csv $PWD/03_j2_still_samples_j4_90_deg.csv;


echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/02_j2_arc.csv;
sed -i -e "1d" $PWD/02_j2_arc.csv;
sed -i -e 's:/polaris_link,::g' $PWD/03_j2_still_samples_j4_90_deg.csv;
sed -i -e "1d" $PWD/03_j2_still_samples_j4_90_deg.csv;



echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/02_j2_arc.csv $exedir/csv/02_j2_arc.csv;
mv $PWD/03_j2_still_samples_j4_90_deg.csv $exedir/csv/03_j2_still_samples_j4_90_deg.csv;



rm -rf $PWD/outputs_conversion/;


rm 02_j2_arc.bag;
rm 03_j2_still_samples_j4_90_deg.bag;



echo -e "\033[1;34m\nCalibration data acquired.\033[0m";

