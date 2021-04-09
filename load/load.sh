cd ~/pcem
curl -o pcem.tar.gz https://www.pcem-emulator.co.uk/files/PCemV17Linux.tar.gz
tar -xvf pcem.tar.gz
./configure --enable-release-build
make
