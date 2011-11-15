<?php

if(!defined('IN_AS'))
{
	die('Security breach');
}

class Hooks
{
	private static function run_hooks_init()
	{
		global $as_root_path, $as_generation_start;
		$as_generation_start = microtime(1);

		include_once($as_root_path . 'classes/Smarty.class.php');
		include_once($as_root_path . 'classes/Cookies.class.php');

		$lang = Cookies::get_cookie('lang');

		if(isset($_REQUEST['lang']) && $lang !== $_REQUEST['lang'])
		{
			$lang = $_REQUEST['lang'];
			Cookies::set_cookie('lang', $lang, 0);
		}
		else
		{
			if(is_null($lang))
			{
				$lang = 'ru_RU.UTF-8';
				Cookies::set_cookie('lang', $lang, 0);
			}
		}

		setlocale(LC_MESSAGES, $lang . '.UTF-8');
		bindtextdomain('messages', $as_root_path . 'lang');

		session_start();
	}

	private static function run_hooks_page_ready()
	{
		global $as_generation_start, $smarty;
		$as_generation_end = microtime(1);
		$generation_time = $as_generation_end - $as_generation_start;
		$smarty->assign('PAGE_GENERATION_TIME', sprintf("%.3f", $generation_time));
	}

	private static function run_hooks_complete()
	{
	}

	public static function run_hooks($event, $args = array())
	{
		$method = 'run_hooks_' . $event;
		if(is_callable(array('self', $method)))
		{
			return call_user_func_array(array('self', $method), $args);
		}
	}
}

?>
