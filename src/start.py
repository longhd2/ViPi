import platform, os, json, time
from actions import USER_PATH,say

try:      
    import new_main
    print ('\nimport new_main')
    new_main.google_sdk().main()
except:
    say('gặp lỗi khi khởi động vui lòng kiểm tra lại cài đặt')

