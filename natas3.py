#!/usr/bin/env python

import requests
import re

username = 'natas3'
password = 'sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14'

# url = f'http://{username}.natas.labs.overthewire.org/robots.txt' 
url = f'http://{username}.natas.labs.overthewire.org/s3cr3t/users.txt' 

response = requests.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('natas4:(.*)', content))

# robots.txt & Directory indexing
