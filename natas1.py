#!/usr/bin/env python

import requests
import re

username = 'natas1'
password = 'gtVrDuiDfck831PqWsLEZy5gyDz1clto'

url = 'http://%s.natas.labs.overthewire.org' % username

response = requests.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)


print(re.findall('<!--The password for natas2 is (.*) -->', content))
