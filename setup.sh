echo "*************************************************************"
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
catkin_make
echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "*************************************************************"
