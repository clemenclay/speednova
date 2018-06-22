<?php /* Smarty version 2.6.26, created on 2018-06-20 21:38:43
         compiled from login.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'login.tpl', 52, false),array('modifier', 'capitalize', 'login.tpl', 134, false),)), $this); ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
<title>HostBill - <?php echo $this->_tpl_vars['business_name']; ?>
 </title>
<link href="<?php echo $this->_tpl_vars['template_dir']; ?>
dist/stylesheets/application.css?v=<?php echo $this->_tpl_vars['hb_version']; ?>
" rel="stylesheet" media="all" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jquery-1.3.2.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
    <?php echo '<style>


html, body {
	/*height:100%;*/
	min-height:100%;
	position:relative;
}
	.lighterblue {
		background: #EBF3FF;
	}
</style>	'; ?>


</head>

<body style="" onload="$('#username').focus();">


<div class="login-box" >
	<img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img//hostbill-logo.png" style="margin-bottom:10px;width:109px" />
	<div style=" padding:2px;margin-bottom:4px;background:#ffffff;" class="box">
	

		
<?php if ($this->_tpl_vars['banned']): ?>

<span class="error"><?php echo $this->_tpl_vars['lang']['youripbanned']; ?>
 (<?php echo $this->_tpl_vars['banned']; ?>
). <?php echo $this->_tpl_vars['lang']['trylater']; ?>
</span>
<?php elseif ($this->_tpl_vars['action'] == 'passforgotten'): ?>
<div class="lighterblue" style="padding:15px;">
    <?php if ($this->_tpl_vars['reminder_sent']): ?>
        <strong><?php echo $this->_tpl_vars['lang']['resetpass_sent']; ?>
</strong>
    <?php elseif ($this->_tpl_vars['already_reset']): ?>
        <strong><?php echo $this->_tpl_vars['lang']['resetpass_alreadysent']; ?>
</strong> <br /> <?php echo $this->_tpl_vars['lang']['resetpass_alreadysent2']; ?>

	
    <?php else: ?>

    <?php if ($this->_tpl_vars['wrong_email']): ?><div  style="border:1px solid #DDDDDD;background:#FFFFDF;padding:10px;"><span class="error"><?php echo $this->_tpl_vars['lang']['resetpass_wrongemail']; ?>
</span></div><?php endif; ?>
    <form action="" method="post">
        <table border="0" width="100%" cellpadding="2" cellspacing="2">
        <tr><td><?php echo $this->_tpl_vars['lang']['resetpass_enteremail']; ?>
:</td></tr>
        <tr><td><input name="emailaddr"  class="foc2"/></td></tr>
        <tr><td align="center"><input type="submit" style="font-weight: bold" value="<?php echo $this->_tpl_vars['lang']['ResetPassword']; ?>
" /></td></tr>
        </table>
		<?php echo smarty_function_securitytoken(array(), $this);?>

    </form>
    <?php endif; ?>
</div>
    <div class="blu"><a href="index.php">&laquo; <?php echo $this->_tpl_vars['lang']['LoginReturn']; ?>
</a></div>
<?php else: ?>

		
		<div class="lighterblue" style="padding:15px;">
		<?php if ($this->_tpl_vars['licenseerror']): ?>
		<?php if ($this->_tpl_vars['licenseproblem'] == '1'): ?>
						<?php echo $this->_tpl_vars['lang']['licenseproblem1']; ?>

                                               
					<?php elseif ($this->_tpl_vars['licenseproblem'] == '2'): ?>
						<?php echo $this->_tpl_vars['lang']['licenseproblem2']; ?>

						
					<?php elseif ($this->_tpl_vars['licenseproblem'] == '3'): ?>
						<?php echo $this->_tpl_vars['lang']['licenseproblem3']; ?>

						
					
					
					<?php endif; ?>
                    <?php if ($this->_tpl_vars['licenselog']): ?><?php echo $this->_tpl_vars['licenselog']; ?>
<?php endif; ?>
		<?php else: ?>
		<?php echo $this->_tpl_vars['lang']['welcomelog']; ?>

		<?php if ($this->_tpl_vars['reset_ok']): ?>
        <br/><strong><?php echo $this->_tpl_vars['lang']['reset_ok']; ?>
</strong> <?php endif; ?>
		<?php endif; ?></div>
			<div style="padding:15px;">
	<?php if (! $this->_tpl_vars['licenseerror']): ?>	<form name="loginform" action="" method="post">
<input name="action" value="login" type="hidden"/>
<?php endif; ?>
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
			
				<?php if ($this->_tpl_vars['error']): ?>
				<tr><td colspan="2" style="border:1px solid #DDDDDD;background:#FFFFDF;padding:10px;">
				<?php $_from = $this->_tpl_vars['error']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['blad']):
?>
					<span class="error"><?php echo $this->_tpl_vars['blad']; ?>
<br /></span>
				<?php endforeach; endif; unset($_from); ?>
				</td></tr>
				<?php endif; ?>
				
				<?php if ($this->_tpl_vars['licenseerror']): ?>
				
				
				<tr><td colspan="2">
					<?php if ($this->_tpl_vars['licenseproblem'] == '1'): ?>
						
                                                <?php echo $this->_tpl_vars['lang']['enteractivationcode']; ?>

						<form  action="" method="post">
					<input name="action" value="activate" type="hidden"/>
						<textarea style="margin:5px 0px;height:60px;" class="form-control" name="activate"></textarea>
						<center><input type="submit" value="Activate" class="btn btn-primary"/></center>
						</form>
										
					<?php endif; ?>

				
				</td></tr>
				
				
				<?php else: ?>
				<tr>
				<td colspan="2"><?php echo $this->_tpl_vars['lang']['Username']; ?>
:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;"><input name="username" value="<?php echo $this->_tpl_vars['submit']['login_email']; ?>
" class="form-control input-sm" id='username' type="text"/></td>
				</tr>
				<tr>
					<td colspan="2"><?php echo $this->_tpl_vars['lang']['Password']; ?>
:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;"><input name="password"  class="form-control input-sm" type="password" autocomplete="off"/> </td>
				</tr>

					<?php if (count ( $this->_tpl_vars['languages'] ) > 1): ?>
				<tr>
					<td colspan="2"><?php echo $this->_tpl_vars['lang']['Language']; ?>
:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;">
						<select name="language" class="form-control" style="width:330px">
						<?php $_from = $this->_tpl_vars['languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['langx']):
?><?php if ($this->_tpl_vars['langx'] == 'english'): ?><option value="<?php echo $this->_tpl_vars['langx']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['langx'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</option><?php endif; ?><?php endforeach; endif; unset($_from); ?>
						<?php $_from = $this->_tpl_vars['languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['langx']):
?><?php if ($this->_tpl_vars['langx'] != 'english'): ?><option value="<?php echo $this->_tpl_vars['langx']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['langx'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</option><?php endif; ?><?php endforeach; endif; unset($_from); ?>
						
						</select>
					</td>
				</tr>
					<?php endif; ?>
				<tr>
				<td width="50%"  align="left">
					<div class="checkbox">
						<label>
							<input name="rememberme" value="1" type="checkbox"/><?php echo $this->_tpl_vars['lang']['rememberme']; ?>

						</label>
					</div>
				</td>
				<td width="50%" align="right"><input type="submit" value="<?php echo $this->_tpl_vars['lang']['Login']; ?>
" class="btn btn-primary" style="font-weight:bold"/></td>
				</tr>
				<?php endif; ?>
			</table>
			<?php if (! $this->_tpl_vars['licenseerror']): ?>
					<?php echo smarty_function_securitytoken(array(), $this);?>

				</form><?php endif; ?></div>
			<div class="lighterblue" style="padding:15px;">
			<?php if (! $this->_tpl_vars['licenseerror']): ?>
			<a href="?action=passforgotten"><?php echo $this->_tpl_vars['lang']['passforgotten']; ?>
</a><br />
			<?php echo $this->_tpl_vars['lang']['currip']; ?>
 <strong><?php echo $this->_tpl_vars['ip']; ?>
</strong>
			<?php else: ?>
				<a href="index.php?licenseerror"><?php echo $this->_tpl_vars['lang']['clicktocheck']; ?>
</a>
				<?php endif; ?>
			</div>
		
<?php endif; ?>	
			

	</div>
	<div style="text-align:right;"><small>Powered by <a href="http://hostbillapp.com" target="_blank" >HostBill</a></small></div>
</div>




</body>
</html>