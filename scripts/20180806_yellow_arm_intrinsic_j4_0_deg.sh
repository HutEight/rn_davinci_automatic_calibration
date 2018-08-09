#!/bin/bash

##Colours
  Red_t='\e[31m';
  Blue_t='\e[34m';
  Green_t='\e[32m';
  Lt_Red_t='\e[91m';
  Lt_Blue_t='\e[94m';
  Lt_yellow_t='\e[92m';
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
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;


echo -e "  Moving Robot arm to prepose 1..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/01_yellow_prepose_01.jsp;
sleep 10;

echo -e "\n  ${Bold_t}${Green_t}Please tape the gap between the shaft and the tube..${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;


#############

echo -e "\n  Recording Joint 1 Outter Arc Data..\n"
rosbag record --duration=210 -O  03_yellow_j1_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/03_yellow_j1_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 1 Outter Arc Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 2 Outter Arc Data..\n"
rosbag record --duration=210 -O  04_yellow_j2_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/04_yellow_j2_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 2 Outter Arc Data Recording Complete!${RS}\n"


#############
echo -e "\n  ${Bold_t}${Green_t}Please remove the tape!${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;


rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/04a_yellow_small_prepose.jsp;
sleep 15;
echo -e "\n  ${Bold_t}Armed moved to Small spheres prepose${RS}\n"
#############
echo -e "\n  Recording Small Sphere Data 01..\n"
echo -e "Reading playfile: 05_yellow_small_sphere_5cm.jsp"
rosbag record --duration=265 -O  05_yellow_small_sphere_5cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/05_yellow_small_sphere_5cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 01 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 02..\n"
echo -e "Reading playfile: 06_yellow_small_sphere_11cm.jsp"
rosbag record --duration=265 -O  06_yellow_small_sphere_11cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/06_yellow_small_sphere_11cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 03..\n"
echo -e "Reading playfile: 07_yellow_small_sphere_17cm.jsp"
rosbag record --duration=265 -O  07_yellow_small_sphere_17cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/07_yellow_small_sphere_17cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 03 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 04..\n"
echo -e "Reading playfile: 08_yellow_small_sphere_23cm.jsp"
rosbag record --duration=265 -O  08_yellow_small_sphere_23cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180730_psm2_intrinsic_j4_0_deg/08_yellow_small_sphere_23cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 04 Recording Complete!${RS}\n"



scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_yellow_j1_arc_01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/04_yellow_j2_arc_01.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/05_yellow_small_sphere_5cm.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/06_yellow_small_sphere_11cm.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/07_yellow_small_sphere_17cm.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/08_yellow_small_sphere_23cm.bag $PWD/outputs_conversion;

echo -e "\t\033[1;37mConversion Complete!\033[0m";



mv $PWD/outputs_conversion/03_yellow_j1_arc_01/polaris_sensor/targets.csv $PWD/03_yellow_j1_arc_01.csv;
mv $PWD/outputs_conversion/04_yellow_j2_arc_01/polaris_sensor/targets.csv $PWD/04_yellow_j2_arc_01.csv;

mv $PWD/outputs_conversion/05_yellow_small_sphere_5cm/polaris_sensor/targets.csv $PWD/05_yellow_small_sphere_5cm.csv;
mv $PWD/outputs_conversion/06_yellow_small_sphere_11cm/polaris_sensor/targets.csv $PWD/06_yellow_small_sphere_11cm.csv;
mv $PWD/outputs_conversion/07_yellow_small_sphere_17cm/polaris_sensor/targets.csv $PWD/07_yellow_small_sphere_17cm.csv;
mv $PWD/outputs_conversion/08_yellow_small_sphere_23cm/polaris_sensor/targets.csv $PWD/08_yellow_small_sphere_23cm.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/03_yellow_j1_arc_01.csv;
sed -i -e "1d" $PWD/03_yellow_j1_arc_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/04_yellow_j2_arc_01.csv;
sed -i -e "1d" $PWD/04_yellow_j2_arc_01.csv;

sed -i -e 's:/polaris_link,::g' $PWD/05_yellow_small_sphere_5cm.csv;
sed -i -e "1d" $PWD/05_yellow_small_sphere_5cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/06_yellow_small_sphere_11cm.csv;
sed -i -e "1d" $PWD/06_yellow_small_sphere_11cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/07_yellow_small_sphere_17cm.csv;
sed -i -e "1d" $PWD/07_yellow_small_sphere_17cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/08_yellow_small_sphere_23cm.csv;
sed -i -e "1d" $PWD/08_yellow_small_sphere_23cm.csv

echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/03_yellow_j1_arc_01.csv $exedir/csv/03_yellow_j1_arc_01.csv;
mv $PWD/04_yellow_j2_arc_01.csv $exedir/csv/04_yellow_j2_arc_01.csv;

mv $PWD/05_yellow_small_sphere_5cm.csv $exedir/csv/05_yellow_small_sphere_5cm.csv;
mv $PWD/06_yellow_small_sphere_11cm.csv $exedir/csv/06_yellow_small_sphere_11cm.csv;
mv $PWD/07_yellow_small_sphere_17cm.csv $exedir/csv/07_yellow_small_sphere_17cm.csv;
mv $PWD/08_yellow_small_sphere_23cm.csv $exedir/csv/08_yellow_small_sphere_23cm.csv;

rm -rf $PWD/outputs_conversion/;


rm 03_yellow_j1_arc_01.bag;
rm 04_yellow_j2_arc_01.bag;

rm 05_yellow_small_sphere_5cm.bag;
rm 06_yellow_small_sphere_11cm.bag;
rm 07_yellow_small_sphere_17cm.bag;
rm 08_yellow_small_sphere_23cm.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";

