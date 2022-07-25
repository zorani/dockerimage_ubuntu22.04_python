FROM zokidoki/ubuntu22.04_base:withdefaultuser

USER root 
SHELL ["/bin/bash","-c"]

#You must update each and every time
RUN apt-get update

#python 3.10 is the default version in ubuntu 22.04
RUN apt-get -qqy install python3 >/dev/null 2>/dev/null

USER ubuntu
WORKDIR /home/ubuntu/
