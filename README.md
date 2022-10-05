# ViPi: Bản test
Để dùng bản ổn định hãy tải ở đây: https://github.com/thangnd85/ViPi.git

## Tải về
```sh
sudo apt-get install git -y && git clone https://github.com/longhd2/ViPi
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
sudo chmod +x ./ViPi/drivers/USB-MIC-JACK/usb-mic-onboard-jack.sh && sudo ./ViPi/drivers/USB-MIC-JACK/usb-mic-onboard-jack.sh
speaker-test
```
## Mic USB + Audio mic (MIC-RUM HOẶC CÁC LOẠI MIC CẮP QUA CỔNG USB)
1/ Chạy tự động;
```sh
+ hãy kiểm tra lại Mic nhận ở card nào, hiện đang khai mặc định ở card 1+
sudo chmod +x ./ViPi/drivers/MIC-RUM/scripts/disable-onboard.sh && sudo ./ViPi/drivers/MIC-RUM/scripts/disable-onboard.sh
sudo reboot
sudo chmod +x ./ViPi/drivers/MIC-RUM/scripts/usb-mic-rum.sh && sudo ./ViPi/drivers/MIC-RUM/scripts/usb-mic-rum.sh
speaker-test
```
2/ Nếu lỗi hãy chạy thủ công!
### Khai báo khi sử dụng Mic Usb:
Kiểm tra Mic, âm thanh hoạt động ở card nào bằng 2 lệnh dưới và thay thế đúng vào vào file .asoundrc bên dưới
```sh
arecord -l
aplay -l
```
Chạy lệnh sau
```sh
sudo nano /home/pi/.asoundrc
```
Cửa sổ nano hiện lên, paste dòng sau, thay thế ID mic, loa phù hợp

```sh
pcm.dsnooper {
    type dsnoop
    ipc_key 816357492
    ipc_key_add_uid 0
    ipc_perm 0666
    slave {
        pcm "hw:1,0"
        channels 1
    }
}

pcm.!default {
        type asym
        playback.pcm {
                type plug
                slave.pcm "hw:0,0"
        }
        capture.pcm {
                type plug
                slave.pcm "dsnooper"
        }
}

```
Bấm Ctr+X+Y để lưu lại Sau đó chạy lệnh 2 lệnh sau: 
```sh
sudo cp /home/pi/.asoundrc /etc/asound.conf
sudo usermod -aG root pi
```


## Cài đặt chương trình:
```sh
cd /home/${USER}/
sudo chmod +x ./ViPi/scripts/installer.sh && sudo ./ViPi/scripts/installer.sh
```
## Chạy thủ công:
```sh
python3 ./ViPi/src/start.py
```

Done!

