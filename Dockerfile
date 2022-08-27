FROM zokidoki/ubuntu22.04_base:withdefaultuser

USER root 
SHELL ["/bin/bash","-c"]

#This path is needed for python package building.
RUN export PATH="/home/ubuntu/.local/bin:$PATH"

#You must update each and every time
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
    #python 3.10 is the default version in ubuntu 22.04
    python3 \
    # You need pip and venv for python package building, amongst other things.
    python3-pip \
    python3-venv

# We need to install "build" for package building
RUN yes | python3 -m pip install --upgrade build --quiet --exists-action i
RUN yes | python3 -m pip install --upgrade twine --quiet --exists-action i

USER ubuntu
WORKDIR /home/ubuntu/
