#!/bin/bash
sudo apt-get -y update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
sudo apt-get -y install git-lfs
sudo apt-get -y install python3.6
sudo apt-get -y install python3-pip
git clone https://github.com/mozilla/DeepSpeech
python3 util/taskcluster.py --target DeepSpeech/
cd DeepSpeech
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.3.0/audio-0.3.0.tar.gz
tar -xvzf audio-0.3.0.tar.gz
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.3.0/deepspeech-0.3.0-models.tar.gz
tar -xvzf deepspeech-0.3.0-models.tar.gz
pip3 install deepspeech
pip3 install -r requirements.txt
# currently only WAVE files with 16-bit, 16 kHz, mono are supported in the Python client
