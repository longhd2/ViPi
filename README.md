# ViPi: Bản test
Để dùng bản ổn định hãy tải ở đây: https://github.com/thangnd85/ViPi.git
# A: CẤU HÌNH & CÀI ĐẶT:
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
sudo chmod +x ./ViPi/drivers/USB-MIC-JACK/scripts/usb-mic-onboard-jack.sh && sudo ./ViPi/drivers/USB-MIC-JACK/scripts/usb-mic-onboard-jack.sh
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
## Thiết lập chạy tự động:
Chạy tự động với supervisor:
```sh
sudo python3 -m pip install supervisor
sudo nano /etc/supervisor/conf.d/ViPi.conf
```
Cửa sổ nano hiện lên, paste dòng sau
```sh
[program:ViPi]
directory=/home/pi
command=/bin/bash -c 'python3 ./ViPi/src/start.py'
environment = LD_PRELOAD="/usr/lib/arm-linux-gnueabihf/libatomic.so.1.2.0"
numprocs=1
autostart=true
autorestart=true
user=pi
```
như hình:
![image](https://user-images.githubusercontent.com/43842525/194978400-3928dde8-fe50-4642-863a-92325ddf9b68.png)


# Sau đó gõ: Ctrl + X, Y, Enter để save 
Chạy lệnh sau để khởi động chạy tự động:
```sh
sudo supervisorctl update
```
## Bật web insterface để xem log cho nhanh

```sh
sudo nano /etc/supervisor/supervisord.conf
```
Sau đó paste dòng này vào:
    [inet_http_server]
    port=*:9001
    username=user
    password=123
![image](https://user-images.githubusercontent.com/43842525/194978484-a9230eb2-3879-4e76-ab62-ff489c182db4.png)
Ctrl + X, Y, Enter để save. Xong reboot lại Pi, có thể mở web lên nhập http://ip_của_pi:9001 nhập username và pass ở trên để xem log:

    Để xem Log hoạt động vào thư mục home/pi/ViPi.log
Chúc các bạn thành công!

# B: TÍNH NĂNG:
# 1. Âm nhạc:
    a. Mở nhạc
    b. Điều khiển nhạc
    c. Điều chỉnh âm lượng
# 2. Smarthome:
    a. Điều khiển thiết bị
    b. Điều khiển kịch bản
    c. Tra cứu trạng thái
# 3. Đồng hồ & ngày giờ:
    a. Hỏi thời gian
    b. hỏi ngày tháng
    c. Hỏi âm lịch
# 4. Tra cứu thông tin:
    a. Hỏi thời tiết
    b. Hỏi tin tức
        - ok google, hôm nay có tin gì mới
        - ok google, đọc tin thể thao
    c. Tra cứu thông tin covid:
        - ok google, tin tức về covid
        - ok google, Việt Nam có bao nhiêu ca covid
# 5. Trẻ em:
    a. Kể chuyện
    b. Đánh vần
# 6. Tiện ích:
    a. Tính toán
    b. Chọn số ngẫu nhiên
    c. Hỏi giá vàng
    d. Hỏi giá ngoại tệ
# 7. Tra cứu:
    a. Tra cứu thông tin người nổi tiếng
    b. Tra cứu thông tin địa danh
    c. Tra cứu thông tin tổ chức
    d. Tra cứu thông tin văn học
    e. Hỏi đáp kiến thức
# 8. Chế độ trò truyện liên tục
    a. Bật chế độ hội thoại
    b. Tắt chế độ hội thoại
# 9. Nghe radio:
     - Bot hỗ trợ 9 kênh radio sau:
    a. Mở radio
    b. Tắt radio
# 10. Gửi tin nhắn đến Telegram
     a. Kích hoạt
        - ok google, gửi lời nhắn cho bố
     b. Đọc nội dung cần gửi
# 11. Điều khiển thiết bị chromcast:
     a. Mở chromecast
       -
     b. Điều khiển âm lượng thiết bị chromecast
# 12. Custom_Skill:
    Tính năng mở đang phát triển để các bạn có thể tự thêm skill cho bot

    a. Cấu trúc
    b. Ví dụ
Viết trước cái sườn hôn nào rảnh cập nhật sau:
