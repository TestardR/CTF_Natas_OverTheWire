#!/usr/bin/env python

import requests
import re

username = 'natas1'
password = 'gtVrDuiDfck831PqWsLEZy5gyDz1clto'

url = f'http://{username}.natas.labs.overthewire.org'

response = requests.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)


print(re.findall('<!--The password for natas2 is (.*) -->', content))
