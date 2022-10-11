
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
    import random
    if skill=='cus_fire_name':
        answer=['bệ phóng đã sẵn sàng', 'tên lửa đã sãn sàng, chờ lệnh']
        answer=random.choice(answer)
        print(answer)
    return answer