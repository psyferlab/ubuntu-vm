FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 xfce4-goodies tightvncserver && \
    apt-get clean

# Set the VNC password (Change 'password' to your desired password)
RUN mkdir ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Expose VNC port
EXPOSE 5901

# Start VNC server when the container runs
CMD ["vncserver", ":1", "-geometry", "1280x720", "-depth", "24"]

