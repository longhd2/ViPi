³# ViPi: Bản test
Để dùng bản ổn định hãy tải ở đây: https://github.com/thangnd85/ViPi.git

## Tải về
```sh
sudo apt-get install git
git clone https://github.com/longhd2/ViPi
```
## Cài đặt driver Mic;
## Mic HAT
```sh
sudo apt-get update
cd /home/${USER}/
sudo chmod +x ./ViPi/drivers/MIC-HAT/scripts/install-i2s.sh && sudo ./ViPi/drivers/MIC-HAT/scripts/install-i2s.sh
sudo chmod +x ./ViPi/drivers/MIC-HAT/scripts/mic-hat.sh && sudo ./ViPi/drivers/MIC-HAT/scripts/mic-hat.sh
sudo reboot
speaker-test
```

## Mic USB + Audio 3.5mm Raspberry
```sh
sudo apt-get update
cd /home/${USER}/
sudo chmod +x ./ViPi/drivers/USB-MIC-JACK/usb-mic-onboard-jack.sh && sudo ./ViPi/drivers/USB-MIC-JACK/usb-mic-onboard-jack.sh
speaker-test
```
## Mic USB + Audio mic (MIC-RUM HOẶC CÁC LOẠI MIC CẮP QUA CỔNG USB)
```sh
+ hãy kiểm tra lại Mic nhận ở card nào+
sudo apt-get update
cd /home/${USER}/
sudo chmod +x ./ViPi/drivers/MIC-RUM/disable-onboard.sh && sudo ./ViPi/drivers/MIC-RUM/disable-onboard.sh
sudo reboot

cd /home/${USER}/
sudo chmod +x ./ViPi/drivers/MIC-RUM/install-usb-mic.sh && sudo ./ViPi/drivers/MIC-RUM/install-usb-mic.sh
speaker-test
```

## Cài đặt chương trình:
```sh
cd /home/${USER}/
sudo chmod +x ./ViPi/scripts/installer.sh && sudo  ./ViPi/scripts/installer.sh
```
## Chạy thủ công:
```sh
python3 ./ViPi/src/start.py
```

Done!

