<?php
	define('IN_AS', 1);
	$as_root_path = '../';

	include_once($as_root_path . 'classes/Hooks.class.php');
	Hooks::run_hooks('init');

	$smarty = new AsSmarty();

	$smarty->assign('PAGE_TITLE','Lorem ipsum dolor sit amet');
	$smarty->assign('LEFT_NAV', array(
	  array('link' => '#', 'title' => 'elem1'),
	  array('link' => '#', 'title' => 'elem2'),
	  array('link' => '#', 'title' => 'elem3'),
	  array('link' => '#', 'title' => 'elem4'),
	  array('link' => '#', 'title' => 'elem5'),
	));

	Hooks::run_hooks('page_ready');

	$smarty->display('overall_header.tpl');
	$smarty->display('foo.tpl');
	$smarty->display('overall_footer.tpl');
?>
