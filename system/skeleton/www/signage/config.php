<?php
/**
 * @package signage
 * @author Michael Zapf <michi.zapf@mztx.de>
 * @version 0.1
 * @copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
 */

if (!class_exists('SignageConfig')) {

class SignageConfig {
    static $PATH_HEARBEAT_URL = '/etc/shinage-player/heartbeat_url.conf';
    static $PATH_GUID         = '/etc/shinage-player/uuid.conf';

    var $empty_pres = 'nopres.php';
    var $usb_base   = '/mnt/usb';

    public function __construct() {
    }

    public function getLocalHost() {
        list($h,) = explode(':', $_SERVER['HTTP_HOST']);
        return $h . ':8001';
    }

    public function getHearbeatUrl() {
        $c = file_get_contents(self::$PATH_HEARBEAT_URL);
        $c = trim($c, "\n\r\t ");
        return $c;
    }

    public function getGuid() {
        $c = file_get_contents(self::$PATH_GUID);
        $c = trim($c, "\n\r\t ");
        return $c;
    }

}

$cfg = new SignageConfig();


}

