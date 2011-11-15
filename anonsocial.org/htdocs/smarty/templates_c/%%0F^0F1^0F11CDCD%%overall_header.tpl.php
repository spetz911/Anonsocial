<?php /* Smarty version 2.6.24, created on 2010-03-07 08:29:11
         compiled from overall_header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'overall_header.tpl', 33, false),)), $this); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link type="text/css" rel="stylesheet" href="/css/ui-darkness/jquery-ui-1.7.2.custom.css">
	<link type="text/css" rel="stylesheet" href="/css/common.css">
	<link type="text/css" rel="stylesheet" href="/css/links.css">
	<link type="text/css" rel="stylesheet" href="/css/profile.css">
	<script src="/js/jquery-1.4.2.min.js"></script>
	<script src="/js/jquery-ui-1.7.2.custom.min.js"></script>
	<title><?php echo $this->_tpl_vars['PAGE_TITLE']; ?>
</title>
</head>
<body>
<script>
<?php echo '
	$(document).ready(function(){
		$(\'nav ul a\').mouseenter(function(){
			$(this).animate({\'background-color\': \'#D0D0D0\'}, {\'duration\': 200, \'queue\': false});
		}).mouseleave(function(){
			$(this).animate({\'background-color\': \'#FFFFFF\'}, {\'duration\': 200, \'queue\': false});
		});
	});
'; ?>

</script>
<div id="pageContainer">
	<div id="pageLayout">
		<header id="pageHeader">AnonSocial</header>
		<nav id="sideBar">
			<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menu/standard_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		</nav>
		<div id="pageBody">
			<header id="contentHeader">
				<?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Anonymous<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?> <span>(<?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>that's you<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>)</span>
			</header>
			<div id="pageContent">
				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'user_profile/profile.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>