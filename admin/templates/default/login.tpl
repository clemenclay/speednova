<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
<title>HostBill - {$business_name} </title>
<link href="{$template_dir}dist/stylesheets/application.css?v={$hb_version}" rel="stylesheet" media="all" />
<script type="text/javascript" src="{$template_dir}js/jquery-1.3.2.min.js?v={$hb_version}"></script>
    {literal}<style>


html, body {
	/*height:100%;*/
	min-height:100%;
	position:relative;
}
	.lighterblue {
		background: #EBF3FF;
	}
</style>	{/literal}

</head>

<body style="" onload="$('#username').focus();">


<div class="login-box" >
	<img src="{$template_dir}img//hostbill-logo.png" style="margin-bottom:10px;width:109px" />
	<div style=" padding:2px;margin-bottom:4px;background:#ffffff;" class="box">
	

		
{if $banned}

<span class="error">{$lang.youripbanned} ({$banned}). {$lang.trylater}</span>
{elseif $action=="passforgotten"}
<div class="lighterblue" style="padding:15px;">
    {if $reminder_sent}
        <strong>{$lang.resetpass_sent}</strong>
    {elseif $already_reset}
        <strong>{$lang.resetpass_alreadysent}</strong> <br /> {$lang.resetpass_alreadysent2}
	
    {else}

    {if $wrong_email}<div  style="border:1px solid #DDDDDD;background:#FFFFDF;padding:10px;"><span class="error">{$lang.resetpass_wrongemail}</span></div>{/if}
    <form action="" method="post">
        <table border="0" width="100%" cellpadding="2" cellspacing="2">
        <tr><td>{$lang.resetpass_enteremail}:</td></tr>
        <tr><td><input name="emailaddr"  class="foc2"/></td></tr>
        <tr><td align="center"><input type="submit" style="font-weight: bold" value="{$lang.ResetPassword}" /></td></tr>
        </table>
		{securitytoken}
    </form>
    {/if}
</div>
    <div class="blu"><a href="index.php">&laquo; {$lang.LoginReturn}</a></div>
{else}

		
		<div class="lighterblue" style="padding:15px;">
		{if $licenseerror}
		{if $licenseproblem=='1'}
						{$lang.licenseproblem1}
                                               
					{elseif $licenseproblem=='2'}
						{$lang.licenseproblem2}
						
					{elseif $licenseproblem=='3'}
						{$lang.licenseproblem3}
						
					
					
					{/if}
                    {if $licenselog}{$licenselog}{/if}
		{else}
		{$lang.welcomelog}
		{if $reset_ok}
        <br/><strong>{$lang.reset_ok}</strong> {/if}
		{/if}</div>
			<div style="padding:15px;">
	{if !$licenseerror}	<form name="loginform" action="" method="post">
<input name="action" value="login" type="hidden"/>
{/if}
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
			
				{if $error}
				<tr><td colspan="2" style="border:1px solid #DDDDDD;background:#FFFFDF;padding:10px;">
				{foreach from=$error item=blad}
					<span class="error">{$blad}<br /></span>
				{/foreach}
				</td></tr>
				{/if}
				
				{if $licenseerror}
				
				
				<tr><td colspan="2">
					{if $licenseproblem=='1'}
						
                                                {$lang.enteractivationcode}
						<form  action="" method="post">
					<input name="action" value="activate" type="hidden"/>
						<textarea style="margin:5px 0px;height:60px;" class="form-control" name="activate"></textarea>
						<center><input type="submit" value="Activate" class="btn btn-primary"/></center>
						</form>
										
					{/if}

				
				</td></tr>
				
				
				{else}
				<tr>
				<td colspan="2">{$lang.Username}:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;"><input name="username" value="{$submit.login_email}" class="form-control input-sm" id='username' type="text"/></td>
				</tr>
				<tr>
					<td colspan="2">{$lang.Password}:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;"><input name="password"  class="form-control input-sm" type="password" autocomplete="off"/> </td>
				</tr>

					{if count($languages)>1}
				<tr>
					<td colspan="2">{$lang.Language}:</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom:10px;">
						<select name="language" class="form-control" style="width:330px">
						{foreach from=$languages item=langx}{if $langx=='english'}<option value="{$langx}">{$langx|capitalize}</option>{/if}{/foreach}
						{foreach from=$languages item=langx}{if $langx!='english'}<option value="{$langx}">{$langx|capitalize}</option>{/if}{/foreach}
						
						</select>
					</td>
				</tr>
					{/if}
				<tr>
				<td width="50%"  align="left">
					<div class="checkbox">
						<label>
							<input name="rememberme" value="1" type="checkbox"/>{$lang.rememberme}
						</label>
					</div>
				</td>
				<td width="50%" align="right"><input type="submit" value="{$lang.Login}" class="btn btn-primary" style="font-weight:bold"/></td>
				</tr>
				{/if}
			</table>
			{if !$licenseerror}
					{securitytoken}
				</form>{/if}</div>
			<div class="lighterblue" style="padding:15px;">
			{if !$licenseerror}
			<a href="?action=passforgotten">{$lang.passforgotten}</a><br />
			{$lang.currip} <strong>{$ip}</strong>
			{else}
				<a href="index.php?licenseerror">{$lang.clicktocheck}</a>
				{/if}
			</div>
		
{/if}	
			

	</div>
	<div style="text-align:right;"><small>Powered by <a href="http://hostbillapp.com" target="_blank" >HostBill</a></small></div>
</div>




</body>
</html>