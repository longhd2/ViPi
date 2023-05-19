# ViPi Assistant

IMG đã cài driver Mic USB, để dùng với MicReSpeaker cài thêm driver: https://vipiteam.page.link/img

 - Linux kernel 5.15.84 
 - User/pass Pi :(pi/raspberry)

--------------------------
# Revision:19052023
--------------------------
 * Thay đổi sang môi trường Virtual Environment
 * Không bắt buộc phải đăng ký tài khoản với Google
 * Ra lệnh đổi giọng trực tiếp bằng lời nó
 * Để dùng bản mới nhất vui lòng bấm cập nhật trên Wed: IP:5002
 * Xem hoạt đông : IP:9001 (user/pass: vipi/vipi)

 
--------------------------
# UPDATE NGÀY 17/04/2023 #
--------------------------
- Hotword mặc định trong code:

	 -- Vi Pi ơi
	 -- Vi Bi ơi
	 -- Tèo ơi
	 
- Để sử dụng tiến hành đăng ký AccessKey tại: https://console.picovoice.ai/"
 
 ![image](https://user-images.githubusercontent.com/43842525/232323291-376eaddb-d580-4417-abba-da84da67fa8d.png)
 
- Coppy AccessKey dán vào file config.json (Sẽ bổ sung tùy chọn dán vào setting trên wed sau)

![image](https://user-images.githubusercontent.com/43842525/232323492-ea00ff5d-d0d2-45c6-b155-da6f3c5b7346.png)
 
 Và cài đặt nâng cấp Picovice
```sh
pip install pvporcupine==2.2.0
```


--------------------------
# UPDATE NGÀY 15/04/2023 #
--------------------------
- Bổ sung thêm giọng đọc: Edge-tts
```sh
pip install edge-tts
```
- có thể thay đổi giọng nói bằng cách gọi bot, hoặc chỉnh trên wed 

```sh
-- Tèo ơi, đổi giọng google
-- Vi Pi ơi, đổi giọng google (hoặc gtts)
-- Vi Pi ơi, đổi giọng nam google
-- Vi Pi ơi, đổi giọng zalo nam (hoặc ztts), giọng edge...
```


--------------------------
# UPDATE NGÀY 10/03/2023 #
--------------------------
- Để sử dụng picovoice V2 Cần phải đăng ký acssenkey
Và nâng cấp lib picovoice bằng lệnh sau
 ```sh
pip install pvporcupine==2.1.0
```
- Fix zalotts



--------------------------
# UPDATE NGÀY 25/02/2023 #
--------------------------
+ Hướng dẫn cài đặt cho IMG cài đặt sẵn Mic R2M!
 ```sh

rm -rf ViPi/
git clone https://github.com/longhd2/ViPi.git
pip install ujson
pip install openai
cd ./ViPi/src/easySpeech/
sudo dpkg -i flac_1.3.3-2+deb11u1_armhf.deb
```
Vào ip:9001 user/pass: user/123 vào khởi động lại

Vào ip:5002/setting chọn Mic, led chính xác


- Những thay đổi:
	+ Bật lại hotword OK GG
	+ Fix lỗi music
	+ Tăng tốc xử lý gTTS (zalo chưa xử lý xong)
	+ Thay đổi điều khiển led
	+ Và bổ sung thêm lỗi mới


--------------------------
# UPDATE NGÀY 05/02/2023 #
--------------------------
- Nhấn giữ 30 giây GPIO 17 - nối GND (hoặc phím bấm trên 2 mic re) reset Wifi vào IMG
- OFF hotword OK GOOGLE - chỉ sử dụng PICOVOICE ONLY
- STT: GOOGLE_SDK (ONLY CPU Armv7, ArmV8); GOOGLE_FREE; ZALO_FREE


--------------------------
# UPDATE NGÀY 17/01/2023 #
--------------------------
- Để sử dụng khi không xác thực được tài khoản với google, hạn chế không sử dụng được hotword "OK Google" và STT google và Không điều khiển được thiết bị trên HomeApp của Google, tốc độ chậm hơn 1 chút

```sh
cd ./ViPi/src/easySpeech/
sudo dpkg -i flac_1.3.3-2+deb11u1_armhf.deb
```

*Lưu ý: Nếu sử dụng IMG có sẵn thì các bạn không cần làm các bước nên dưới


--------------------------
#  A: CẤU HÌNH & CÀI ĐẶT: #
--------------------------

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

--------------------
# B: TÍNH NĂNG:    #
--------------------

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
        - Vi Pi ơi, hôm nay có tin gì mới
        - Vi Pi ơi, đọc tin thể thao
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
    a. Bật chế độ hội thoại: (hotword + ['hỏi đáp','hội thoại','trò chuyện','liên tục','nói chuyện'])
        - Vi Pi ơi, bật hội thoại
    b. Tắt chế độ hội thoại
        - Dừng lại, ngừng lại, thoát
# 9. Nghe radio:
     - Bot hỗ trợ các kênh radio sau: VOV1, VOV2, VOV3, VOV GIAO THÔNG HÀ NỘI, VOV GIAO THÔNG HCM
    a. Mở radio
    b. Tắt radio
# 10. Gửi tin nhắn đến Telegram:
     a. Kích hoạt
        - Vi Pi ơi, gửi lời nhắn cho bố
        - Vi Pi ơi, nhắn tin cho mẹ
     b. Đọc nội dung cần gửi
        - bố ơi về đi, con đói bụng lắm rồi
# 11. Điều khiển thiết bị chromecast:
     a. Mở thiết bị chromecast
       - ok google, phát bài hát vĩnh biệt màu xanh trên tivi
     b. Điều khiển âm lượng thiết bị chromecast
       - ok google, tăng âm lượng trên tivi
# 12. Đa lệnh
     - Vi Pi ơi, bật đèn phòng khách và phát bài hát vĩnh biệt màu xanh
     - Vi Pi ơi, bật đèn phòng khách tắt đèn phòng ngủ thời tiết hôm nay
# 12. Custom_Skill:
a. Cấu trúc, Ví dụ
```sh
	- Để thêm skill cho bot, các bạn xem hướng dẫn và skill ví dụ trong file cus_skill
	- Ví dụ skill cus_fire_name
```
a) Ví dụ skill cus_fire_name: 
```sh
bước 1. Mở file key word thêm key trong mảng keyword (lưu ý để skill hoạt động được bắt buộc tiền tố đầu phỉa là: cus_.....
```
```sh
	"keyword": {
		"cus_fire_name": [
			"lời chúc tết "
	    },
```
```sh
bước 2). Mở file cus_skill thêm skill vào nội dung bạn muốn:
```
```sh
	if skill=='cus_fire_name':
	    answer=['chúc tết XXXX', 'chúc tết XXXX']
	    answer=random.choice(answer)
	    print(answer)
```
            
Chúc bạn thành công!
        
