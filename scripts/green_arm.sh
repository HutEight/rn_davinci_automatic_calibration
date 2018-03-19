#!/bin/bash

echo -e "\033[1;37m\n\nDa Vinci automatic calibration- Right (\033[0;32mgreen\033[1;37m) arm.\n\n\t* Make sure arm movement space is clear. \n\t* Confirm that Polaris sensor is online in single-target mode and has a good view of the arm.\n\t* Confirm that Da Vinci is online and powered.\n\t* Confirm that marker is attatched to gripper tip.\n\nPress any key to begin.\033[0m";
read -rsp $'' -n1 key;


echo -e "\033[1;37m\nRecording sphere data... \033[0m";
rosbag record --duration=430 -O  sphere_g.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/green_sphere.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 440;

echo -e "\033[1;37m\nRecording arc 1 data... \033[0m";
rosbag record --duration=210 -O 1_g.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/green_1.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 220;

echo -e "\033[1;37m\nRecording arc 2 data... \033[0m";
rosbag record --duration=210 -O 2_g.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/sxh759/catkin_ws/src/automatic_calibration/play/jsp/green_2.jsp;
echo -e "\t\033[1;37mComplete!\033[0m";
sleep 220;


scrdir=$(rospack find rosbag_to_matlab);

echo -e "\033[1;37m\nConverting sphere data... \033[0m";
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/sphere_g.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nConverting arc 1 data... \033[0m";
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/1_g.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nConverting arc 2 data... \033[0m";
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/2_g.bag $PWD/outputs_conversion;
echo -e "\t\033[1;37mComplete!\033[0m";

mv $PWD/outputs_conversion/1_g/polaris_sensor/targets.csv $PWD/1_g.csv;
mv $PWD/outputs_conversion/2_g/polaris_sensor/targets.csv $PWD/2_g.csv;
mv $PWD/outputs_conversion/sphere_g/polaris_sensor/targets.csv $PWD/sphere_g.csv;


echo -e "\033[1;37m\nPreprocessing sphere data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/sphere_g.csv;
sed -i -e "1d" $PWD/sphere_g.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nPreprocessing arc 1 data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/1_g.csv;
sed -i -e "1d" $PWD/1_g.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nPreprocessing arc 2 data... \033[0m";
sed -i -e 's:/polaris_link,::g' $PWD/2_g.csv;
sed -i -e "1d" $PWD/2_g.csv;
echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";
exedir=$(rospack find automatic_calibration);
mv $PWD/sphere_g.csv $exedir/csv/sphere_g.csv;
mv $PWD/1_g.csv $exedir/csv/1_g.csv;
mv $PWD/2_g.csv $exedir/csv/2_g.csv;
rm -rf $PWD/outputs_conversion/;
rm sphere_g.bag;
rm 1_g.bag;
rm 2_g.bag;

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";
