#!/usr/bin/env python

import requests
import re

username = 'natas0'
password = username

url = f'http://{username}.natas.labs.overthewire.org'

response = requests.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(re.findall('<!--The password for natas1 is (.*) -->', content))
