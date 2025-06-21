FROM debian:latest

# USEFUL PACKAGES
RUN apt-get update
RUN apt-get install -y git wget sudo curl nano vim unzip
RUN apt-get install -y gcc make gdb clang valgrind lldb
RUN apt-get install -y libxext-dev libbsd-dev libx11-dev libreadline-dev
RUN apt-get install -y xfce4 xfce4-terminal xterm tigervnc-standalone-server novnc websockify net-tools dbus-x11
RUN apt-get install -y python3 python3-dev python3-pip python3-venv
RUN apt-get install -y imagemagick
RUN python3 -m pip install norminette --break-system-packages

# SETUP
RUN mkdir -p /home/user /home/user/outside
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "PS1='\\[\\e[0;32m\\]\\u@\\h:\\[\\e[0;34m\\]\\w\\$ \\[\\e[m\\]'" >> /home/user/.bashrc
RUN echo "PS1='\\[\\e[0;31m\\]\\u@\\h:\\[\\e[0;34m\\]\\w\\$ \\[\\e[m\\]'" >> /root/.bashrc

# WALLPAPER SETUP
COPY wallpapers/ /home/user/wallpapers/
RUN mkdir -p /home/user/.config/xfce4/xfconf/xfce-perchannel-xml
RUN cp /home/user/wallpapers/oms.jpg /usr/share/backgrounds/default

# VNC SETUP
RUN mkdir -p /home/user/.vnc
RUN touch /home/user/.Xresources
COPY xstartup /home/user/.vnc/xstartup
RUN chmod +x /home/user/.vnc/xstartup
RUN echo 'alias vnc="mkdir -p ~/.vnc && echo pagman | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd && vncserver -kill :1 2>/dev/null || true && vncserver :1 -geometry 1280x800 -depth 24 -localhost no && websockify -D --web=/usr/share/novnc/ 1143 localhost:5901 && echo \"VNC server started. Go to http://localhost:1143/vnc.html?resize=scale&quality=9\" and use the password \"pagman\" to access." && xrandr --output VNC-0 --mode 1920x1080 && xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /home/user/wallpapers/oms.jpg && xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/image-style -s 5' >> /home/user/.bashrc

# USER
RUN useradd -m user
RUN chown -R user:user /home/user
RUN chsh -s /bin/bash user
USER user
WORKDIR /home/user