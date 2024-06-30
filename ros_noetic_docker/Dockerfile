# Use the official ROS Noetic base image
FROM ros:noetic-ros-base

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

# Setup environment
ENV ROS_WS=/ros_ws

# Create a workspace
RUN mkdir -p $ROS_WS/src

# Set the working directory
WORKDIR $ROS_WS

# Initialize catkin workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin init"

# Build workspace (empty build initially to create necessary files)
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin build"

# Source the setup file
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /ros_ws/devel/setup.bash" >> ~/.bashrc
