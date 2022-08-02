<?php
/* Smarty version 3.1.32, created on 2020-12-18 07:37:43
  from '/var/www/html/postfixadmin/templates/flash_error.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5fdc5c473d3016_31795011',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0b683be6a0b22970adb2aa15bbae31d378819465' => 
    array (
      0 => '/var/www/html/postfixadmin/templates/flash_error.tpl',
      1 => 1525293856,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5fdc5c473d3016_31795011 (Smarty_Internal_Template $_smarty_tpl) {
?><!-- <?php echo basename($_smarty_tpl->source->filepath);?>
 -->
<br clear="all"/><br />
<?php if (isset($_SESSION['flash'])) {
if (isset($_SESSION['flash']['info'])) {?><ul class="flash-info"><?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_SESSION['flash']['info'], 'msg');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['msg']->value) {
?><li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['msg']->value, ENT_QUOTES, 'UTF-8', true);?>
</li><?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?></ul><?php }
if (isset($_SESSION['flash']['error'])) {?><ul class="flash-error"><?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_SESSION['flash']['error'], 'msg');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['msg']->value) {
?><li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['msg']->value, ENT_QUOTES, 'UTF-8', true);?>
</li><?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?></ul><?php }
}
}
}
