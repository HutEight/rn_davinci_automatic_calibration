#!/bin/bash

echo -e "\033[1;37m\n\nDa Vinci automatic calibration- Right (\033[0;33myellow\033[1;37m) arm.\n\n\t* Make sure arm movement space is clear. \n\t* Confirm that Polaris sensor is online in single-target mode and has a good view of the arm.\n\t* Confirm that Da Vinci is online and powered.\n\t* Confirm that marker is attatched to gripper tip.\n\nPress any key to begin.\033[0m";
read -rsp $'' -n1 key;


echo -e "\033[1;37m\nRecording sphere data... \033[0m";
rosbag record --duration=430 -O  sphere_y.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/tes77/ros_ws/src/automatic_calibration/play/jsp/yellow_sphere.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 440;

echo -e "\033[1;37m\nRecording arc 1 data... \033[0m";
rosbag record --duration=210 -O 1_y.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/tes77/ros_ws/src/automatic_calibration/play/jsp/yellow_1.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 220;

echo -e "\033[1;37m\nRecording arc 2 data... \033[0m";
rosbag record --duration=210 -O 2_y.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/tes77/ros_ws/src/automatic_calibration/play/jsp/yellow_2.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 220;


scrdir=$(rospack find rosbag_to_matlab);

echo -e "\033[1;37m\nConverting sphere data... \033[0m";
bash $scrdir/scripts/bag_to_csv.sh $PWD/sphere_y.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nConverting arc 1 data... \033[0m";
bash $scrdir/scripts/bag_to_csv.sh $PWD/1_y.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nConverting arc 2 data... \033[0m";
bash $scrdir/scripts/bag_to_csv.sh $PWD/2_y.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

mv $PWD/outputs_conversion/1_y/polaris_sensor/targets.csv $PWD/1_y.csv;
mv $PWD/outputs_conversion/2_y/polaris_sensor/targets.csv $PWD/2_y.csv;
mv $PWD/outputs_conversion/sphere_y/polaris_sensor/targets.csv $PWD/sphere_y.csv;


echo -e "\033[1;37m\nPreprocessing sphere data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/sphere_y.csv;
sed -i -e "1d" $PWD/sphere_y.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nPreprocessing arc 1 data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/1_y.csv;
sed -i -e "1d" $PWD/1_y.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nPreprocessing arc 2 data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/2_y.csv;
sed -i -e "1d" $PWD/2_y.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";
rm -rf $PWD/outputs_conversion/;
exedir=$(rospack find automatic_calibration);
mv $PWD/sphere_y.csv $exedir/csv/sphere_y.csv;
mv $PWD/1_y.csv $exedir/csv/1_y.csv;
mv $PWD/2_y.csv $exedir/csv/2_y.csv;
rm sphere_y.bag;
rm 1_y.bag;
rm 2_y.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";
