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
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;

#############
echo -e "\n  ${Bold_t}${Green_t}Please remove the tape!${NC}${RS}"
echo -e "  After that, ${Bold_t}${Green_t}press any key${NC}${RS} to proceed.\n"
read -rsp $'' -n1 key;


rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/1a.jsp;
sleep 10;
echo -e "\n  ${Bold_t}Armed moved to Small spheres prepose${RS}\n"
#############
echo -e "\n  Recording Small Sphere Data 01..\n"
echo -e "Reading playfile: 1_small_sphere.jsp"
rosbag record --duration=200 -O  1_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/1_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 01 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 02..\n"
echo -e "Reading playfile: 2_small_sphere.jsp"
rosbag record --duration=200 -O  2_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/2_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 02 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 03..\n"
echo -e "Reading playfile: 3_small_sphere.jsp"
rosbag record --duration=200 -O  3_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/3_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 03 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 04..\n"
echo -e "Reading playfile: 4_small_sphere.jsp"
rosbag record --duration=200 -O  4_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/4_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 04 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 05..\n"
echo -e "Reading playfile: 5_small_sphere.jsp"
rosbag record --duration=200 -O  5_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/5_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 05 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 06..\n"
echo -e "Reading playfile: 6_small_sphere.jsp"
rosbag record --duration=200 -O  6_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/6_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 06 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 07..\n"
echo -e "Reading playfile: 7_small_sphere.jsp"
rosbag record --duration=200 -O  7_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/7_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 07 Recording Complete!${RS}\n"


echo -e "\n  Recording Small Sphere Data 08..\n"
echo -e "Reading playfile: 8_small_sphere.jsp"
rosbag record --duration=200 -O  8_small_sphere.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180806_Qulaity_test_small_spheres_playfiles_PSM2/8_small_sphere.jsp;
sleep 200;
echo -e "\n  ${Bold_t}Small Sphere Data 08 Recording Complete!${RS}\n"


#############


scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";


bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/1_small_sphere.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/2_small_sphere.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/3_small_sphere.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/4_small_sphere.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/5_small_sphere.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/6_small_sphere.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/7_small_sphere.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/8_small_sphere.bag $PWD/outputs_conversion;

echo -e "\t\033[1;37mConversion Complete!\033[0m";



mv $PWD/outputs_conversion/1_small_sphere/polaris_sensor/targets.csv $PWD/1_small_sphere.csv;
mv $PWD/outputs_conversion/2_small_sphere/polaris_sensor/targets.csv $PWD/2_small_sphere.csv;

mv $PWD/outputs_conversion/3_small_sphere/polaris_sensor/targets.csv $PWD/3_small_sphere.csv;
mv $PWD/outputs_conversion/4_small_sphere/polaris_sensor/targets.csv $PWD/4_small_sphere.csv;
mv $PWD/outputs_conversion/5_small_sphere/polaris_sensor/targets.csv $PWD/5_small_sphere.csv;
mv $PWD/outputs_conversion/6_small_sphere/polaris_sensor/targets.csv $PWD/6_small_sphere.csv;

mv $PWD/outputs_conversion/7_small_sphere/polaris_sensor/targets.csv $PWD/7_small_sphere.csv;
mv $PWD/outputs_conversion/8_small_sphere/polaris_sensor/targets.csv $PWD/8_small_sphere.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";



sed -i -e 's:/polaris_link,::g' $PWD/1_small_sphere.csv;
sed -i -e "1d" $PWD/1_small_sphere.csv;
sed -i -e 's:/polaris_link,::g' $PWD/2_small_sphere.csv;
sed -i -e "1d" $PWD/2_small_sphere.csv;

sed -i -e 's:/polaris_link,::g' $PWD/3_small_sphere.csv;
sed -i -e "1d" $PWD/3_small_sphere.csv
sed -i -e 's:/polaris_link,::g' $PWD/4_small_sphere.csv;
sed -i -e "1d" $PWD/4_small_sphere.csv
sed -i -e 's:/polaris_link,::g' $PWD/5_small_sphere.csv;
sed -i -e "1d" $PWD/5_small_sphere.csv
sed -i -e 's:/polaris_link,::g' $PWD/6_small_sphere.csv;
sed -i -e "1d" $PWD/6_small_sphere.csv

sed -i -e 's:/polaris_link,::g' $PWD/7_small_sphere.csv;
sed -i -e "1d" $PWD/7_small_sphere.csv
sed -i -e 's:/polaris_link,::g' $PWD/8_small_sphere.csv;
sed -i -e "1d" $PWD/8_small_sphere.csv

echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


mv $PWD/1_small_sphere.csv $exedir/csv/1_small_sphere.csv;
mv $PWD/2_small_sphere.csv $exedir/csv/2_small_sphere.csv;

mv $PWD/3_small_sphere.csv $exedir/csv/3_small_sphere.csv;
mv $PWD/4_small_sphere.csv $exedir/csv/4_small_sphere.csv;
mv $PWD/5_small_sphere.csv $exedir/csv/5_small_sphere.csv;
mv $PWD/6_small_sphere.csv $exedir/csv/6_small_sphere.csv;

mv $PWD/7_small_sphere.csv $exedir/csv/7_small_sphere.csv;
mv $PWD/8_small_sphere.csv $exedir/csv/8_small_sphere.csv;


rm -rf $PWD/outputs_conversion/;


rm 1_small_sphere.bag;
rm 2_small_sphere.bag;

rm 3_small_sphere.bag;
rm 4_small_sphere.bag;
rm 5_small_sphere.bag;
rm 6_small_sphere.bag;

rm 7_small_sphere.bag;
rm 8_small_sphere.bag;


echo -e "\033[1;34m\nCalibration data acquired.\033[0m";

