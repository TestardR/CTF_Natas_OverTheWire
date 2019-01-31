#!/c/Program Files/iis express/PHP/v7.2/php

<?php
$defaultdata = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");

function xor_encrypt($in, $key) {
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}

$plainText = json_encode($defaultdata);
$cypherText = hex2bin(b'0a554b221e00482b02044f2503131a70531957685d555a2d121854250355026852115e2c17115e680c');
$key = 'qw8J';

$good_data = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");

// echo(xor_encrypt($plainText, $cypherText))

$good_plainText = json_encode($good_data);
$good_cypherText = xor_encrypt($good_plainText, $key);
// echo($good_cypherText);
$cookie = base64_encode($good_cypherText);
echo($cookie);
?>

