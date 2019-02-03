#!/usr/bin/env python

import requests
import re

username = 'natas2'
password = 'ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi'

url = f'http://{username}.natas.labs.overthewire.org/files/users.txt'

response = requests.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('natas3:(.*)', content))

# robots.txt & Directory indexing
