#!/bin/bash
# JewSploit - Complete Installer & Application
# CachyOS Linux (Niri/Wayland) Compatible

echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    ⚡ JewSploit Installer ⚡              ║"
echo "║            Roblox Utility Tool - CachyOS Edition          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    echo "❌ Please don't run as root!"
    exit 1
fi

# Install system dependencies
echo "📦 Step 1: Installing system dependencies..."
sudo pacman -S --noconfirm python python-pip qt5-base qt5-webengine qt5-tools python-pyqt5 python-pyqt5-sip

# Install Python dependencies
echo "📦 Step 2: Installing Python dependencies..."
python3 -m pip install --user PyQtWebEngine

# Download the application from your GitHub repository
echo "📝 Step 3: Downloading JewSploit application..."
curl -o ~/jewsploit.py https://raw.githubusercontent.com/zew0o0w/jewsploit/main/jewsploit.py

# Make it executable
chmod +x ~/jewsploit.py

echo "📝 Step 4: Creating launcher script..."
cat > ~/jewsploit.sh << 'EOF'
#!/bin/bash
echo "⚡ Starting JewSploit..."
export QT_QPA_PLATFORM=xcb
export QT_AUTO_SCREEN_SCALE_FACTOR=1
python3 ~/jewsploit.py "$@"
EOF

chmod +x ~/jewsploit.sh

echo ""
echo "✅ Installation complete!"
echo "🚀 To run JewSploit: ./jewsploit.sh"
echo ""

# Optional: Test the installation
echo "🔍 Testing installation..."
python3 -c "from PyQt5 import QtWidgets, QtCore, QtGui; print('✅ PyQt5 imported successfully')" 2>/dev/null || {
    echo "⚠️ PyQt5 import test failed. Trying to fix..."
    python3 -m pip install --user PyQt5 PyQt5-sip PyQtWebEngine --upgrade
}

echo ""
echo "✨ JewSploit is ready to use!"
echo "⚡ Happy injecting!"
