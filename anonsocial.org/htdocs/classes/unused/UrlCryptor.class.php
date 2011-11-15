<?php

class UrlCryptor
{
	private $key;
	private $salt;

	private $clear_args;
	private $secret_args;

	private $path;
	private $fragment;
	
	private $clear_args_cached;
	private $secret_args_cached;

	private $iv;

	public function reset()
	{
		$this->clear_args = array();
		$this->secret_args = array();
		$this->clear_args_cached = NULL;
		$this->secret_args_cached = NULL;
	}

	public function __construct()
	{
		$this->iv = NULL;
		$this->key = 'Very complex key';
		$this->salt = session_id();
		$this->reset();
	}

	private function list_args(&$args, $prefix = '')
	{
		$result = '';
		foreach($args as $key => &$arg)
		{
			$current_prefix = !empty($prefix) ? $prefix . '[' . urlencode($key) . ']' : urlencode($key);
			if(is_array($arg))
			{
				$result .= (!empty($result) ? '&' : '') . $this->list_args($arg, $current_prefix);
			}
			else
			{
				$result .= (!empty($result) ? '&' : '') . $current_prefix . '=' . urlencode($arg);
			}
		}
		return $result;
	}

	private function initialize_iv()
	{
		$iv_size = mcrypt_get_iv_size(MCRYPT_BLOWFISH, MCRYPT_MODE_CFB);
		$this->iv = mcrypt_create_iv($iv_size, MCRYPT_DEV_URANDOM);
	}

	private function crypt_args(&$args)
	{
		if(is_null($this->iv))
		{
			$this->initialize_iv();
		}
		$in = serialize(array(
			'data' => $args,
			'sessid' => $this->salt,
		));
		return base64_encode(mcrypt_encrypt(MCRYPT_BLOWFISH, $this->key, $in, MCRYPT_MODE_CFB, $this->iv));
	}

	private function decrypt_args(&$in)
	{
		if(is_null($this->iv))
		{
			$this->initialize_iv();
		}
		$out = @mcrypt_decrypt(MCRYPT_BLOWFISH, $this->key, base64_decode($in), MCRYPT_MODE_CFB, $this->iv);
		if($out)
		{
			return unserialize($out);
		}
		else
		{
			return NULL;
		}
	}

	public function add_clear_arg($key, $value)
	{
		$this->clear_args[$key] = $value;
		$this->clear_args_cached = NULL;
	}

	public function add_secret_arg($key, $value)
	{
		$this->secret_args[$key] = $value;
		$this->secret_args_cached = NULL;
	}

	public function set_path($path)
	{
		$this->path = $path;
	}

	public function set_fragment($fragment)
	{
		$this->fragment = $fragment;
	}

	public function make_link()
	{
		if(empty($this->path))
		{
			trigger_error('Attempt to make link without path', E_USER_ERROR);
			return NULL;
		}
		if(!empty($this->clear_args) && is_null($this->clear_args_cached))
		{
			$this->clear_args_cached = list_args($this->clear_args);
		}
		if(!empty($this->secret_args) && is_null($this->secret_args_cached))
		{
			$this->secret_args_cached = crypt_args($this->secret_args);
		}
		$result = $this->path;
		if(!empty($this->clear_args_cached) || !empty($this->secret_args_cached))
		{
			if(!empty($this->clear_args_cached) && !empty($this->secret_args_cached))
			{
				$result .= '?' . $this->clear_args_cached . '&s=' . $this->secret_args_cached;
			}
			elseif(!empty($this->clear_args_cached))
			{
				$result .= '?' . $this->clear_args_cached;
			}
			elseif(!empty($this->secret_args_cached))
			{
				$result .= '?s=' . empty($this->secret_args_cached);
			}
		}
		if(!empty($this->fragment))
		{
			$result .= '#' . $this->fragment;
		}
		return $result;
	}

	public function decrypt_request()
	{
		if(isset($_REQUEST['s']))
		{
			$args = $this->decrypt_args($_REQUEST['s']);
			if(!is_null($args))
			{
				$_REQUEST = array_merge($_REQUEST, $args);
			}
		}
	}
}


?>
