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
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/01_green_prepose_01.jsp;
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
rosbag record --duration=210 -O  03_green_j1_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/03_green_j1_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 1 Outter Arc Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 2 Outter Arc Data..\n"
rosbag record --duration=210 -O  04_green_j2_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/04_green_j2_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 2 Outter Arc Data Recording Complete!${RS}\n"


#############

echo -e "${Bold_t}  ${Underlined_t}ACTION REQUIRED${RS}\n"
echo -e "${Bold_t}  1. REMOVE THE TAPE.${RS}"
echo -e "${Bold_t}  2. PRESS ANY KEY TO CONTINUE THE DATA COLLECTION.${RS}"
read -rsp $'' -n1 key;


rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/04a_green_small_prepose.jsp;
sleep 15;
echo -e "\n  ${Bold_t}Arm has moved to Small spheres prepose${RS}\n"

#############
echo -e "\n  Recording Small Sphere Data 01..\n"
echo -e "Reading playfile: 05_green_small_sphere_5cm.jsp"
rosbag record --duration=265 -O  05_green_small_sphere_5cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/05_green_small_sphere_5cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 01 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 02..\n"
echo -e "Reading playfile: 06_green_small_sphere_11cm.jsp"
rosbag record --duration=265 -O  06_green_small_sphere_11cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/06_green_small_sphere_11cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 03..\n"
echo -e "Reading playfile: 07_green_small_sphere_17cm.jsp"
rosbag record --duration=265 -O  07_green_small_sphere_17cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/07_green_small_sphere_17cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 03 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 04..\n"
echo -e "Reading playfile: 08_green_small_sphere_23cm.jsp"
rosbag record --duration=265 -O  08_green_small_sphere_23cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/08_green_small_sphere_23cm.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 04 Recording Complete!${RS}\n"



#########################
# JOINT 5 AND 6 ARCS AT A FIXED JOINT 3 (PRISMATIC) OFFSET.

echo -e "\n  Going to Joint 5 and 6 arcs prepose with a constant Joint 3 offset of 140 mm..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/09_green_prepose_at_j3_14cm.jsp;
sleep 15;
echo -e "\n  ${Bold_t}Arm has reached prepose.${RS}\n"


echo -e "\n  Recording Joint 5 Arc..\n"
echo -e "Reading playfile: 09_green_j5_arc_01_at_j3_14cm.jsp"
rosbag record --duration=110 -O  09_green_j5_arc_01_at_j3_14cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/09_green_j5_arc_01_at_j3_14cm.jsp;
sleep 110;
echo -e "\n  ${Bold_t}Joint 5 Acc Data Recording Complete!${RS}\n"


echo -e "\n  Recording Joint 6 Arc..\n"
echo -e "Reading playfile: 10_green_j6_arc_01_at_j3_14cm.jsp"
rosbag record --duration=110 -O  10_green_j6_arc_01_at_j3_14cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/10_green_j6_arc_01_at_j3_14cm.jsp;
sleep 110;
echo -e "\n  ${Bold_t}Joint 6 Acc Data Recording Complete!${RS}\n"


#########################

scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_green_j1_arc_01.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/04_green_j2_arc_01.bag $PWD/outputs_conversion;

bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/05_green_small_sphere_5cm.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/06_green_small_sphere_11cm.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/07_green_small_sphere_17cm.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/08_green_small_sphere_23cm.bag $PWD/outputs_conversion;

bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/09_green_j5_arc_01_at_j3_14cm.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/10_green_j6_arc_01_at_j3_14cm.bag $PWD/outputs_conversion;             

echo -e "\t\033[1;37mConversion Complete!\033[0m";



mv $PWD/outputs_conversion/03_green_j1_arc_01/polaris_sensor/targets.csv $PWD/03_green_j1_arc_01.csv;
mv $PWD/outputs_conversion/04_green_j2_arc_01/polaris_sensor/targets.csv $PWD/04_green_j2_arc_01.csv;
 
mv $PWD/outputs_conversion/05_green_small_sphere_5cm/polaris_sensor/targets.csv $PWD/05_green_small_sphere_5cm.csv;
mv $PWD/outputs_conversion/06_green_small_sphere_11cm/polaris_sensor/targets.csv $PWD/06_green_small_sphere_11cm.csv;
mv $PWD/outputs_conversion/07_green_small_sphere_17cm/polaris_sensor/targets.csv $PWD/07_green_small_sphere_17cm.csv;
mv $PWD/outputs_conversion/08_green_small_sphere_23cm/polaris_sensor/targets.csv $PWD/08_green_small_sphere_23cm.csv;

mv $PWD/outputs_conversion/09_green_j5_arc_01_at_j3_14cm/polaris_sensor/targets.csv $PWD/09_green_j5_arc_01_at_j3_14cm.csv;
mv $PWD/outputs_conversion/10_green_j6_arc_01_at_j3_14cm/polaris_sensor/targets.csv $PWD/10_green_j6_arc_01_at_j3_14cm.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/03_green_j1_arc_01.csv;
sed -i -e "1d" $PWD/03_green_j1_arc_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/04_green_j2_arc_01.csv;
sed -i -e "1d" $PWD/04_green_j2_arc_01.csv;

sed -i -e 's:/polaris_link,::g' $PWD/05_green_small_sphere_5cm.csv;
sed -i -e "1d" $PWD/05_green_small_sphere_5cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/06_green_small_sphere_11cm.csv;
sed -i -e "1d" $PWD/06_green_small_sphere_11cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/07_green_small_sphere_17cm.csv;
sed -i -e "1d" $PWD/07_green_small_sphere_17cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/08_green_small_sphere_23cm.csv;
sed -i -e "1d" $PWD/08_green_small_sphere_23cm.csv

sed -i -e 's:/polaris_link,::g' $PWD/09_green_j5_arc_01_at_j3_14cm.csv;
sed -i -e "1d" $PWD/09_green_j5_arc_01_at_j3_14cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/10_green_j6_arc_01_at_j3_14cm.csv;
sed -i -e "1d" $PWD/10_green_j6_arc_01_at_j3_14cm.csv

echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/03_green_j1_arc_01.csv $exedir/csv/03_green_j1_arc_01.csv;
mv $PWD/04_green_j2_arc_01.csv $exedir/csv/04_green_j2_arc_01.csv;

mv $PWD/05_green_small_sphere_5cm.csv $exedir/csv/05_green_small_sphere_5cm.csv;
mv $PWD/06_green_small_sphere_11cm.csv $exedir/csv/06_green_small_sphere_11cm.csv;
mv $PWD/07_green_small_sphere_17cm.csv $exedir/csv/07_green_small_sphere_17cm.csv;
mv $PWD/08_green_small_sphere_23cm.csv $exedir/csv/08_green_small_sphere_23cm.csv;

mv $PWD/09_green_j5_arc_01_at_j3_14cm.csv $exedir/csv/09_green_j5_arc_01_at_j3_14cm.csv;
mv $PWD/10_green_j6_arc_01_at_j3_14cm.csv $exedir/csv/10_green_j6_arc_01_at_j3_14cm.csv;

rm -rf $PWD/outputs_conversion/;


rm 03_green_j1_arc_01.bag;
rm 04_green_j2_arc_01.bag;

rm 05_green_small_sphere_5cm.bag;
rm 06_green_small_sphere_11cm.bag;
rm 07_green_small_sphere_17cm.bag;
rm 08_green_small_sphere_23cm.bag;

rm 09_green_j5_arc_01_at_j3_14cm.bag;
rm 10_green_j6_arc_01_at_j3_14cm.bag;

echo -e "${Bold_t}  \nPSM1 INTRINSIC CALIBRATION DATA ACQUIRED.${RS}"
