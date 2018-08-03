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

echo -e "\n  ${Underlined_t}GREEN ARM ACCURACY TEST DATA ACQUISITION${RS}\n"
echo -e "${Bold_t}Da Vinci automatic calibration--Right (\033[0;32mgreen\033[1;37m) arm.${RS}"
echo -e "\n${Bold_t}${Green_t}      Press any key to begin.${RS}${NC}\n\n"
read -rsp $'' -n1 key;

#############

#############
# @ UPDATE GROUP 1 (2 + 1 + 2)
echo -e "\n  Recording Cube#1 Speed: 0.005 m/s ---\n"
rosbag record --duration=305 -O  psm1_pts_generated_cube_spd_0005.bag /polaris_sensor/stray_markers  &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/20180803_psm1_acccuracy/psm1_pts_generated_cube_spd_0005.psp;
sleep 305;
echo -e "\n  ${Bold_t}Recording Complete!${RS}\n"


echo -e "\n  Recording Cube#1 Speed: 0.01 m/s ---\n"
rosbag record --duration=225 -O  psm1_pts_generated_cube_spd_001.bag /polaris_sensor/stray_markers  &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/20180803_psm1_acccuracy/psm1_pts_generated_cube_spd_001.psp;
sleep 225;
echo -e "\n  ${Bold_t}Recording Complete!${RS}\n"


echo -e "\n  Recording Cube#1 Speed: 0.015 m/s ---\n"
rosbag record --duration=200 -O  psm
1_pts_generated_cube_spd_0015.bag /polaris_sensor/stray_markers  &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/20180803_psm1_acccuracy/psm1_pts_generated_cube_spd_0015.psp;
sleep 200;
echo -e "\n  ${Bold_t}Recording Complete!${RS}\n"


echo -e "\n  Recording Cube#1 Speed: 0.03 m/s ---\n"
rosbag record --duration=173 -O  psm1_pts_generated_cube_spd_003.bag /polaris_sensor/stray_markers  &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/20180803_psm1_acccuracy/psm1_pts_generated_cube_spd_003.psp;
sleep 173;
echo -e "\n  ${Bold_t}Recording Complete!${RS}\n"


echo -e "\n  Recording Cube#1 Speed: 0.06 m/s ---\n"
rosbag record --duration=160 -O  psm1_pts_generated_cube_spd_006.bag /polaris_sensor/stray_markers  &
rosrun cwru_davinci_playfile playback_portalspace /home/sxh759/catkin_ws/src/automatic_calibration/play/psp/20180803_psm1_acccuracy/psm1_pts_generated_cube_spd_006.psp;
sleep 160;
echo -e "\n  ${Bold_t}Recording Complete!${RS}\n"
#############


scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";

#############
# @ UPDATE GROUP 2 (1)
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/psm1_pts_generated_cube_spd_0005.bag $PWD/outputs_conversion;
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/psm1_pts_generated_cube_spd_001.bag $PWD/outputs_conversion;  
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/psm1_pts_generated_cube_spd_0015.bag $PWD/outputs_conversion;  
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/psm1_pts_generated_cube_spd_003.bag $PWD/outputs_conversion;  
bash /home/sxh759/catkin_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/psm1_pts_generated_cube_spd_006.bag $PWD/outputs_conversion; 



#############

echo -e "\t\033[1;37mConversion Complete!\033[0m";


#############
# @ UPDATE GROUP 3 (2)
mv $PWD/outputs_conversion/psm1_pts_generated_cube_spd_0005/polaris_sensor/stray_markers.csv $PWD/psm1_pts_generated_cube_spd_0005.csv;
mv $PWD/outputs_conversion/psm1_pts_generated_cube_spd_001/polaris_sensor/stray_markers.csv $PWD/psm1_pts_generated_cube_spd_001.csv;
mv $PWD/outputs_conversion/psm1_pts_generated_cube_spd_0015/polaris_sensor/stray_markers.csv $PWD/psm1_pts_generated_cube_spd_0015.csv;
mv $PWD/outputs_conversion/psm1_pts_generated_cube_spd_003/polaris_sensor/stray_markers.csv $PWD/psm1_pts_generated_cube_spd_003.csv;
mv $PWD/outputs_conversion/psm1_pts_generated_cube_spd_006/polaris_sensor/stray_markers.csv $PWD/psm1_pts_generated_cube_spd_006.csv;




#############

echo -e "\033[1;37m\nPreprocessing data... \033[0m";


#############
# @ UPDATE GROUP 4 (2)
sed -i -e 's:/polaris_link,::g' $PWD/psm1_pts_generated_cube_spd_0005.csv;
sed -i -e "1d" $PWD/psm1_pts_generated_cube_spd_0005.csv;

sed -i -e 's:/polaris_link,::g' $PWD/psm1_pts_generated_cube_spd_001.csv;
sed -i -e "1d" $PWD/psm1_pts_generated_cube_spd_001.csv;

sed -i -e 's:/polaris_link,::g' $PWD/psm1_pts_generated_cube_spd_0015.csv;
sed -i -e "1d" $PWD/psm1_pts_generated_cube_spd_0015.csv;

sed -i -e 's:/polaris_link,::g' $PWD/psm1_pts_generated_cube_spd_003.csv;
sed -i -e "1d" $PWD/psm1_pts_generated_cube_spd_003.csv;

sed -i -e 's:/polaris_link,::g' $PWD/psm1_pts_generated_cube_spd_006.csv;
sed -i -e "1d" $PWD/psm1_pts_generated_cube_spd_006.csv;

#############


echo -e "\t\033[1;37mComplete!\033[0m";

echo -e "\033[1;37m\nCleaning up.\033[0m";

exedir=$(rospack find automatic_calibration);


#############
# @ UPDATE GROUP 5 (2)

mv $PWD/psm1_pts_generated_cube_spd_0005.csv $exedir/csv/psm1_pts_generated_cube_spd_0005.csv;

mv $PWD/psm1_pts_generated_cube_spd_001.csv $exedir/csv/psm1_pts_generated_cube_spd_001.csv;

mv $PWD/psm1_pts_generated_cube_spd_0015.csv $exedir/csv/psm1_pts_generated_cube_spd_0015.csv;

mv $PWD/psm1_pts_generated_cube_spd_003.csv $exedir/csv/psm1_pts_generated_cube_spd_003.csv;

mv $PWD/psm1_pts_generated_cube_spd_006.csv $exedir/csv/psm1_pts_generated_cube_spd_006.csv;


#############

rm -rf $PWD/outputs_conversion/;



#############
# @ UPDATE GROUP 6 (1)
rm psm1_pts_generated_cube_spd_0005.bag;
rm psm1_pts_generated_cube_spd_001.bag;
rm psm1_pts_generated_cube_spd_0015.bag;
rm psm1_pts_generated_cube_spd_003.bag;
rm psm1_pts_generated_cube_spd_006.bag;


#############

echo -e "\033[1;34m\nCalibration data acquired.\033[0m";

