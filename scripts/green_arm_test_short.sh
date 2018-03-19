#!/bin/bash

echo -e "\033[1;37m\n\nDa Vinci automatic calibration- Right (\033[0;32mgreen\033[1;37m) arm.\n\n\t* Make sure arm movement space is clear. \n\t* Confirm that Polaris sensor is online in single-target mode and has a good view of the arm.\n\t* Confirm that Da Vinci is online and powered.\n\t* Confirm that marker is attatched to gripper tip.\n\nPress any key to begin.\033[0m";
read -rsp $'' -n1 key;

echo -e "\033[1;37m\nStarting the test... \033[0m";
rosbag record --duration=10 -O 1_g_test_short.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/tes77/ros_ws/src/automatic_calibration/play/jsp/green_1_test_short.jsp;
echo -e "\t\033[1;37mPlayfile loading Complete!\033[0m";
sleep 10;


scrdir=$(rospack find rosbag_to_matlab);



echo -e "\033[1;37m\nConverting sphere data... \033[0m";
bash /home/tes77/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/1_g_test_short.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

mv $PWD/outputs_conversion/1_g_test_short/polaris_sensor/targets.csv $PWD/1_g_test_short.csv;

echo -e "\033[1;37m\nPreprocessing arc 1 test data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/1_g_test_short.csv;
sed -i -e "1d" $PWD/1_g_test_short.csv;
echo -e "\t\033[1;37mComplete!\033[0m";


echo -e "\033[1;37m\nCleaning up.\033[0m";
exedir=$(rospack find automatic_calibration);

mv $PWD/1_g_test_short.csv $exedir/csv/1_g_test_short.csv;

rm -rf $PWD/outputs_conversion/;

rm 1_g_test_short.bag;


echo -e "\033[1;34m\nCalibration data acquired.\033[0m";
