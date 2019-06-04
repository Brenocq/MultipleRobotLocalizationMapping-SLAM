#ifndef GAZEBO_ROS_LINEAR_LASER_H
#define GAZEBO_ROS_LINEAR_LASER_H

#include <string>

// library for processing the Ray sensor data for gazebo
#include <gazebo/plugins/RaySensor.hh>

namespace gazebo
{
  class LinearLaser : public RaySensor
  {
    public:
      LinearLaser();
      ~LinearLaser();

    /// brief Load the plugin
    /// param take in SDF root element
      void Load(sensors::SensorPtr _parent, sdf::ElementPtr _sdf);

    /// brief Update the controller
    protected: virtual void OnNewFrame(const unsigned char *_image,
    unsigned int _width, unsigned int _height,
    unsigned int _depth, const std::string &_format);

    ros::NodeHandle _nh;
    ros::Publisher sensorPublisher;

    double _fov;
    double _range;
  };
}
#endif// GAZEBO_ROS_LINEAR_LASER_H
