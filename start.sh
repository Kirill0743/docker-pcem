export DISPLAY=:0
Xvfb :0 -screen 0 1280x1024x24&
jwm&
firefox&
pcmanfm&
x11vnc -rfbport 5900
