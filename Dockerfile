# Base docker image
FROM debian:wheezy

# Setup multiarch because Skype is 32bit only
RUN dpkg --add-architecture i386

# Install Iceweasel and "sudo"
RUN apt-get update && apt-get install -y sudo

# Install PulseAudio for i386 (64bit version does not work with Skype)
RUN apt-get install -y libpulse0:i386 pulseaudio:i386

# create sysadmin account
RUN useradd -m -d /data -p saIVpsc0EVTwA sysadmin
RUN sed -Ei 's/sudo:x:27:/sudo:x:27:sysadmin/' /etc/group
RUN sed -Ei 's/(\%sudo\s+ALL=\(ALL\:ALL\) )ALL/\1 NOPASSWD:ALL/' /etc/sudoers

# Install Skype
RUN apt-get install -y wget
RUN wget http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb -O /usr/src/skype.deb
RUN dpkg -i /usr/src/skype.deb || true
RUN apt-get install -fy # Automatically detect and install dependencies

# Enable camera
RUN apt-get install -y libv4l-0

ENV QT_X11_NO_MITSHM 1
ENV GNOME_DESKTOP_SESSION_ID this-is-deprecated
ENV PULSE_SERVER /data/.pulse/.socket

CMD ["/usr/bin/sudo", "-u", "sysadmin", "-H", "-E", "/usr/bin/skype"]
