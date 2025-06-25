FROM rockylinux:8

COPY src /srv/plankifier/src
COPY trained-models /srv/plankifier/trained-models
COPY data /srv/plankifier/camera-images
COPY bin/train.py /srv/plankifier/train.py
COPY bin/predict.py /srv/plankifier/predict.py

RUN << EOT
#!/bin/bash

set -e

dnf update -y
dnf install -y epel-release pkg-config
dnf install -y --enablerepo=powertools python38 python38-pip python38-devel hdf5-devel
pip3 install -U pip setuptools
pip3 install 'tensorflow==2.11.0' keras 'keras_tuner==1.0.1' 'imutils==0.5.4' scikit-learn 'efficientnet==1.1.1' 'seaborn==0.9.0' opencv-python-headless

chmod +x /srv/plankifier/train.py /srv/plankifier/predict.py
EOT
