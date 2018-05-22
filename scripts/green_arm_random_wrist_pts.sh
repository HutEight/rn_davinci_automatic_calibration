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

echo -e "\n  ${Underlined_t}GREEN ARM RANDOM WRIST POINTS SCRIPT${RS}\n"
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;


#############
echo -e "\n  Recording POINT#01 Data..\n"
rosbag record --duration=265 -O  01.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/01.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#01 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#02 Data..\n"
rosbag record --duration=265 -O  02.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/02.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#02 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#03 Data..\n"
rosbag record --duration=265 -O  03.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/03.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#03 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#04 Data..\n"
rosbag record --duration=265 -O  04.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/04.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#04 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#05 Data..\n"
rosbag record --duration=265 -O  05.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/05.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#05 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#06 Data..\n"
rosbag record --duration=265 -O  06.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/06.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#06 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#07 Data..\n"
rosbag record --duration=265 -O  07.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/07.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#07 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#08 Data..\n"
rosbag record --duration=265 -O  08.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/08.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#08 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#09 Data..\n"
rosbag record --duration=265 -O  09.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/09.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#09 Data Recording Complete!${RS}\n"

echo -e "\n  Recording POINT#10 Data..\n"
rosbag record --duration=265 -O  10.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20180319_psm1_random_wrists/10.jsp;
sleep 265;
echo -e "\n  ${Bold_t}POINT#10 Data Recording Complete!${RS}\n"


#############




scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/01.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/02.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/03.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/04.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/05.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/06.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/07.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/08.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/09.bag $PWD/outputs_conversion;

bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/10.bag $PWD/outputs_conversion;


echo -e "\t\033[1;37mConversion Complete!\033[0m";

mv $PWD/outputs_conversion/01/polaris_sensor/targets.csv $PWD/01.csv;
mv $PWD/outputs_conversion/02/polaris_sensor/targets.csv $PWD/02.csv;
mv $PWD/outputs_conversion/03/polaris_sensor/targets.csv $PWD/03.csv;

mv $PWD/outputs_conversion/04/polaris_sensor/targets.csv $PWD/04.csv;
mv $PWD/outputs_conversion/05/polaris_sensor/targets.csv $PWD/05.csv;
mv $PWD/outputs_conversion/06/polaris_sensor/targets.csv $PWD/06.csv;
mv $PWD/outputs_conversion/07/polaris_sensor/targets.csv $PWD/07.csv;

mv $PWD/outputs_conversion/08/polaris_sensor/targets.csv $PWD/08.csv;
mv $PWD/outputs_conversion/09/polaris_sensor/targets.csv $PWD/09.csv;
mv $PWD/outputs_conversion/10/polaris_sensor/targets.csv $PWD/10.csv;

echo -e "\033[1;37m\nPreprocessing data... \033[0m";

sed -i -e 's:/polaris_link,::g' $PWD/01.csv;
sed -i -e "1d" $PWD/01.csv;
sed -i -e 's:/polaris_link,::g' $PWD/02.csv;
sed -i -e "1d" $PWD/02.csv;
sed -i -e 's:/polaris_link,::g' $PWD/03.csv;
sed -i -e "1d" $PWD/03.csv;

sed -i -e 's:/polaris_link,::g' $PWD/04.csv;
sed -i -e "1d" $PWD/04.csv
sed -i -e 's:/polaris_link,::g' $PWD/05.csv;
sed -i -e "1d" $PWD/05.csv
sed -i -e 's:/polaris_link,::g' $PWD/06.csv;
sed -i -e "1d" $PWD/06.csv
sed -i -e 's:/polaris_link,::g' $PWD/07.csv;
sed -i -e "1d" $PWD/07csv
sed -i -e 's:/polaris_link,::g' $PWD/08.csv;
sed -i -e "1d" $PWD/08csv
sed -i -e 's:/polaris_link,::g' $PWD/09.csv;
sed -i -e "1d" $PWD/09csv
sed -i -e 's:/polaris_link,::g' $PWD/10.csv;
sed -i -e "1d" $PWD/10csv

echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);

mv $PWD/01.csv $exedir/csv/01.csv;
mv $PWD/02.csv $exedir/csv/02.csv;
mv $PWD/03.csv $exedir/csv/03.csv;

mv $PWD/04.csv $exedir/csv/04.csv;
mv $PWD/05.csv $exedir/csv/05.csv;
mv $PWD/06.csv $exedir/csv/06.csv;
mv $PWD/07.csv $exedir/csv/07.csv;

mv $PWD/08.csv $exedir/csv/08.csv;
mv $PWD/09.csv $exedir/csv/09.csv;
mv $PWD/10.csv $exedir/csv/10.csv;

rm -rf $PWD/outputs_conversion/;

rm 01.bag;
rm 02.bag;
rm 03.bag;

rm 04.bag;
rm 05.bag;
rm 06.bag;
rm 07.bag;

rm 08.bag;
rm 09.bag;
rm 10.bag;

echo -e "\033[1;34m\nRandom Points data acquired.\033[0m";

