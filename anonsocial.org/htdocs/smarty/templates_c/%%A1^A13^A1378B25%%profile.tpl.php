<?php /* Smarty version 2.6.24, created on 2010-03-07 08:55:20
         compiled from user_profile/profile.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'user_profile/profile.tpl', 5, false),)), $this); ?>
				<div id="leftColumn">
					<img src="img/anonymous.jpg" alt="Photo">
				</div>
				<div id="rightColumn">
					<header id="newsHeader"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Latest events<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></header>
					<div id="profileNews">
						<ul>
							<li><a href="#">Три школьницы прыгнули с крыши 16-этажного дома, взявшись за руки</a></li>
							<li><a href="#">Самоубийства, убийства, геноцид</a></li>
							<li><a href="#">Расизм, сексизм, дискриминация, ксенофобия, изнасилования, беспричинная ненависть &hellip;</a></li>
							<li><a href="#">Василевский убил своих родителей</a></li>
						</ul>
					</div>
				</div>