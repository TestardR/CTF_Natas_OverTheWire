#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import re
import urllib
import base64
import binascii

username = 'natas11'
password = 'U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()
# cookies = {"data": "ClVLIh4ASCsCBE8lAxMacFMOXTlTWxooFhRXJh4FGnBTVF4sFxFeLFMK"}
# response = session.get(url, auth=(username, password), cookies=cookies)
response = session.get(url, auth=(username, password))

# data = session.cookies['data']
data = base64.b64decode(urllib.parse.unquote(session.cookies['data']))
# print(binascii.b2a_hex(data))
print(data)

content = response.text
output = open('output.html', 'w')
# output.write(str(session.cookies))

# print(content)
