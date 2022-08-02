<?php
/* Smarty version 3.1.32, created on 2020-12-18 07:37:43
  from '/var/www/html/postfixadmin/templates/header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5fdc5c473aacd7_39624124',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ba58428d0f8be6ba3b0f5b80bc8915cdbe3a45a1' => 
    array (
      0 => '/var/www/html/postfixadmin/templates/header.tpl',
      1 => 1525293856,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5fdc5c473aacd7_39624124 (Smarty_Internal_Template $_smarty_tpl) {
?><!-- <?php echo basename($_smarty_tpl->source->filepath);?>
 -->
<!doctype html>
<html lang="<?php if (isset($_SESSION['lang'])) {
echo $_SESSION['lang'];
}?>">
	<head>
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Postfix Admin - <?php echo $_SERVER['HTTP_HOST'];?>
</title>
		<link rel="shortcut icon" href="images/favicon.ico">
		<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['CONF']->value['theme_css'];?>
" />
<?php if ($_smarty_tpl->tpl_vars['CONF']->value['theme_custom_css']) {?>
		<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['CONF']->value['theme_custom_css'];?>
" />
<?php }?>
	</head>
	<body class="lang-<?php if (isset($_SESSION['lang'])) {
echo $_SESSION['lang'];
}?> page-<?php echo $_smarty_tpl->tpl_vars['smarty_template']->value;?>
 <?php if (isset($_smarty_tpl->tpl_vars['table']->value)) {?>page-<?php echo $_smarty_tpl->tpl_vars['smarty_template']->value;?>
-<?php echo $_smarty_tpl->tpl_vars['table']->value;
}?>">
		<div id="container">
		<div id="login_header">
		<a href='main.php'><img id="login_header_logo" src="<?php echo $_smarty_tpl->tpl_vars['CONF']->value['theme_logo'];?>
" alt="Logo" /></a>
<?php if ($_smarty_tpl->tpl_vars['CONF']->value['show_header_text'] === 'YES' && $_smarty_tpl->tpl_vars['CONF']->value['header_text']) {?>
		<h2><?php echo $_smarty_tpl->tpl_vars['CONF']->value['header_text'];?>
</h2>
<?php }?>
		</div>
<?php }
}
