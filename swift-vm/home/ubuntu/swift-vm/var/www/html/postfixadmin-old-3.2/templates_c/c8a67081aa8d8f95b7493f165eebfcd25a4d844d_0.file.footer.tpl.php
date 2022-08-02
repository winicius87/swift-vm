<?php
/* Smarty version 3.1.32, created on 2020-12-18 07:37:43
  from '/var/www/html/postfixadmin/templates/footer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5fdc5c47401874_69777182',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c8a67081aa8d8f95b7493f165eebfcd25a4d844d' => 
    array (
      0 => '/var/www/html/postfixadmin/templates/footer.tpl',
      1 => 1525293856,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5fdc5c47401874_69777182 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/postfixadmin/lib/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
?><!-- <?php echo basename($_smarty_tpl->source->filepath);?>
 -->
<div id="footer">
	<a target="_blank" rel="noopener" href="http://postfixadmin.sf.net/">Postfix Admin <?php echo $_smarty_tpl->tpl_vars['version']->value;?>
</a>
	<span id="update-check">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
	<a target="_blank" rel="noopener" href="http://postfixadmin.sf.net/update-check.php?version=<?php echo rawurlencode($_smarty_tpl->tpl_vars['version']->value);?>
"><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['check_update'];?>
</a></span>
    <?php if (isset($_SESSION['sessid'])) {?>
        <?php if ($_SESSION['sessid']['username']) {?>
            &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;	
            <?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['PALANG']->value['pFooter_logged_as'],"%s",$_SESSION['sessid']['username']);?>

        <?php }?>
    <?php }?>
	<?php if ($_smarty_tpl->tpl_vars['CONF']->value['show_footer_text'] == 'YES' && $_smarty_tpl->tpl_vars['CONF']->value['footer_link']) {?>
		&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		<a href="<?php echo $_smarty_tpl->tpl_vars['CONF']->value['footer_link'];?>
" rel="noopener"><?php echo $_smarty_tpl->tpl_vars['CONF']->value['footer_text'];?>
</a>
	<?php }?>
</div>
</div>
</body>
</html>
<?php }
}
