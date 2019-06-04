cmake_minimum_required(VERSION 2.8.3)
project(multiple_robot_slam)

 add_compile_options(-std=c++11)
  add_definitions(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
    message_generation
    roscpp
    std_msgs
    gazebo_ros
)

#add_service_files(
#  FILES
#
#)

#add_message_files(
#  FILES
#
#)

generate_messages(
   DEPENDENCIES
   std_msgs
)

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs std_srvs sensor_msgs message_runtime gazebo_ros gazebo_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS} )

#add_executable(multiple_robot_slam src/multiple_robot_slam.cpp)
#target_link_libraries(multiple_robot_slam ${catkin_LIBRARIES})
#add_dependencies(multiple_robot_slam multiple_robot_slam_generate_messages_cpp)

#----- PLUGINS -----#

find_package(gazebo REQUIRED)
include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

add_library(hello_test script/hello.cpp)
target_link_libraries(hello_test ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})
