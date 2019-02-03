#!/usr/bin/env python

import requests
import re
from string import ascii_lowercase, ascii_uppercase, digits

username = 'natas18'
password = 'xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP'

url = f'http://{username}.natas.labs.overthewire.org/index-source.html'

session = requests.Session()
response = session.get(url, auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
