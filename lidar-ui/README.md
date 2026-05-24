# LiDAR Simple UI (for beginner)

This folder contains a simple web UI to visualize ROS2 `/scan` from RPLidar.

## A) Run on Raspberry Pi (SSH terminal)

Open terminal on Mac:

```bash
ssh creative@robotpi.local
```

Start LiDAR:

```bash
source /opt/ros/jazzy/setup.bash
source ~/ros2_ws/install/setup.bash
ros2 launch rplidar_ros rplidar_a1_launch.py
```

Open second SSH terminal to Pi, start rosbridge:

```bash
ssh creative@robotpi.local
source /opt/ros/jazzy/setup.bash
source ~/ros2_ws/install/setup.bash
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```

If package is missing once:

```bash
sudo apt update
sudo apt install ros-jazzy-rosbridge-server -y
```

## B) Run UI on your Mac (CAR folder)

From Mac terminal:

```bash
cd /Users/sahithsambodhi/Desktop/CAR/lidar-ui
python3 -m http.server 8080
```

Open browser:

- `http://127.0.0.1:8080`

In page:

- WebSocket URL should be `ws://192.168.1.181:9090`
- Click `Connect`

## C) Quick checks

On Pi:

```bash
ros2 topic list | grep /scan
```

On Mac:

```bash
nc -vz 192.168.1.181 9090
```

If `nc` fails, it is network/firewall issue between Mac and Pi.
