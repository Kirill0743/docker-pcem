# Yes, i'm testing with firefox

FROM ubuntu

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y x11vnc xvfb firefox mesa-utils jwm xterm pcmanfm curl libsdl1.2-dev libopenal-dev libsdl2-dev libgl-dev libwxbase3.0-dev gcc make build-essential
RUN mkdir ~/.vnc
RUN mkdir ~/pcem
RUN bash -c 'touch /start'
RUN bash -c 'chmod 755 /start'
RUN bash -c 'touch /load'
RUN bash -c 'chmod 755 /load'
RUN bash -c 'echo "cd ~/pcem" >> /load'
RUN bash -c 'echo "curl -o pcem.tar.gz https://www.pcem-emulator.co.uk/files/PCemV17Linux.tar.gz" >> /load'
RUN bash -c 'echo "tar -xvf pcem.tar.gz" >> /load'
RUN bash /load
RUN bash -c 'echo "export DISPLAY=:0" >> /start'
RUN bash -c 'echo "Xvfb :0 -screen 0 1280x1024x24&" >> /start'
RUN bash -c 'echo "jwm&" >> /start'
RUN bash -c 'echo "firefox&" >> /start'
RUN bash -c 'echo "pcmanfm&" >> /start'
RUN bash -c 'echo "x11vnc -rfbport 5900" >> /start'

EXPOSE 5900
CMD    ["bash", "/start"]
