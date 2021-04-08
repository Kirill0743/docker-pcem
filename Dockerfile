# Yes, i'm testing with firefox

FROM ubuntu

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y x11vnc xvfb firefox mesa-utils jwm xterm pcmanfm curl
RUN mkdir ~/.vnc
RUN mkdir ~/pcem
RUN bash -c 'touch /start'
RUN bash -c 'chmod 755 /start'
RUN bash -c 'echo "cd ~/pcem" >> /start'
RUN bash -c 'echo "curl -o pcem.tar.gz https://www.pcem-emulator.co.uk/files/PCemV17Linux.tar.gz" >> /start'
RUN bash -c 'echo "tar -xvf pcem.tar.gz" >> /start'
RUN bash -c 'echo "export DISPLAY=:0" >> /start'
RUN bash -c 'echo "Xvfb :0 -screen 0 1280x1024x24&" >> /start'
RUN bash -c 'echo "jwm&" >> /start'
RUN bash -c 'echo "firefox&" >> /start'
RUN bash -c 'echo "pcmanfm&" >> /start'
RUN bash -c 'echo "x11vnc -rfbport 5900" >> /start'

EXPOSE 5900
CMD    ["bash", "/start"]
