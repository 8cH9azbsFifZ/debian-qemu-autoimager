#!/bin/bash

# Wine
apt-get update && apt-get -y install gettext-base tigervnc-standalone-server dbus-x11 novnc python3-websockify python3-pip wsjtx xfce4 xdotool wget tar net-tools gnupg2 procps unzip exe-thumbnailer zenity winetricks innoextract

echo VNC Password
mkdir /root/.vnc 
echo "geheim" | vncpasswd -f > /root/.vnc/passwd
chmod 0600 /root/.vnc/passwd

# Wine 32
dpkg --add-architecture i386 && apt update && apt -y install wine32
WINEARCH=win32 winecfg

# Autostarter
#!/bin/bash
tigervncserver -xstartup /usr/bin/xfce4-session -geometry 800x600 -localhost no :1
#envsubst < /WSJT-X.template.ini > /root/.config/WSJT-X.ini
#cat /root/.config/WSJT-X.ini
#DISPLAY=:1 /usr/bin/wsjtx &
/usr/bin/websockify 8080 localhost:5901 --web=/usr/share/novnc/ 

