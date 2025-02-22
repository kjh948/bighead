# bighead

1. bringup
 1.1 source all env variables
 1.2 ros2 launch omo_r1mini_bringup omo_r1mini_mcu.launch.py or ros2 launch omo_r1mini_bringup omo_r1mini_bringup.launch.py
 1.3 ros2 run omo_r1mini_teleop teleop_keyboard
2. run slam
 2.1 ros2 launch omo_r1mini_cartographer cartographer.launch.py
3. remote pc 
 2.1 ros2 launch omo_r1mini_cartographer cartographer_rviz.launch.py
 2.2 ros2 run nav2_map_server map_saver_cli -f map

4. nav2
 4.1 ros2 launch omo_r1mini_navigation2 navigation2.launch.py map:=$HOME/map.yaml
 4.1 ros2 launch omo_r1mini_navigation2 navigation2_rviz.launch.py @ remote pc

#env
export DISPLAY=:0


#ref
https://t-shaped-person.tistory.com/198