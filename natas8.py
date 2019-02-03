#!/usr/bin/env python

import requests
import re

username = 'natas8'
password = 'DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe'

url = f'http://{username}.natas.labs.overthewire.org/'

# response = requests.get(url + 'index-source.html', auth=(username, password))
response = requests.post(
    url, data={'secret': 'oubWYf2kBq', 'submit': 'submit'}, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('The password for natas9 is (.*)', content))

# PHP Base64 & Hex.
