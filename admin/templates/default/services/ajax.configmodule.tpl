 {assign var="default" value=$module.default}

<tr class="multimodule-{$kl}">
    <td align="right" valign="top" style="padding-top:15px;"><strong>{$lang.Server}</strong></td>
    <td><div style="width: 70%;">
            {if $additionalservers.$kl }
            <div>
                 <table border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td> <div class="ui-ddown serv_picker" id="serv_picker"  >
                                <div class="ui-ddown-default" onclick="$(this).hide();$(this).parent().find('.ui-ddown-list').show();">
                                    {if ($module.server && $module.server!='' && $module.server!=0) || $newserverid}

                                    {foreach from=$additionalservers.$kl item=gserver}{foreach from=$gserver.servers item=server}{if $module.server[$server.id] || $newserverid==$server.group_id}{$server.name}, {/if}{/foreach}{/foreach}
                                    {else}{$lang.pickservers}{/if}
                                </div>
                                <div class="ui-ddown-list">
                                    <ul class="left">
                                        {foreach from=$additionalservers.$kl item=gserver key=gname}


                                        {if $gserver.qty>1}
                                        <li><input type="checkbox" class="ccc_{$gserver.id}" onclick="check_scat(this,{$gserver.id});" id="gro-{$gserver.id}" /> <label for="gro-{$gserver.id}">{$gname} ({$gserver.qty} {$lang.Servers})</label></li>
                                        {foreach from=$gserver.servers item=server}
                                        <li class="nested"><input type="checkbox" class="elcc cc_{$server.group_id}" onclick="uncheck_scat(this,{$server.group_id})" name="modules[{$kl}][server][{$server.id}]" id="gs-{$server.id}" {if $module.server[$server.id]}checked='checked'{/if} value="{$server.id}"/> <label for="gs-{$server.id}" ><span>{$server.name}</span> ({$server.accounts}/{$server.max_accounts} {$lang.Accounts})</label></li>

                                        {/foreach}

                                        {else}
                                        <li><input type="checkbox"  class="elcc" value="{$gserver.servers[0].id}" name="modules[{$kl}][server][{$gserver.servers[0].id}]" id="gs-{$gserver.servers[0].id}" {foreach from=$gserver.servers item=server}{if $module.server[$server.id] || $newserverid==$gserver.id}checked='checked'{/if}{/foreach}/> <label for="gs-{$gserver.servers[0].id}">{$gname}: <span>{$gserver.servers[0].name}</span></label></li>
                                        {/if}
                                        {/foreach}



                                    </ul>
                                    <a href="#" onclick="return closeCpicker(this);" class="editbtn right" id="cpickclose">{$lang.Close}</a>
                                </div>
                            </div></td>
                        <td>
                            <a href="#" class="new_control" onclick="return getFieldValues('{if $product_id}{$product_id}{else}{$module.product_id}{/if}',this)" ><span class="{if $loadable}dwd{else}wizard{/if}" ><strong>{if $loadable}{$lang.getvalsfromserver}{else}Test Connection{/if}</strong></span></a>
                        </td>

                        <td> <a href="" class="new_control" onclick="$('#use_added_servers').hide();$('#prod_serverform').show();$('input[name=addserver]').val('1'); return false;"><span class="addsth" >{$lang.addnewserver}</span></a></td>

                    </tr>
                </table>





            </div>
            {else}
            <b>You need to configure your App first in Settings->Apps</b>
            {/if}
           
        </div>
    </td></tr>
{if !$multicustomconfig.$kl}
<tr class="multimodule">
    <td></td>
    <td  class="product_config_container">
        <div style="padding: 5px;">
           
            {if $loadable || $test_connection}
            {if $test_connection_result}
            <span style="margin-left: 10px; font-weight: bold;text-transform: capitalize; color: {if $test_connection_result.result == 'Success'}#009900{else}#990000{/if}">
                {$lang.test_configuration}:
                {if $lang[$test_connection_result.result]}{$lang[$test_connection_result.result]}{else}{$test_connection_result.result}{/if}
                {if $test_connection_result.error}: {$test_connection_result.error}{/if}
            </span>
            {/if}
            {if $newserverid}
            <span style="margin-left: 10px; font-weight: bold; color: #009900;padding:5px" class="shownice">
                {$lang.newappadded}
            </span>
            {/if}
            {/if}
            <span id="getvaluesloader"></span>
        </div>
        <div class="clear"></div>
        <div class="left" id="subwiz_opt">


            <table border="0"  width="100%" class="editor-container" cellpadding="5" cellspacing="0" {if $download_yml && empty($default)}style="display:none"{/if} id="configoptionstable">
                   {if $loadtemplates }
                   <tr>
                    <td colspan="2">
                        <div style="margin:20px;">
                            {if $loadtemplates}
                            <a onclick="return loadOStoConfig({if $product_id}{$product_id}{else}{$module.product_id}{/if})" class="new_control" href="#" id="loadostemplates" {if !$product.ospick}style="display:none"{/if}>
                               <span class="dwd">Load OS templates into Form field</span>
                            </a>
                            {if $osconfig_id}
                            <script type="text/javascript">
                                editCustomFieldForm({$osconfig_id},{if $product_id}{$product_id}{else}{$module.product_id}{/if});
                                refreshConfigView({if $product_id}{$product_id}{else}{$module.product_id}{/if});
                            </script>
                            {/if}
                            <script type="text/javascript">{literal}
                                if(typeof(getFieldValues)!='loadOStoConfig') {
                                function loadOStoConfig(pid) {
                                    //basically get values from server with extra param - loadosconfig=true
                                    $('input[name=addserver]').after("<input type='hidden' name='loadosconfig' value='true'/>");
                                    return getFieldValues(pid);
                                    }
                               }
                                {/literal}
                            </script>
                            {/if}

                        </div>

                        </td>
                    </tr>
                    {/if}
                {foreach from=$module.options item=conf key=k name=checker}
                <tr {if $smarty.foreach.checker.iteration%2==0}class="odd"{/if} id="{$k}row">

                    {assign var="name" value=$conf.name}
                    {assign var="amodulename" value=$module.modulename}
                    {assign var="baz" value="$amodulename$name"}

                    <td align="right" width="190">
                        <strong>{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{elseif $name}{$name}{else}{$k}{/if}:</strong>
                        {if $conf.description}
                            <a class="vtip_description" title="{$conf.description}" {if $conf.variable}id="config_{$conf.variable}_descr"{/if}></a><br/>
                        {/if}
                    </td>
                    <td {if $conf.variable}id="config_{$conf.variable}"{/if}>
                        {if $conf.type=='input'}
                            {include file='moduleconfig/ajax.input.tpl'}
                        {elseif $conf.type=='loadable'}
                            {include file='moduleconfig/ajax.loadable.tpl'}
                        {elseif $conf.type=='loadablebox'}
                            {include file='moduleconfig/ajax.loadablebox.tpl'}
                        {elseif $conf.type=='loadablecheck'}
                            {include file='moduleconfig/ajax.loadablecheck.tpl'}
                        {elseif $conf.type=='check'}
                            {include file='moduleconfig/ajax.check.tpl'}
                        {elseif $conf.type=='select'}
                            {include file='moduleconfig/ajax.select.tpl'}
                        {/if}
                        {if $conf.variable || $conf.forms}<span class="fs11"><input type="checkbox"  class="formchecker" rel="{if $conf.variable}{$conf.variable}{else}{$k}{/if}" />Allow client to adjust during order</span>{/if}

                    </td>
                </tr>
                {/foreach}
            </table>
        </div>
        <div class="clear"></div>
    </td>
</tr>

{else}
	{include file=$multicustomconfig.$kl}
{/if}
 <tr class="multimodule-{$kl}"></tr>
<tr>
    <td>
        {literal}
            <script type="text/javascript">
                ;(function (mid){
                    var inp = $('.multimodule-'+mid+':first').nextUntil('.multimodule-+mid+').find('input,textrea,select');
                    inp.each(function(){
                        var that = $(this);
                        if(that.parents('.multimodule').length || !that.attr('name') || !that.attr('name').length){
                            return true;
                        }
                        that.attr('name','modules['+mid+']'+that.attr('name').replace(/^([a-z_]*)/,"[$1]"));
                    })                    
                })('{/literal}{$kl}{literal}');
            </script>
        {/literal}
    </td>
</tr>
