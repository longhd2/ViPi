
# Thêm vào skill muốn phát triển
# Mở file keywords.jon
# Thêm keywords để gọi Skill cấu trúc vào mảng "keyword" lưu ý tiền tố "cus_(tên skill):

###########################
#	"keyword": {
#		"cus_skill_1": [
#			"key 1",
#			"key 2",
#			"key 3",
#			"key 4"
#		],
#		"cus_skill_2": [
#			"key 1",
#			"key 2",
#			"key 3",
#			"key 4"
#		]
#	},
###########################

def cus_skill(skill,data):
    print(skill,data)
    if skill=='cus_fire_name':
        import random
        answer=['bệ phóng đã sẵn sàng', 'tên lửa đã sãn sàng, chờ lệnh']
        answer=random.choice(answer)
    if skill=='cus_happy_new':
        if "ông" in data or "bà" in data:
            answer=['một bầu trời sức khỏe, một biển cả tình thương và một gia đình thịnh vượng', 'vạn sự như ý, tỷ sự như mơ, triệu điều bất ngờ, không chờ cũng đến']
        elif "cháu" in data:
            answer=['Đong cho đầy Hạnh phúc. Gói cho trọn Lộc tài. Giữ cho mãi An Khang. Thắt cho chặt Phú quý. Cùng chúc nhau Như ý, Hứng cho tròn An Khang, Chúc năm mới Bình An. Cả nhà đều Sung túc', 'mau ăn chóng lớn']
        elif "dì" in data or "cậu" in data:
            answer=['có 1 bầu trời sức khỏe, 1 Biển cả tình thương, 1 Đại dương tình bạn, 1 Điệp khúc tình yêu, 1 Người yêu chung thủy, 1 Sự nghiệp sáng ngời, 1 Gia đình thịnh vượng']
        elif "chú" in data or "bác" in data:
            answer=['Chúc năm mới cả gia đình bạn vạn sự như ý, Tỉ sự như mơ, Triệu triệu bất ngờ, Không chờ cũng đến','Xuân này hơn hẳn mấy xuân qua. Phúc lộc đưa nhau đến từng nhà. Vài lời cung chúc tân niên mới. Vạn sự an khang vạn sự lành']
        import random
        answer=random.choice(answer)
        answer=data+' '+answer
        print(answer)
    return answer