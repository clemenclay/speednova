<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}enomssl/style.css" />
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}enomssl/facebox/facebox.css" />
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}enomssl/tipsy/tipsy.css" />
<script type="text/javascript" src="{$orderpage_dir}enomssl/facebox/facebox.js"></script>
<script type="text/javascript" src="{$orderpage_dir}enomssl/tipsy/tipsy.js"></script>
<script type="text/javascript">
    {literal}
        $(document).ready(function () {

            $('.tipsing').tipsy({gravity: 'w', html: true});
        });

        function sh_els(el) {
            if ($(el).is(':checked')) {
                $('#bcontact').slideUp();

            } else {
                $('#bcontact').slideDown();
            }
        }
        function submitmform(el) {
            $('#mform').submit();
            return false;
        }
    {/literal}
</script>

{if $logged!='1'}
    <div id="loginform" style="display:none">
        <center><form name="" action="" method="post">
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


<form id="mform" action="" method="post">
    <div id="celeft">
        <input type="hidden" name="continue" value="1" />
        {include file='enomssl/cprogress.tpl'}

        <h3>{$lang.en_step3}</h3>
        {if !$noorg}
            <div class="wbox">
                <div class="wbox_header">{$lang.en_orgdetails}</div>
                <div class="wbox_content" >
                    <table border="0" cellpadding="0" cellspacing="6" width="100%">
                        <tr>
                            <td width="60%">
                                {if $certopt.organization_form}
                                    {include file=$certopt.organization_form}
                                {else}
                                    {include file='../common/sslcerts/contacts_org.tpl' organization=$customdata.organization}
                                {/if}
                            </td>
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
            </div>
        {else}
            <div class="wbox">
                <div class="wbox_header">{$lang.en_admincontact}</div>
                <div class="wbox_content" >
                    <table border="0" cellpadding="0" cellspacing="6" width="100%">
                        <tr>
                            <td width="60%">
                                {if $certopt.contact_form}
                                    {include file=$certopt.contacts_form type='admin'}
                                {else}
                                    {include file='../common/sslcerts/contacts.tpl' contact=$customdata.admin type='admin'}
                                {/if}
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
            </div>
        {/if}
        <div class="orderbox2 orderbox12">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <td width="33%" align="left">
                    <div style="padding:10px;">{$lang.fboldrequired} {if $logged=='1'}{else}<br />
                        <a href="#" onclick="{literal}$.facebox({div: '#loginform'});return false;{/literal}">{$lang.login}</a> {$lang.en_tofill}{/if}
                    </div>
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding:20px 10px;height:14px;"  width="70%">
                                &nbsp;&nbsp;
                            </td>
                            <td class="csubmit {if $customdata.cn=='' || !$customdata.cn}disabled{/if}" id="submiter">
                                <a href="#" onclick="return submitmform(this)">{$lang.continue}</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </table>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:10px">
            <tr>
                {if !$noorg}
                    <td width="50%" valign="top" style="padding-right:5px;" >
                        <div class="wbox">
                            <div class="wbox_header">{$lang.en_admincontact}</div>
                            <div class="wbox_content" >
                                {if $certopt.contact_form}
                                    {include file=$certopt.contact_form type='admin'}
                                {else}
                                    {include file='../common/sslcerts/contacts.tpl' contact=$customdata.admin type='admin'}
                                {/if}
                            </div>
                        </div>
                    </td>
                {/if}
                {if !$certopt.contact_form || $certopt.contact_types.billing || $certopt.contact_types.tech}
                    <td style="padding-left:5px;" valign="top">
                        <div class="wbox">
                            <div class="wbox_header">{$lang.en_billtech}</div>

                            <div class="wbox_content" >
                                <input type="checkbox" value="1" checked="checked" name="useadmin" onclick="sh_els(this)"/> {$lang.en_copybill}
                                <div id="bcontact" style="display:none;margin:10px 0px;">


                                    {if $certopt.contact_form}

                                        {foreach from=$certopt.contact_types item=ctype}
                                            {if $ctype == 'admin'}{continue}
                                            {elseif $ctype == 'billing'}<strong>{$lang.en_billcontact}</strong>
                                            {elseif $ctype == 'tech'}<strong>{$lang.en_techcontact}</strong>
                                            {/if}

                                            <hr style="color:#ccc;background-color:#ccc;height:1px;border:none;">
                                            {include file=$certopt.contact_form type=$ctype}<br />
                                        {/foreach}

                                    {else}
                                        <strong>{$lang.en_billcontact}</strong>
                                        <hr style="color:#ccc;background-color:#ccc;height:1px;border:none;">
                                        {include file='../common/sslcerts/contacts.tpl' contact=$customdata.billing type='billing'}
                                        <br />
                                        <strong>{$lang.en_techcontact}</strong>
                                        <hr style="color:#ccc;background-color:#ccc;height:1px;border:none;">
                                        {include file='../common/sslcerts/contacts.tpl' contact=$customdata.tech type='tech'}
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </td>
                {/if}
            </tr>

        </table>

    </div>
</form>
<div class="clear"></div>
