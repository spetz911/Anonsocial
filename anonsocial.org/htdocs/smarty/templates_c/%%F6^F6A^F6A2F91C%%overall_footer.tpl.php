<?php /* Smarty version 2.6.24, created on 2010-03-07 08:50:33
         compiled from overall_footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'overall_footer.tpl', 4, false),)), $this); ?>
			</div>
		</div>
		<footer class="bFooter">
			<p>&copy; 2010 <?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Anonymous<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?> PGT: <?php echo $this->_tpl_vars['PAGE_GENERATION_TIME']; ?>
sec</p>
			<p><a href="/?lang=ru_RU">Русский</a> <a href="/?lang=en_US">English</a></p>
		</footer>
	</div>
</div>
</body>
</html>