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
	<title>{$PAGE_TITLE}</title>
</head>
<body>
<script>
{literal}
	$(document).ready(function(){
		$('nav ul a').mouseenter(function(){
			$(this).animate({'background-color': '#D0D0D0'}, {'duration': 200, 'queue': false});
		}).mouseleave(function(){
			$(this).animate({'background-color': '#FFFFFF'}, {'duration': 200, 'queue': false});
		});
	});
{/literal}
</script>
<div id="pageContainer">
	<div id="pageLayout">
		<header id="pageHeader">AnonSocial</header>
		<nav id="sideBar">
			{include file='menu/standard_menu.tpl'}
		</nav>
		<div id="pageBody">
			<header id="contentHeader">
				{t}Anonymous{/t} <span>({t}that's you{/t})</span>
			</header>
			<div id="pageContent">
				{include file='user_profile/profile.tpl'}
