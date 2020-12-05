# Ubuntu NordVPN Indicator
This repository allows for the installation of a Python script that adds an application indicator for NordVPN. NordVPN does not seem to provide such a program and only offers terminal access or an OpenVPN configuration. The indicator is placed with the other GNOME App Indicators and allows for connecting and disconnecting to NordVPN. A screenshot is shown below:
![alt text](https://raw.githubusercontent.com/yorickvanzweeden/Ubuntu-NordVPN-Indicator/master/screenshot.png "Screenshot")


## Installation
### Dependencies
  - The official NordVPN client must be [installed](https://nordvpn.com/download/linux/%22).
  - Ubuntu packages: `sudo apt-get install -y gir1.2-appindicator python3-gi`

Run the installation script `install.sh`. This will install the application into
`$HOME/.local/opt/`.
> ./install.sh

The install script will also add an entry into `$HOME/.config/autostart`.

## Running
The app can be run as `python3 nordvpn_indicator.py`. When it is running, the status of the VPN is checked every 3 seconds. The icon is set based on whether the VPN is disconnected ![alt text](code/nordvpn_disconnected.png "Disconnected logo") or connected  ![alt text](code/nordvpn_connected.png "Connected logo").

## Uninstallation
Run the uninstallation script ```uninstall.sh``` to remove this program.
> ./uninstall.sh
