#!/bin/bash
sudo apt-get -y update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
sudo apt-get -y install git-lfs
sudo apt-get -y install python3.6
sudo apt-get -y install python3-pip
git clone https://github.com/mozilla/DeepSpeech
cd DeepSpeech
python3 util/taskcluster.py --target
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.3.0/audio-0.3.0.tar.gz
tar -xvzf audio-0.3.0.tar.gz
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.3.0/deepspeech-0.3.0-models.tar.gz
tar -xvzf deepspeech-0.3.0-models.tar.gz
pip3 install deepspeech
pip3 install -r requirements.txt
chmod u+x util/taskcluster.py
util/taskcluster.py --target models/ --artifact convert_graphdef_memmapped_format --source tensorflow
chmod u+x models/convert_graphdef_memmapped_format
models/convert_graphdef_memmapped_format --in_graph=models/output_graph.pb --out_graph=models/output_graph.pbmm
deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio audio/2830-3980-0043.wav
# currently only WAVE files with 16-bit, 16 kHz, mono are supported in the Python client