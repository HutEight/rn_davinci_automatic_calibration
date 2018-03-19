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

echo -e "\n\n${BAE_SYSTEMS}"
 date
echo -e "\n  ${Underlined_t}NEW GREEN ARM CALIBRATION SCRIPT${RS}\n"
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;



echo -e "  Moving Robot arm to prepose 1..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/01_green_prepose_01.jsp;
sleep 10;



echo -e "\n  ${Bold_t}${Green_t}Please tape the gap between the shaft and the tube..${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;



echo -e "\n  Recording Joint 1 & 2 Outter Sphere Data..\n"
rosbag record --duration=430 -O  02_green_sphere_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/02_green_sphere_01.jsp;
sleep 440;
echo -e "\n  ${Bold_t}Joint 1 & 2 Outter Sphere Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 1 Outter Arc Data..\n"
rosbag record --duration=210 -O  03_green_j1_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/03_green_j1_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 1 Outter Arc Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 2 Outter Arc Data..\n"
rosbag record --duration=210 -O  04_green_j2_arc_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/04_green_j2_arc_01.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 2 Outter Arc Data Recording Complete!${RS}\n"



echo -e "\n  ${Bold_t}${Green_t}Please remove the tape!${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;
echo -e "  Moving Robot arm to prepose 2..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/05_green_prepose_02.jsp;
sleep 10;
echo -e "\n  ${Bold_t}${Green_t}Please tape the gap between the shaft and the tube..${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;



echo -e "\n  Recording Joint 1 & 2 Middle Sphere Data..\n"
rosbag record --duration=430 -O  06_green_sphere_02.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/06_green_sphere_02.jsp;
sleep 440;
echo -e "\n  ${Bold_t}Joint 1 & 2 Middle Sphere Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 1 Middle Arc Data..\n"
rosbag record --duration=210 -O  07_green_j1_arc_02.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/07_green_j1_arc_02.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 1 Middle Arc Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 2 Middle Arc Data..\n"
rosbag record --duration=210 -O  08_green_j2_arc_02.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/08_green_j2_arc_02.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 2 Middle Arc Data Recording Complete!${RS}\n"



echo -e "\n  ${Bold_t}${Green_t}Please remove the tape!${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;
echo -e "  Moving Robot arm to prepose 3..\n"
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/09_green_prepose_03.jsp;
sleep 10;
echo -e "\n  ${Bold_t}${Green_t}Please tape the gap between the shaft and the tube..${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;



echo -e "\n  Recording Joint 1 & 2 Inner Sphere Data..\n"
rosbag record --duration=430 -O  10_green_sphere_03.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/10_green_sphere_03.jsp;
sleep 440;
echo -e "\n  ${Bold_t}Joint 1 & 2 Inner Sphere Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 1 Inner Arc Data..\n"
rosbag record --duration=210 -O  11_green_j1_arc_03.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/11_green_j1_arc_03.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 1 Inner Arc Data Recording Complete!${RS}\n"

echo -e "\n  Recording Joint 2 Inner Arc Data..\n"
rosbag record --duration=210 -O  12_green_j2_arc_03.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/12_green_j2_arc_03.jsp;
sleep 220;
echo -e "\n  ${Bold_t}Joint 2 Inner Arc Data Recording Complete!${RS}\n"



echo -e "\n  ${Bold_t}${Green_t}Please remove the tape!${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;



echo -e "\n  Recording Joint 3 Straight Line Data..\n"
rosbag record --duration=120 -O  13_green_j3_line.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/13_green_j3_line.jsp;
sleep 125;
echo -e "\n  ${Bold_t}Joint 3 Straight Line Data Recording Complete!${RS}\n"



echo -e "\n  Recording Joint 3 Cylinder Data..\n"
rosbag record --duration=255 -O  14_green_j3_cylinder.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/14_green_j3_cylinder.jsp;
sleep 260;
echo -e "\n  ${Bold_t}Joint 3 Cylinder Data Recording Complete!${RS}\n"



echo -e "\n  Recording Small Sphere Data 01..\n"
rosbag record --duration=265 -O  15_green_small_sphere_01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/15_green_small_sphere_01.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 01 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 02..\n"
rosbag record --duration=265 -O  16_green_small_sphere_02.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/16_green_small_sphere_02.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 03..\n"
rosbag record --duration=265 -O  17_green_small_sphere_03.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/17_green_small_sphere_03.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 03 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 04..\n"
rosbag record --duration=265 -O  18_green_small_sphere_04.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/18_green_small_sphere_04.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 04 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 05..\n"
rosbag record --duration=265 -O  19_green_small_sphere_05.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/19_green_small_sphere_05.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 05 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 06..\n"
rosbag record --duration=265 -O  20_green_small_sphere_06.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/20_green_small_sphere_06.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 06 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 07..\n"
rosbag record --duration=265 -O  21_green_small_sphere_07.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/21_green_small_sphere_07.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 07 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 08..\n"
rosbag record --duration=265 -O  22_green_small_sphere_08.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/22_green_small_sphere_08.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 08 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 09..\n"
rosbag record --duration=265 -O  23_green_small_sphere_09.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180111_new_calibration_playfiles/23_green_small_sphere_09.jsp;
sleep 270;
echo -e "\n  ${Bold_t}Small Sphere Data 09 Recording Complete!${RS}\n"



scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/02_green_sphere_01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03_green_j1_arc_01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/04_green_j2_arc_01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/06_green_sphere_02.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/07_green_j1_arc_02.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/08_green_j2_arc_02.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/10_green_sphere_03.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/11_green_j1_arc_03.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/12_green_j2_arc_03.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/13_green_j3_line.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/14_green_j3_cylinder.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/15_green_small_sphere_01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/16_green_small_sphere_02.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/17_green_small_sphere_03.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/18_green_small_sphere_04.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/19_green_small_sphere_05.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/20_green_small_sphere_06.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/21_green_small_sphere_07.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/22_green_small_sphere_08.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/23_green_small_sphere_09.bag $PWD/outputs_conversion;

echo -e "\t\033[1;37mConversion Complete!\033[0m";

mv $PWD/outputs_conversion/02_green_sphere_01/polaris_sensor/targets.csv $PWD/02_green_sphere_01.csv;
mv $PWD/outputs_conversion/03_green_j1_arc_01/polaris_sensor/targets.csv $PWD/03_green_j1_arc_01.csv;
mv $PWD/outputs_conversion/04_green_j2_arc_01/polaris_sensor/targets.csv $PWD/04_green_j2_arc_01.csv;
mv $PWD/outputs_conversion/06_green_sphere_02/polaris_sensor/targets.csv $PWD/06_green_sphere_02.csv;
mv $PWD/outputs_conversion/07_green_j1_arc_02/polaris_sensor/targets.csv $PWD/07_green_j1_arc_02.csv;
mv $PWD/outputs_conversion/08_green_j2_arc_02/polaris_sensor/targets.csv $PWD/08_green_j2_arc_02.csv;
mv $PWD/outputs_conversion/10_green_sphere_03/polaris_sensor/targets.csv $PWD/10_green_sphere_03.csv;
mv $PWD/outputs_conversion/11_green_j1_arc_03/polaris_sensor/targets.csv $PWD/11_green_j1_arc_03.csv;
mv $PWD/outputs_conversion/12_green_j2_arc_03/polaris_sensor/targets.csv $PWD/12_green_j2_arc_03.csv;
mv $PWD/outputs_conversion/13_green_j3_line/polaris_sensor/targets.csv $PWD/13_green_j3_line.csv;
mv $PWD/outputs_conversion/14_green_j3_cylinder/polaris_sensor/targets.csv $PWD/14_green_j3_cylinder.csv;
mv $PWD/outputs_conversion/15_green_small_sphere_01/polaris_sensor/targets.csv $PWD/15_green_small_sphere_01.csv;
mv $PWD/outputs_conversion/16_green_small_sphere_02/polaris_sensor/targets.csv $PWD/16_green_small_sphere_02.csv;
mv $PWD/outputs_conversion/17_green_small_sphere_03/polaris_sensor/targets.csv $PWD/17_green_small_sphere_03.csv;
mv $PWD/outputs_conversion/18_green_small_sphere_04/polaris_sensor/targets.csv $PWD/18_green_small_sphere_04.csv;
mv $PWD/outputs_conversion/19_green_small_sphere_05/polaris_sensor/targets.csv $PWD/19_green_small_sphere_05.csv;
mv $PWD/outputs_conversion/20_green_small_sphere_06/polaris_sensor/targets.csv $PWD/20_green_small_sphere_06.csv;
mv $PWD/outputs_conversion/21_green_small_sphere_07/polaris_sensor/targets.csv $PWD/21_green_small_sphere_07.csv;
mv $PWD/outputs_conversion/22_green_small_sphere_08/polaris_sensor/targets.csv $PWD/22_green_small_sphere_08.csv;
mv $PWD/outputs_conversion/23_green_small_sphere_09/polaris_sensor/targets.csv $PWD/23_green_small_sphere_09.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";

sed -i -e 's:/polaris_link,::g' $PWD/02_green_sphere_01.csv;
sed -i -e "1d" $PWD/02_green_sphere_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/03_green_j1_arc_01.csv;
sed -i -e "1d" $PWD/03_green_j1_arc_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/04_green_j2_arc_01.csv;
sed -i -e "1d" $PWD/04_green_j2_arc_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/06_green_sphere_02.csv;
sed -i -e "1d" $PWD/06_green_sphere_02.csv;
sed -i -e 's:/polaris_link,::g' $PWD/07_green_j1_arc_02.csv;
sed -i -e "1d" $PWD/07_green_j1_arc_02.csv;
sed -i -e 's:/polaris_link,::g' $PWD/08_green_j2_arc_02.csv;
sed -i -e "1d" $PWD/08_green_j2_arc_02.csv;
sed -i -e 's:/polaris_link,::g' $PWD/10_green_sphere_03.csv;
sed -i -e "1d" $PWD/10_green_sphere_03.csv;
sed -i -e 's:/polaris_link,::g' $PWD/11_green_j1_arc_03.csv;
sed -i -e "1d" $PWD/11_green_j1_arc_03.csv;
sed -i -e 's:/polaris_link,::g' $PWD/12_green_j2_arc_03.csv;
sed -i -e "1d" $PWD/12_green_j2_arc_03.csv;
sed -i -e 's:/polaris_link,::g' $PWD/13_green_j3_line.csv;
sed -i -e "1d" $PWD/13_green_j3_line.csv;
sed -i -e 's:/polaris_link,::g' $PWD/14_green_j3_cylinder.csv;
sed -i -e "1d" $PWD/14_green_j3_cylinder.csv;
sed -i -e 's:/polaris_link,::g' $PWD/15_green_small_sphere_01.csv;
sed -i -e "1d" $PWD/15_green_small_sphere_01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/16_green_small_sphere_02.csv;
sed -i -e "1d" $PWD/16_green_small_sphere_02.csv;
sed -i -e 's:/polaris_link,::g' $PWD/17_green_small_sphere_03.csv;
sed -i -e "1d" $PWD/17_green_small_sphere_03.csv;
sed -i -e 's:/polaris_link,::g' $PWD/18_green_small_sphere_04.csv;
sed -i -e "1d" $PWD/18_green_small_sphere_04.csv;
sed -i -e 's:/polaris_link,::g' $PWD/19_green_small_sphere_05.csv;
sed -i -e "1d" $PWD/19_green_small_sphere_05.csv;
sed -i -e 's:/polaris_link,::g' $PWD/20_green_small_sphere_06.csv;
sed -i -e "1d" $PWD/20_green_small_sphere_06.csv;
sed -i -e 's:/polaris_link,::g' $PWD/21_green_small_sphere_07.csv;
sed -i -e "1d" $PWD/21_green_small_sphere_07.csv;
sed -i -e 's:/polaris_link,::g' $PWD/22_green_small_sphere_08.csv;
sed -i -e "1d" $PWD/22_green_small_sphere_08.csv;
sed -i -e 's:/polaris_link,::g' $PWD/23_green_small_sphere_09.csv;
sed -i -e "1d" $PWD/23_green_small_sphere_09.csv;

echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";
exedir=$(rospack find automatic_calibration);
mv $PWD/02_green_sphere_01.csv $exedir/csv/02_green_sphere_01.csv;
mv $PWD/03_green_j1_arc_01.csv $exedir/csv/03_green_j1_arc_01.csv;
mv $PWD/04_green_j2_arc_01.csv $exedir/csv/04_green_j2_arc_01.csv;
mv $PWD/06_green_sphere_02.csv $exedir/csv/06_green_sphere_02.csv;
mv $PWD/07_green_j1_arc_02.csv $exedir/csv/07_green_j1_arc_02.csv;
mv $PWD/08_green_j2_arc_02.csv $exedir/csv/08_green_j2_arc_02.csv;
mv $PWD/10_green_sphere_03.csv $exedir/csv/10_green_sphere_03.csv;
mv $PWD/11_green_j1_arc_03.csv $exedir/csv/11_green_j1_arc_03.csv;
mv $PWD/12_green_j2_arc_03.csv $exedir/csv/12_green_j2_arc_03.csv;
mv $PWD/13_green_j3_line.csv $exedir/csv/13_green_j3_line.csv;
mv $PWD/14_green_j3_cylinder.csv $exedir/csv/14_green_j3_cylinder.csv;
mv $PWD/15_green_small_sphere_01.csv $exedir/csv/15_green_small_sphere_01.csv;
mv $PWD/16_green_small_sphere_02.csv $exedir/csv/16_green_small_sphere_02.csv;
mv $PWD/17_green_small_sphere_03.csv $exedir/csv/17_green_small_sphere_03.csv;
mv $PWD/18_green_small_sphere_04.csv $exedir/csv/18_green_small_sphere_04.csv;
mv $PWD/19_green_small_sphere_05.csv $exedir/csv/19_green_small_sphere_05.csv;
mv $PWD/20_green_small_sphere_06.csv $exedir/csv/20_green_small_sphere_06.csv;
mv $PWD/21_green_small_sphere_07.csv $exedir/csv/21_green_small_sphere_07.csv;
mv $PWD/22_green_small_sphere_08.csv $exedir/csv/22_green_small_sphere_08.csv;
mv $PWD/23_green_small_sphere_09.csv $exedir/csv/23_green_small_sphere_09.csv;

rm -rf $PWD/outputs_conversion/;
rm 02_green_sphere_01.bag;
rm 03_green_j1_arc_01.bag;
rm 04_green_j2_arc_01.bag;
rm 06_green_sphere_02.bag;
rm 07_green_j1_arc_02.bag;
rm 08_green_j2_arc_02.bag;
rm 10_green_sphere_03.bag;
rm 11_green_j1_arc_03.bag;
rm 12_green_j2_arc_03.bag;
rm 13_green_j3_line.bag;
rm 14_green_j3_cylinder.bag;
rm 15_green_small_sphere_01.bag;
rm 16_green_small_sphere_02.bag;
rm 17_green_small_sphere_03.bag;
rm 18_green_small_sphere_04.bag;
rm 19_green_small_sphere_05.bag;
rm 20_green_small_sphere_06.bag;
rm 21_green_small_sphere_07.bag;
rm 22_green_small_sphere_08.bag;
rm 23_green_small_sphere_09.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";
