
echo -e "${Bold_t}  PRESS ANY KEY TO START DATA COLLECTION.${RS}"
read -rsp $'' -n1 key;


echo -e "\n  Recording Joint 5 Arc..\n"
echo -e "Reading playfile: 09_green_j5_arc_01_at_j3_14cm.jsp"
rosbag record --duration=20 -O  09_green_j5_arc_01_at_j3_14cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/09_green_j5_arc_01_at_j3_14cm.jsp;
sleep 30;
echo -e "\n  ${Bold_t}Joint 5 Acc Data Recording Complete!${RS}\n"


echo -e "\n  Recording Joint 6 Arc..\n"
echo -e "Reading playfile: 10_green_j6_arc_01_at_j3_14cm.jsp"
rosbag record --duration=20 -O  10_green_j6_arc_01_at_j3_14cm.bag /polaris_sensor/targets &
rosrun cwru_davinci_playfile playback_jointspace /home/dvu/ros_ws/src/automatic_calibration/play/jsp/PSM1_intrinsic_calibration_playfiles_for_tool_mk_xi/02_intrinsic_j4_0_deg_PSM1/10_green_j6_arc_01_at_j3_14cm.jsp;
sleep 30;
echo -e "\n  ${Bold_t}Joint 6 Acc Data Recording Complete!${RS}\n"



scrdir=$(rospack find rosbag_to_matlab);
echo -e "\033[1;37m\nConverting rosbag data... \033[0m";

bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/09_green_j5_arc_01_at_j3_14cm.bag $PWD/outputs_conversion;
bash /home/dvu/ros_ws/src/rosbag_to_matlab/scripts/bag_to_csv.sh $PWD/10_green_j6_arc_01_at_j3_14cm.bag $PWD/outputs_conversion;   


mv $PWD/outputs_conversion/09_green_j5_arc_01_at_j3_14cm/polaris_sensor/targets.csv $PWD/09_green_j5_arc_01_at_j3_14cm.csv;
mv $PWD/outputs_conversion/10_green_j6_arc_01_at_j3_14cm/polaris_sensor/targets.csv $PWD/10_green_j6_arc_01_at_j3_14cm.csv;

sed -i -e 's:/polaris_link,::g' $PWD/09_green_j5_arc_01_at_j3_14cm.csv;
sed -i -e "1d" $PWD/09_green_j5_arc_01_at_j3_14cm.csv
sed -i -e 's:/polaris_link,::g' $PWD/10_green_j6_arc_01_at_j3_14cm.csv;
sed -i -e "1d" $PWD/10_green_j6_arc_01_at_j3_14cm.csv


exedir=$(rospack find automatic_calibration);

mv $PWD/09_green_j5_arc_01_at_j3_14cm.csv $exedir/csv/09_green_j5_arc_01_at_j3_14cm.csv;
mv $PWD/10_green_j6_arc_01_at_j3_14cm.csv $exedir/csv/10_green_j6_arc_01_at_j3_14cm.csv;

rm 09_green_j5_arc_01_at_j3_14cm.bag;
rm 10_green_j6_arc_01_at_j3_14cm.bag;



