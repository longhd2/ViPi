# ViPi: Bản test
Để dùng bản ổn định hãy tải ở đây: https://github.com/thangnd85/ViPi.git

##Hướng dẫn
sudo apt-get install git
git clone https://github.com/longhd2/ViPi

##Cài đặt Mic HAT:
sudo apt-get update
cd /home/${USER}/
sudo chmod +x ./ViPi/audio-drivers/MIC-HAT/scripts/install-i2s.sh && sudo ./ViPi/audio-drivers/MIC-HAT/scripts/install-i2s.sh
sudo chmod +x ./ViPi/audio-drivers/MIC-HAT/scripts/mic-hat.sh && sudo ./ViPi/audio-drivers/MIC-HAT/scripts/mic-hat.sh
sudo reboot
speaker-test

## Cài đặt chương trình:
cd /home/${USER}/
sudo chmod +x ./ViPi/scripts/installer.sh && sudo  ./ViPi/scripts/installer.sh

## Chạy thủ công:
python3 ./ViPi/src/start.py

Done!

