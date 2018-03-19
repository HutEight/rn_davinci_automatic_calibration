#!/bin/bash

echo -e "\033[1;37m\n\n\033[1;31mROYAL AIR FORCE\033[1;37m \n---------------\nPSM1 (\033[0;32mgreen arm\033[1;37m) power cycle repeatibility test\n11/12/17 \n\n\tPress any key to begin.\033[0m";

read -rsp $'' -n1 key;

echo -e "\033[1;37m\nStarting the test... \033[0m";
rosbag record --duration=110 -O power_cycle_test.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/20171211_power_cycle_test.jsp;
echo -e "\t\033[1;37mPlayfile loading Complete!\033[0m";
sleep 115;

scrdir=$(rospack find rosbag_to_matlab);


echo -e "\033[1;37m\nConverting rosbag data to a .csv file... \033[0m";
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/power_cycle_test.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

mv $PWD/outputs_conversion/power_cycle_test/polaris_sensor/targets.csv $PWD/power_cycle_test.csv;

echo -e "\033[1;37m\nPreprocessing arc 1 test data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/power_cycle_test.csv;
sed -i -e "1d" $PWD/power_cycle_test.csv;
echo -e "\t\033[1;37mComplete!\033[0m";


echo -e "\033[1;37m\nCleaning up.\033[0m";
exedir=$(rospack find automatic_calibration);

mv $PWD/power_cycle_test.csv $exedir/csv/power_cycle_test.csv;

rm -rf $PWD/outputs_conversion/;

rm power_cycle_test.bag;


echo -e "\033[1;34m\nCalibration data acquired.\033[0m";
