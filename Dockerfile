# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

# Add a local dir to share files with host
ADD . /local

# Set working directory to /root
WORKDIR /root

# Update
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils tmux openvpn

# Install python essentials
RUN apt -y install python3-pip pipx python3-virtualenv

# Install kali tools customize to what you need in terms of tools
RUN DEBIAN_FRONTEND=noninteractive apt -y install ffuf 

COPY tm.sh /root/tm.sh
RUN chmod +x /root/tm.sh

ENTRYPOINT ["/bin/bash"]
