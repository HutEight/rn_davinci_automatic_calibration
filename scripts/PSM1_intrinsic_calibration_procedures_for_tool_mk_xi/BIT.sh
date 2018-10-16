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
BAE_SYSTEMS='\e[41m BAE SYSTEMS \033[0m';


#############
echo -e "\n\n${BAE_SYSTEMS}"
 date

echo -e "\n  ${Underlined_t}DA VINCI CALIBRATION AUTO DATA ACQUISITION TOOL${RS}\n"
echo -e "${Bold_t}  PSM1 INTRINSIC CALIBRATION${RS}"
echo -e "  CALIBRATION TOOL ${Bold_t}MK. XI${RS}\n"

echo -e "  THIS IS STEP 2 OF THE PSM INTRINSIC CALIBRATION PROCEDURE.${RS}\n"

echo -e "${Bold_t}  ${Underlined_t}DATA TO BE COLLECTED${RS}"
echo -e "${Bold_t}  1. JOINT 1 ARC. ${RS}(DUR. 220 SCE)${RS}"
echo -e "${Bold_t}  2. JOINT 2 ARC. ${RS}(DUR. 220 SCE)${RS}"
echo -e "${Bold_t}  3. JOINT 4 & 5 SMALL SPHERES WITH JOINT 3 OFFSETS. ${RS}(DUR. 1080 SCE)${RS}"
echo -e "${Bold_t}  4. JOINT 5 ARC. ${RS}(DUR. 110 SCE)${RS}"
echo -e "${Bold_t}  5. JOINT 6 ARC. ${RS}(DUR. 110 SCE)${RS}"
echo -e "  ---${RS}"
echo -e "${Bold_t}  ${RS}APPROXIMATE TOTAL DURATION: 35 MIN.${RS}"

echo -e "\n${Bold_t}  --- PRESS ANY KEY TO BEGIN ---${RS}\n\n"
read -rsp $'' -n1 key;
###############


echo -e "  Moving Robot arm to prepose 1..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/01_green_prepose_01.jsp;
sleep 10;

echo -e "${Bold_t}  ${Underlined_t}CHECKLIST${RS}\n"
echo -e "${Bold_t}  1. TAPE THE GAP BETWEEN THE SHAFT AND THE TUBE.${RS}"
echo -e "${Bold_t}  2. POSITION THE POLARIS SENSOR TOWARDS THE FACE OF THE MARKER.${RS}"
echo -e "${Bold_t}  3. CHECK POLARIS TOPICS.${RS}"
echo -e "${Bold_t}  4. PRESS ANY KEY TO START DATA COLLECTION.${RS}"
echo -e "${Bold_t}  5. WAIT TILL FURTHER INSTRUCTIONS PROMPT IN 8 MIN.${RS}"


read -rsp $'' -n1 key;


#############

echo -e "\n  Recording Joint 1 Outter Arc Data..\n"
rosbag record --duration=3 -O  03_green_j1_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/03_green_j1_arc_01.jsp;
sleep 3;



#########################

scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_green_j1_arc_01.bag $PWD/outputs_conversion;
          

echo -e "\t\033[1;37mConversion Complete!\033[0m";

sleep 10;

mv $PWD/outputs_conversion/03_green_j1_arc_01/polaris_sensor/targets.csv $PWD/03_green_j1_arc_01.csv;


echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/03_green_j1_arc_01.csv;
sed -i -e "1d" $PWD/03_green_j1_arc_01.csv;


echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/03_green_j1_arc_01.csv $exedir/csv/03_green_j1_arc_01.csv;

rm -rf $PWD/outputs_conversion/;


rm 03_green_j1_arc_01.bag;


echo -e "${Bold_t}  \nPSM1 INTRINSIC CALIBRATION DATA ACQUIRED.${RS}"
