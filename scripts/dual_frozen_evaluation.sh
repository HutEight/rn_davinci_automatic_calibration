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

echo -e "\n  ${Underlined_t}GREEN ARM FROZEN ACQUISITION SCRIPT${RS}\n"
echo -e "${Bold_t}Da Vinci automatic calibration--Right GREEN arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;



#############
echo -e "\n  Recording PSM1 Polaris Pts..\n"
rosbag record --duration=166 -O  green_evaluation.bag /polaris_sensor/raw_points &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/dual_frozen/green_evaluation.psp;
sleep 167;
echo -e "\n  ${Bold_t}PSM1 Data Recording Complete!${RS}\n"

###########

echo -e "${Bold_t}REMOVE THE COVER OF PMS2! AND PUT IT ON PSM1!${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;

###########

echo -e "\n  Recording PSM2 Polaris Pts..\n"
rosbag record --duration=166 -O  yellow_evaluation.bag /polaris_sensor/raw_points &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/dual_frozen/yellow_evaluation.psp;
sleep 167;
echo -e "\n  ${Bold_t}PSM2 Data Recording Complete!${RS}\n"

#############

scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/green_evaluation.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/yellow_evaluation.bag $PWD/outputs_conversion;

echo -e "\t\033[1;37mConversion Complete!\033[0m";

##############

mv $PWD/outputs_conversion/green_evaluation/polaris_sensor/raw_points.csv $PWD/green_evaluation.csv;

mv $PWD/outputs_conversion/yellow_evaluation/polaris_sensor/raw_points.csv $PWD/yellow_evaluation.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";

sed -i -e 's:/polaris_link,::g' $PWD/green_evaluation.csv;
sed -i -e "1d" $PWD/green_evaluation.csv;

sed -i -e 's:/polaris_link,::g' $PWD/yellow_evaluation.csv;
sed -i -e "1d" $PWD/yellow_evaluation.csv;


echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);

mv $PWD/green_evaluation.csv $exedir/csv/green_evaluation.csv;

mv $PWD/yellow_evaluation.csv $exedir/csv/yellow_evaluation.csv;

rm -rf $PWD/outputs_conversion/;

rm green_evaluation.bag;
rm yellow_evaluation.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";





