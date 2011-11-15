<?php

class Cookies
{
	public static function set_cookie($name, $cookiedata, $cookietime)
	{
		$name_data = rawurlencode($name) . '=' . rawurlencode($cookiedata);
		$expire = gmdate('D, d-M-Y H:i:s \\G\\M\\T', $cookietime);
		$domain = '';

		header('Set-Cookie: ' . $name_data . (($cookietime) ? '; expires=' . $expire : '') . '; path=/', false);
	}

	public static function get_cookie($name)
	{
		return isset($_COOKIE[$name]) ? $_COOKIE[$name] : NULL;
	}
}

?>
