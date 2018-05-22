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
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;


#############
# t = 1020 if 10x10 
# t = 880 if 5 x5 x5 cube

echo -e "\n  Recording Grid Data..\n"
rosbag record --duration=880 -O  green_frozen.bag /polaris_sensor/raw_points &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/frozen/frozen.psp;
sleep 880;
echo -e "\n  ${Bold_t}Data Recording Complete!${RS}\n"

#############




scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/green_frozen.bag $PWD/outputs_conversion;


echo -e "\t\033[1;37mConversion Complete!\033[0m";

mv $PWD/outputs_conversion/green_frozen/polaris_sensor/raw_points.csv $PWD/green_frozen.csv;


echo -e "\033[1;37m\nPreprocessing data... \033[0m";

sed -i -e 's:/polaris_link,::g' $PWD/green_frozen.csv;
sed -i -e "1d" $PWD/green_frozen.csv;


echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);

mv $PWD/green_frozen.csv $exedir/csv/green_frozen.csv;


rm -rf $PWD/outputs_conversion/;

rm green_frozen.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";

