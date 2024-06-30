# Use the official ROS 2 Humble desktop full image
FROM osrf/ros:humble-desktop-full

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# Setup environment
ENV ROS_WS=/ros2_ws

# Create a workspace
RUN mkdir -p $ROS_WS/src

# Set the working directory
WORKDIR $ROS_WS

# Initialize workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

# Source the setup file
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

