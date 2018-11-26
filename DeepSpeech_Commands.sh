mkdir DeepSpeech
cd DeepSpeech
sudo apt-get update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
sudo apt-get install git-lfs
sudo apt-get install python3.6
sudo apt-get install python-pip
git clone https://github.com/mozilla/DeepSpeech
python3 DeepSpeech/util/taskcluster.py --target
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.1.0/audio-0.1.0.tar.gz
tar -xvzf audio-0.1.0.tar.gz
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.1.0/deepspeech-0.1.0-models.tar.gz
tar -xvzf deepspeech-0.1.0-models.tar.gz
pip install deepspeech
chmod u+x DeepSpeech/util/taskcluster.py
DeepSpeech/util/taskcluster.py --target models/ --artifact convert_graphdef_memmapped_format --source tensorflow
chmod u+x models/convert_graphdef_memmapped_format
models/convert_graphdef_memmapped_format --in_graph=models/output_graph.pb --out_graph=models/output_graph.pbmm
deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio audio/2830-3980-0043.wav
