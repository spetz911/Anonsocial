<?php

if(!defined('IN_AS'))
{
	die('Security breach');
}

define('SMARTY_DIR', "/usr/share/php/smarty/");
require_once(SMARTY_DIR . 'Smarty.class.php');

class AsSmarty extends Smarty
{
	public function __construct()
	{
		global $as_root_path;
		parent::__construct();
		$this->template_dir = $as_root_path . "smarty/templates/";
		$this->compile_dir = $as_root_path . "smarty/templates_c/";
		$this->config_dir = $as_root_path . "smarty/configs/";
		$this->cache_dir = $as_root_path . "smarty/cache/";
		$this->plugins_dir = array(SMARTY_DIR . 'plugins/', $as_root_path . "smarty/plugins/");
	}
}

?>
