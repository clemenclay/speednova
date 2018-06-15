<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}enomssl/tipsy/tipsy.css" />
<script type="text/javascript" src="{$orderpage_dir}enomssl/tipsy/tipsy.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}enomssl/facebox/facebox.css" />
<script type="text/javascript" src="{$orderpage_dir}enomssl/facebox/facebox.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}sslcertificates/style.css" />
{include file='sslcertificates/cprogress.tpl'}

{if $logged!='1'}
    <div id="loginform" style="display:none">
        <center>
            <form name="" action="" method="post">
                <table border="0" cellpadding="0" cellspacing="6" width="80%">
                    <tr>
                        <td align="left" colspan="2">
                            <label for="username" class="styled">{$lang.email}</label>
                            <input name="username" value="{$submit.username}" class="styled" style="width:96%"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <label for="password"  class="styled">{$lang.password}</label>
                            <input name="password" type="password" class="styled"  style="width:96%"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left"  >
                            <a href="{$ca_url}root&amp;action=passreminder" class="list_item" target="_blank">{$lang.passreminder}</a>
                        </td>
                        <td align="right">
                            <input type="hidden" name="action" value="login"/>
                            <input type="submit" value="{$lang.login}" class="padded btn" style="font-weight:bold"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </div>
{/if}

<div class="blue-pad">
    <h4>{$lang.step} 3</h4>
    <h3>{$lang.en_contacts}</h3>
</div>
<form id="mform" action="" method="post">
    <div id="celeft">
        {if !$noorg}
            <div class="white-box form-horizontal">
                <h3>{$lang.en_orgdetails}</h3>
                <div class="strike-line"></div>
                <table border="0" cellpadding="0" cellspacing="6" width="100%">
                    <tr>
                        <td width="60%">
                            {include file="../common/sslcerts/contacts_org.tpl" organization=$customdata.organization}
                        </td>
                        <td valign="top">
                            {if $approveremails}<div class="greenbox">
                                    <h3>{$lang.en_appemail}</h3><br />
                                    {$lang.en_appemail_desc}<br /><br />
                                    <center>
                                        <select name="approval_email">	

                                            {foreach from=$approveremails item=email}
                                                <option value="{$email}">{$email}</option>
                                            {/foreach}			
                                            {* if $approveremails *}
                                        </select>
                                    </center>
                                </div>
                            {/if}
                        </td>
                    </tr>
                </table>
            </div>
        {else}
            <div class="white-box">
                <h3>{$lang.en_admincontact}</h3>
                <div class="strike-line"></div>
                <table border="0" cellpadding="0" cellspacing="6" width="100%">
                    <tr>
                        <td width="60%">
                            {include file="../common/sslcerts/contacts.tpl" contact=$customdata.admin type='admin'}
                        <td valign="top">
                            {if $approveremails}
                                <div class="greenbox">
                                    <h3>{$lang.en_appemail}</h3>
                                    {$lang.en_appemail_desc}<br /><br />
                                    <center>
                                        <select name="approval_email">	

                                            {foreach from=$approveremails item=email}
                                                <option value="{$email}">{$email}</option>
                                            {/foreach}			
                                            {* if $approveremails *}
                                        </select>
                                    </center>
                                </div>
                            {/if}
                        </td>
                    </tr>
                </table>
            </div>
        {/if}
        <div class="white-box clearfix">
            <a href="#" class="btn btn-custom btn-custom-inline right" onclick="return step3.submitmform(this)">{$lang.continuetostep} 4 &raquo;</a>
            <div class="step-info">
                {$lang.fboldrequired} {if $logged=='1'}{else}<br />
                    <a href="#" onclick="{literal}$.facebox({div: '#loginform'});return false;{/literal}">{$lang.login}</a> {$lang.en_tofill}
                {/if}
            </div>
        </div>
        <div class="white-box">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:10px">
                <tr>
                    {if !$noorg }
                        <td width="50%" valign="top" style="padding-right:5px;" >
                            <h3>{$lang.en_admincontact}</h3>
                            <div class="strike-line"></div>
                            {include file="../common/sslcerts/contacts.tpl" contact=$customdata.admin type='admin'}
                            </div>
                        </td>
                    {/if}
                    <td style="padding-left:5px;" valign="top">
                        <div id="biltech">
                            <h3>{$lang.en_billtech}</h3>
                            <div class="strike-line"></div>
                        </div>

                        <div id="bcontact" style="display:none;">

                            <h3>{$lang.en_billcontact}</h3>
                            <div class="strike-line"></div>
                            {include file="../common/sslcerts/contacts.tpl" contact=$customdata.billing type='billing'}
                            <br />


                            <h3>{$lang.en_techcontact}</h3>
                            <div class="strike-line"></div>
                            {include file="../common/sslcerts/contacts.tpl" contact=$customdata.tech type='tech'}
                        </div>
                        <input type="checkbox" value="1" checked="checked" name="useadmin" onclick="step3.sh_els(this)"/> {$lang.en_copybill}
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
<div class="clear"></div>
<script type="text/javascript">
    step3.init();
</script>