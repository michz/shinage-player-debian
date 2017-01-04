<?php
/**
 * @package signage
 * @author Michael Zapf <michi.zapf@mztx.de>
 * @version 0.1
 * @copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
 */

require_once(__DIR__ . '/FileSystem.php');
require_once(__DIR__ . '/config.php');


// first check if usb stick is mounted and if it contains displayable files
$usb_drives = FileSystem::getUsbDrives();

if (count($usb_drives) > 0) {
    // TODO: check if there are displayable files
    
    echo "http://".$cfg->getLocalHost()."/usb.php?dev=" . $usb_drives[0];
    exit;
}

// TODO catch errors

// get remote heartbeat URL
$url = $cfg->getHearbeatUrl();
$fields = array(
	'screen'    => $cfg->getGuid(),
    'time'      => date('Y-m-d H:i:s')
);
//url-ify the data for the POST
$fields_string = '';
foreach ($fields as $k => $v) { $fields_string .= $k . '=' . $v . '&'; }
rtrim($fields_string, '&');

// ask remote server
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, count($fields));
curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch, CURLOPT_USERAGENT, "SHINAGE-PLAYER/1.0"); // TODO some information about system
curl_setopt($ch, CURLOPT_HEADER, 0); // no header in result
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 15);
$output = curl_exec($ch);
curl_close($ch);

$json = json_decode($output);


// TODO Werte "screen_status" aus und zeige Hilfe-Bildschirm, falls nicht registriert

if ($json->presentation == 'null') {
    echo "http://".$cfg->getLocalHost()."/".$cfg->empty_pres;
}
else {
    echo $json->presentation;
}


