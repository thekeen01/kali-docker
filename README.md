# kali-docker

# What is it

This is a simple example to build a kali docker with tmux to allow multiple panes in one terminal. The helper script tm.sh launches tmux with the terminal split in 4 equal terminals. This is a starting point where you will need to modify the Dockerfile to install all the packages you would use regularly. This has been tested to work with openvpn and HTB to confirm that all networking is good to go.

# Building

git clone https://github.com/thekeen01/kali-docker.git

cd kali-docker

docker build -t kaliterm .

# To run

this will allow you to run the actual vpn inside the docker and everything stays in the docker

docker run --rm --cap-add=NET_ADMIN -v /dev/net/tun:/dev/net/tun -v /some/path/to/local:/local -it kaliterm

adjust /some/path/to/local to a local folder that you want to share as /local in the docker for easy transfer of files between docker and host

if you want the listeners inside the docker to be reachable from the host where the vpn might be running, you can use this

docker run --rm --network=host -v /some/path/to/local:/local -it kaliterm

Use /root/tm.sh to launch tmux and split the terminal in 4
