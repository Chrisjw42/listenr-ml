DSrun.sh is the testing installation file.  It will install DeepSpeech and the necessary packages in a new virtual environment.  It will also run a test instance of deepspeech, with the output 'experience proves this'.

Install_DS.sh is purely installation - no testing will be done.

wav_tests.sh tests a batch of wav samples, included in this directory.  These wave files should be placed into the directory DeepSpeech/audio/ before running this shell script.

NB. currently only WAVE files with 16-bit, 16 kHz, mono are supported in the Python client