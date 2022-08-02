<?php
/* Smarty version 3.1.32, created on 2021-01-12 14:53:30
  from '/var/www/html/postfixadmin/templates/sendmail.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5ffdfe3a88bea7_05917910',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fb8bb188b913855044e6a3d79cde35df3228a671' => 
    array (
      0 => '/var/www/html/postfixadmin/templates/sendmail.tpl',
      1 => 1525293856,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5ffdfe3a88bea7_05917910 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="edit_form">
<form name="mailbox" method="post" action="">
<input class="flat" type="hidden" name="token" value="<?php echo rawurlencode($_SESSION['PFA_token']);?>
" />
<table>
	<tr>
		<th colspan="3"><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pSendmail_welcome'];?>
</th>
	</tr>
	<tr>
		<td class="label"><label><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['from'];?>
:</label></td>
		<td><em><?php echo $_smarty_tpl->tpl_vars['smtp_from_email']->value;?>
</em></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="label"><label><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pSendmail_to'];?>
:</label></td>
		<td><input class="flat" type="text" name="fTo" /></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="label"><label><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['subject'];?>
:</label></td>
		<td><input class="flat" type="text" name="fSubject" value="<?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pSendmail_subject_text'];?>
" /></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="label"><label><?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pSendmail_body'];?>
:</label></td>
		<td>
		<textarea class="flat" rows="10" cols="60" name="fBody"><?php echo $_smarty_tpl->tpl_vars['CONF']->value['welcome_text'];?>
</textarea>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="label">&nbsp;</td>
		<td colspan="2"><input class="button" type="submit" name="submit" value="<?php echo $_smarty_tpl->tpl_vars['PALANG']->value['pSendmail_button'];?>
" /></td>
	</tr>
</table>
</form>
</div>
<?php }
}
