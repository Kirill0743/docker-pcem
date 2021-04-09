FROM ubuntu

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y x11vnc xvfb firefox mesa-utils jwm xterm pcmanfm curl libsdl1.2-dev libopenal-dev libsdl2-dev libgl-dev libwxbase3.0-dev libwxgtk3.0-gtk3-dev gcc make build-essential
RUN mkdir ~/.vnc
RUN mkdir ~/pcem
ADD load.sh /load.sh
ADD start.sh /start.sh
RUN bash /load.sh

EXPOSE 5900
CMD    ["bash", "/start.sh"]
