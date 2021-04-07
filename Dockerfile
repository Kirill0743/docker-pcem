# Yes, i'm testing with firefox

FROM ubuntu

RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN bash -c 'echo "firefox" >> /.bashrc'

EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]
