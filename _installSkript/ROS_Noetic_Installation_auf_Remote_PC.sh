# Basiert auf ROS_Melodic_Installation_auf_Remote_PC.sh
# von OJ fuer robotik.bocholt@w-hs.de
# SS2020


# ROS auf einem Rechner mit Ubuntu Focal 20.04 installieren
# EMR SS2020 Hebinck, Heid

#!/bin/bash

echo -e "\033[34m ---------- ROS installieren und Workspace einrichten  ------------ \033[0m "

sudo apt-get dist-upgrade

echo -e "\033[34m ---------- Installiere ROS-Noetic  http://wiki.ros.org/noetic/Installation/Ubuntu  ------------ \033[0m "
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y ros-noetic-desktop-full

echo -e "\033[34m ---------- Erstelle catkin_ws  ------------ \033[0m "
mkdir -p ~/catkin_ws/src
mkdir -p ~/catkin_ws/devel
touch ~/catkin_ws/devel/setup.bash


echo -e "\033[34m ---------- Konfiguriere .bashrc ------------ \033[0m "

echo "export LC_NUMERIC="en_US.UTF-8"" >> ~/.bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "export ROS_PACKAGE_PATH=~/catkin_ws/src:/opt/ros/noetic/share" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=127.0.0.1" >> ~/.bashrc
source ~/.bashrc

echo -e "\033[34m ---------- Dependencies for building packages ------------ \033[0m "
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update

echo -e "\033[34m ---------- Installation finished ------------ \033[0m "


