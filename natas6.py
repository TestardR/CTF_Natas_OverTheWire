#!/usr/bin/env python

import requests
import re

username = 'natas6'
password = 'aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1'

url = f'http://{username}.natas.labs.overthewire.org/'

# response = requests.get(url, auth=(username, password))
response = requests.post(url,
                         data={"secret": "FOEIUWGHFEEUHOFUOIU", "submit": "submit"},  auth=(username, password))
content = response.text
output = open('output.html', 'w')
output.write(content)

print(content)
# print(re.findall('The password for natas7 is(.*)', content))

# PHP Includes
