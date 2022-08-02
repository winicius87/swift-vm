<?php
/* Smarty version 3.1.32, created on 2020-12-30 23:39:21
  from '/var/www/html/postfixadmin/templates/viewlog.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5fed55f9b3d5a3_94763485',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2ff91b866a5a66086b472af31d3f18bd7a3c5e82' => 
    array (
      0 => '/var/www/html/postfixadmin/templates/viewlog.tpl',
      1 => 1525293856,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5fed55f9b3d5a3_94763485 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/postfixadmin/lib/smarty/libs/plugins/function.html_options.php','function'=>'smarty_function_html_options',),1=>array('file'=>'/var/www/html/postfixadmin/lib/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),2=>array('file'=>'/var/www/html/postfixadmin/lib/smarty/libs/plugins/modifier.truncate.php','function'=>'smarty_modifier_truncate',),));
?><div id="overview">
<form name="frmOverview" method="post" action="">
	<?php echo smarty_function_html_options(array('name'=>'fDomain','output'=>$_smarty_tpl->tpl_vars['domain_list']->value,'values'=>$_smarty_tpl->tpl_vars['domain_list']->value,'selected'=>$_smarty_tpl->tpl_vars['domain_selected']->value,'onchange'=>"this.form.submit();"),$_smarty_tpl);?>

	<noscript><input class="button" type="submit" name="go" value="<?php echo $_smarty_tpl->tpl_vars['PALANG']->value['go'];?>
" /></noscript>
</form>
</div>
<?php if ($_smarty_tpl->tpl_vars['tLog']->value) {?>
<table id="log_table">
	<tr>
	    <th colspan="5"><?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['PALANG']->value['pViewlog_welcome'],"%s",$_smarty_tpl->tpl_vars['CONF']->value['page_size']);?>
 <?php echo $_smarty_tpl->tpl_vars['fDomain']->value;?>
 </th>
	</tr>
	<?php echo $_smarty_tpl->smarty->ext->configLoad->_getConfigVariable($_smarty_tpl, 'tr_header');?>

		<td><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pViewlog_timestamp'];?>
</td>
		<td><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['admin'];?>
</td>
		<td><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['domain'];?>
</td>
		<td><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pViewlog_action'];?>
</td>
		<td><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pViewlog_data'];?>
</td>
	</tr>
	<?php $_smarty_tpl->_assignInScope('PALANG_pViewlog_data', $_smarty_tpl->tpl_vars['PALANG']->value['pViewlog_data']);?>

	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['tLog']->value, 'item');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
?>
		<?php $_smarty_tpl->_assignInScope('log_data', smarty_modifier_truncate($_smarty_tpl->tpl_vars['item']->value['data'],35,"...",true));?>
		<?php $_smarty_tpl->_assignInScope('item_data', $_smarty_tpl->tpl_vars['item']->value['data']);?>
		<?php echo smarty_modifier_replace($_smarty_tpl->smarty->ext->configload->_getConfigVariable($_smarty_tpl, 'tr_hilightoff'),'>'," style=\"cursor:pointer;\" onclick=\"alert('".((string)$_smarty_tpl->tpl_vars['PALANG_pViewlog_data']->value)." = ".((string)$_smarty_tpl->tpl_vars['item_data']->value)."')\">");?>

		<td nowrap="nowrap"><?php echo $_smarty_tpl->tpl_vars['item']->value['timestamp'];?>
</td>
		<td nowrap="nowrap"><?php echo $_smarty_tpl->tpl_vars['item']->value['username'];?>
</td>
		<td nowrap="nowrap"><?php echo $_smarty_tpl->tpl_vars['item']->value['domain'];?>
</td>
		<td nowrap="nowrap"><?php echo $_smarty_tpl->tpl_vars['item']->value['action'];?>
</td>
		<td nowrap="nowrap"><?php echo $_smarty_tpl->tpl_vars['log_data']->value;?>
</td>
		</tr>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
</table>
<?php }
}
}
