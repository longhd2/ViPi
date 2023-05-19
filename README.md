# ViPi Assistant

IMG đã cài driver Mic USB: https://vipiteam.page.link/im để dùng với MicReSpeaker cài thêm driver cho Mic

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
 * Truy cập: https://console.picovoice.ai/ để lấy AccessKey

--------------------
# TÍNH NĂNG:
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
        
