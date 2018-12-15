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
echo -e "${Bold_t}  PSM1/JOINT1 ENCODER QUALITY TEST${RS}"
echo -e "  CALIBRATION TOOL ${Bold_t}MK. XI${RS}\n"

echo -e "  THIS IS STEP 1+ OF THE PSM INTRINSIC CALIBRATION PROCEDURE. THE DATA ACQUIRED HERE IS USED TO GET THE QUALITY MEASUREMENT FOR THE PSM JOINT 1. NORMALLY JOINT 1 IS ACCURATE ENOUGH SO YOU DO NOT HAVE TO RUN THIS TEST.${RS}\n"

echo -e "\n${Bold_t}  --- PRESS ANY KEY TO BEGIN ---${RS}\n\n"
read -rsp $'' -n1 key;

#############

rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/01_plus_joint_1_incremental_PSM1/01_j1_pre_pose.jsp;
sleep 10;
echo -e "\n  ${Bold_t}Armed moved to Small spheres prepose${RS}\n"

echo -e "${Bold_t}  ${Underlined_t}CHECKLIST${RS}\n"
echo -e "${Bold_t}  1. TAPE THE GAP BETWEEN THE SHAFT AND THE TUBE.${RS}"
echo -e "${Bold_t}  2. POSITION THE POLARIS SENSOR TOWARDS THE FACE OF THE MARKER.${RS}"
echo -e "${Bold_t}  3. CHECK POLARIS TOPICS.${RS}"
echo -e "${Bold_t}  4. PRESS ANY KEY TO START DATA COLLECTION.${RS}"

read -rsp $'' -n1 key;
#############
echo -e "\n  Recording 02_j1_arc..\n"
echo -e "Reading playfile: 02_j1_arc.jsp"
rosbag record --duration=200 -O  02_j1_arc.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/01_plus_joint_1_incremental_PSM1/02_j1_arc.jsp;
sleep 200;
echo -e "\n  ${Bold_t}02_j1_arc Recording Complete!${RS}\n"


echo -e "\n  Recording 03_j1_still_samples_j4_0_deg..\n"
echo -e "Reading playfile: 03_j1_still_samples_j4_0_deg.jsp"
rosbag record --duration=335 -O  03_j1_still_samples_j4_0_deg.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/01_plus_joint_1_incremental_PSM1/03_j1_still_samples_j4_0_deg.jsp;
sleep 335;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


#############


scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/02_j1_arc.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_j1_still_samples_j4_0_deg.bag $PWD/outputs_conversion;



echo -e "\t\033[1;37mConversion Complete!\033[0m";



mv $PWD/outputs_conversion/02_j1_arc/polaris_sensor/targets.csv $PWD/02_j1_arc.csv;
mv $PWD/outputs_conversion/03_j1_still_samples_j4_0_deg/polaris_sensor/targets.csv $PWD/03_j1_still_samples_j4_0_deg.csv;


echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/02_j1_arc.csv;
sed -i -e "1d" $PWD/02_j1_arc.csv;
sed -i -e 's:/polaris_link,::g' $PWD/03_j1_still_samples_j4_0_deg.csv;
sed -i -e "1d" $PWD/03_j1_still_samples_j4_0_deg.csv;



echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/02_j1_arc.csv $exedir/csv/02_j1_arc.csv;
mv $PWD/03_j1_still_samples_j4_0_deg.csv $exedir/csv/03_j1_still_samples_j4_0_deg.csv;



rm -rf $PWD/outputs_conversion/;


rm 02_j1_arc.bag;
rm 03_j1_still_samples_j4_0_deg.bag;


echo -e "${Bold_t}  \nPSM1/JOINT1 ENCODER QUALITY DATA ACQUIRED.${RS}"
