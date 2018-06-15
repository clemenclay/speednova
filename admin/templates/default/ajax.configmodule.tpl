{if $cmd=='productaddons'}<tr>
<td align="right" valign="top" width="160"><strong>Module</strong></td>
<td><strong style="font-size: 14px">{$addon.modulename}</strong><br />{$addon.moduledescription}</td>

</tr>
<tr>
    <td></td>
    <td id="subloader">
    {if $options}
    <div >


        <table border="0"  width="70%" class="editor-container">

        {foreach from=$options item=conf key=k name=checker}

        {if $smarty.foreach.checker.iteration%2=='1'}
    <tr>
    {/if}

            {assign var="baz" value=$k}
                            <td align="right" width="160" style="vertical-align: top; padding-top: 5px;"><strong>{if $lang.$baz}{$lang.$baz}{else}{$baz}{/if}:</strong></td>
                                        <td style="" width="">
                {if $conf.type=='input'}
                <input name="options[{$k}]" value="{if $default.$k != ''}{$default.$k}{elseif $conf.default}{$conf.default}{/if}" /></div>



                {elseif $conf.type=='loadable'}
                    {if is_array($conf.default)}
                        <select name="options[{$k}]" {if $conf.reload}onchange=""{/if}>
                            {foreach from=$conf.default item=cs}
                               {if $cs|is_array}
                               <option {if $default.$k==$cs[0]}selected="selected" {/if} value="{$cs[0]}">{$cs[1]}</option>
                               {else}
                                <option {if $default.$k== $cs}selected="selected" {/if}>{$cs}</option>
                                {/if}
                            {/foreach}
                        </select>
                    {else}
                        <input name="options[{$k}]" value="{if $default.$k != ''}{$default.$k}{/if}" />
                    {/if}
                {elseif $conf.type=='loadablecheck'}

                    {if is_array($conf.default)}
                        {foreach from=$conf.default item=cs}
                           {if $cs|is_array}
                              <input type="checkbox" name="options[{$k}][]" {if is_array($default.$k) && in_array($cs[0],$default.$k)}checked="checked"{/if} value="{$cs[0]}" /> {$cs[1]} <br />
                           {else}
                              <input type="checkbox" name="options[{$k}][]" {if is_array($default.$k) && in_array($cs,$default.$k)}checked="checked"{/if} value="{$cs}" /> {$cs} <br />
                           {/if}
                       {/foreach}

                    {else}
                                            <span>
                                            {if $default.$k|is_array}
                                                {foreach from=$default.$k item=opt name=multicheck}
                                                    {if $opt != '' || $smarty.foreach.multicheck.iteration == 1}
                                                        <input name="options[{$k}][]" value="{$opt}" /><br />
                                                    {/if}
                                                {/foreach}
                                            {else}
                                                <input name="options[{$k}][]" value="" /><br />
                                            {/if}
                                            </span>
                                            <a href="" onclick="addmultifield(this, '{$k}');return false;" style="font-size:9px;" >Add next value</a>
                    {/if}
                {elseif $conf.type=='check'}
                    <input type="checkbox" value="1" name="options[{$k}]" {if $default.$k=='1' || (!$default && $conf.default)}checked='checked'{/if}  {if $conf.reload}onchange=""{/if} />

                {elseif $conf.type=='select'}
                    <select name="options[{$k}]" >
                            {foreach from=$conf.default item=cs}
                                {if $cs|is_array}
                                                                   <option {if $default.$k== $cs[0]}selected="selected" {/if} value="{$cs[0]}">{$cs[1]}</option>
                                                                {else}
                                                                    <option {if $default.$k== $cs}selected="selected" {/if}>{$cs}</option>
                                                                {/if}
                            {/foreach}

                    </select>
                {/if}
                        </td>
            {if $smarty.foreach.checker.index%2=='1' && $smarty.foreach.checker.iteration!= '1'}
                            </tr>
                        {/if}
        {/foreach}
        </table>
        </div>
    {/if}
    </td>
</tr>


{else}
<tr>
                      <td align="right" valign="top" style="padding-top:15px;"><strong>{$lang.Server}</strong></td>
                      <td><div style="width: 70%;">
                         {if $servers || $server_values}
                          <div id="use_added_servers" {if $server_values.addserver}style="display:none"{/if}>
                          <table border="0" cellpadding="2" cellspacing="0" >
                              <tr>
                                <td> <div class="ui-ddown serv_picker" id="serv_picker"  >
                              <div class="ui-ddown-default" onclick="$(this).hide();$(this).parent().find('.ui-ddown-list').show();">
                                {if ($product.server && $product.server!='' && $product.server!=0) || $newserverid}

                                {foreach from=$servers item=gserver}{foreach from=$gserver.servers item=server}{if $product.server[$server.id] || $newserverid==$server.group_id}{$server.name}, {/if}{/foreach}{/foreach}
                                {else}{$lang.pickservers}{/if}
                            </div>
                            <div class="ui-ddown-list">
                                <ul class="left">
                                    {foreach from=$servers item=gserver key=gname}


                                    {if $gserver.qty>1}
                                    <li><input type="checkbox" class="ccc_{$gserver.id}" onclick="check_scat(this,{$gserver.id});" id="gro-{$gserver.id}" /> <label for="gro-{$gserver.id}">{$gname} ({$gserver.qty} {$lang.Servers})</label></li>
                                    {foreach from=$gserver.servers item=server}
                                    <li class="nested"><input type="checkbox" class="elcc cc_{$server.group_id}" onclick="uncheck_scat(this,{$server.group_id})" name="server[{$server.id}]" id="gs-{$server.id}" {if $product.server[$server.id]}checked='checked'{/if} value="{$server.id}"/> <label for="gs-{$server.id}" ><span>{$server.name}</span> ({$server.accounts}/{$server.max_accounts} {$lang.Accounts})</label></li>

                                    {/foreach}

                                    {else}
                                        <li><input type="checkbox"  class="elcc" value="{$gserver.servers[0].id}" name="server[{$gserver.servers[0].id}]" id="gs-{$gserver.servers[0].id}" {foreach from=$gserver.servers item=server}{if $product.server[$server.id] || $newserverid==$gserver.id}checked='checked'{/if}{/foreach}/> <label for="gs-{$gserver.servers[0].id}">{$gname}: <span>{$gserver.servers[0].name}</span></label></li>
                                        {/if}
                                    {/foreach}



                                </ul>
                                <a href="#" onclick="return closeCpicker(this);" class="editbtn right" id="cpickclose">{$lang.Close}</a>
                            </div>
                          </div></td>
                          <td>
                          <a href="#" class="new_control" onclick="return getFieldValues('{if $product_id}{$product_id}{else}{$product.id}{/if}',this)" ><span class="{if $loadable}dwd{else}wizard{/if}" ><strong>{if $loadable}{$lang.getvalsfromserver}{else}Test Connection{/if}</strong></span></a>
                          </td>

                                <td> <a href="" class="new_control" onclick="$('#use_added_servers').hide();$('#prod_serverform').show();$('input[name=addserver]').val('1'); return false;"><span class="addsth" >{$lang.addnewserver}</span></a></td>

                            </tr>
                          </table>





                          </div>
                        {/if}
                        <div id="prod_serverform" {if (!$server_values.addserver && $servers) || !$server_fields}style="display: none"{/if}  class="sectionheadblue">
                             <div style="font-size: 14px"><strong>New server</strong>
                                {if $servers}<a style="font-size: 14px; font-weight: bold;" onclick="$('#prod_serverform').hide();$('#use_added_servers').show();$('input[name=addserver]').val('0'); return false;" class="editbtn" href="">{$lang.Cancel}</a>{/if}
                            </div>
                             <input name="addserver" value="{if $server_values.addserver || !$servers}1{else}0{/if}" type="hidden" />

                        <table border="0" cellpadding="0" cellspacing="6" width="100%" style="margin-bottom:10px;">
                            {if $server_fields.display.hostname}<tr><td  align="right" width="100"><strong>{if $server_fields.description.hostname}{$server_fields.description.hostname}{else}{$lang.Hostname}{/if}</strong></td><td ><input  name="host" size="40" value="{$server_values.host}" class="inp"/></td></tr>{/if}
                            {if $server_fields.display.ip}<tr><td  align="right" width="100"><strong>{if $server_fields.description.ip}{$server_fields.description.ip}{else}{$lang.IPaddress}{/if}</strong></td><td ><input  name="ip" size="40" value="{$server_values.ip}" class="inp"/></td></tr>{/if}
                            {if $server_fields.display.username}<tr><td  align="right" width="100"><strong>{if $server_fields.description.username}{$server_fields.description.username}{else}{$lang.Username}{/if}</strong></td><td ><input  name="username" size="25" value="{$server_values.username}" class="inp"/></td></tr>{/if}
                            {if $server_fields.display.password}<tr><td  align="right" width="100"><strong>{if $server_fields.description.password}{$server_fields.description.password}{else}{$lang.Password}{/if}</strong></td><td ><input type="password" name="password" size="25" class="inp" value="{$server_values.password}" autocomplete="off"/></td></tr>{/if}
                            {if $server_fields.display.field1}<tr><td  align="right" width="100"><strong>{if $server_fields.description.field1}{$server_fields.description.field1}{/if}</strong></td><td ><input  name="field1" size="25" value="{$server_values.field1}" class="inp"/></td></tr>{/if}
                            {if $server_fields.display.field2}<tr><td  align="right" width="100"><strong>{if $server_fields.description.field2}{$server_fields.description.field2}{/if}</strong></td><td ><input  name="field2" size="25" value="{$server_values.field2}" class="inp"/></td></tr>{/if}
                            {if $server_fields.display.hash}<tr><td width="100" valign="top" align="right"><strong>{if $server_fields.description.hash}{$server_fields.description.hash}{else}{$lang.accesshash}{/if}</strong></td><td ><textarea name="hash" cols="40" rows="8" class="inp">{$server_values.hash}</textarea></td></tr>{/if}
                            {if $server_fields.display.ssl}<tr><td  align="right" width="100"><strong>{if $server_fields.description.ssl}{$server_fields.description.ssl}{else}{$lang.Secure}{/if}</strong></td><td align="left"><input type="checkbox" value="1" {if $server_values.secure == '1'}checked="checked"{/if} name="secure"/> {if $server_fields.description.ssl}{else}{$lang.usessl}{/if}</td></tr>{/if}

                            <tr><td></td><td>
                           <a href="#" class="new_control greenbtn" onclick="return getFieldValues('{if $product_id}{$product_id}{else}{$product.id}{/if}',this,true)" ><span class="disk" >{$lang.addthisserver}</span></a>
                                <span style="margin-left: 30px"><a onclick="return getFieldValues('{if $product_id}{$product_id}{else}{$product.id}{/if}',this,false)" id="testing_button" href="#" class="new_control"><span class="wizard">{$lang.test_configuration}</span></a></span>
                                </td></tr>
                        </table>
                        </div>
                          </div>
                      </td></tr>
{if !$customconfig}
   <tr>
        <td></td>

        <td class="product_config_container">
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
            <div id="subwiz_opt">



                <table border="0"  width="100%" class="editor-container" cellpadding="5" cellspacing="0" {if $download_yml && empty($default)}style="display:none"{/if} id="configoptionstable">
        {if $loadtemplates  }
                    <tr>
                        <td colspan="2">
                            <div style="margin:20px;">
        {if $loadtemplates}
                                <a onclick="return loadOStoConfig({if $product_id}{$product_id}{else}{$product.id}{/if})" class="new_control" href="#" id="loadostemplates" {if !$product.ospick}style="display:none"{/if}>
                                    <span class="dwd">Load OS templates into Form field</span>
                                </a>
            {if $osconfig_id}
                                <script type="text/javascript">
                                    editCustomFieldForm({$osconfig_id},{if $product_id}{$product_id}{else}{$product.id}{/if});
                                    refreshConfigView({if $product_id}{$product_id}{else}{$product.id}{/if});
                                </script>
            {/if}
                                <script type="text/javascript">{literal}
                                    function loadOStoConfig(pid) {
                                        //basically get values from server with extra param - loadosconfig=true
                                        $('input[name=addserver]').after("<input type='hidden' name='loadosconfig' value='true'/>");
                                        return getFieldValues(pid);
                                    }
                                {/literal}
                                </script>
        {/if}

                            </div>

                        </td>
                    </tr>
        {/if}
        {foreach from=$options item=conf key=k name=checker}
        <tr {if $smarty.foreach.checker.iteration%2==0}class="odd"{/if} id="{$k}row">
                            {assign var="name" value=$conf.name}
                            {assign var="baz" value="$modulename$name"}

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
    {if $extended_options}
        {if !$show_extended}
            <tr>
                <td></td>
                <td align="left">
                    <a href="" onclick="{literal}$('#show_extended').show(); $('#extended').val(1); $(this).hide(); return false;{/literal}" >
                        <strong style="font-size:16px">{$lang.morefeatures}</strong><br />
                    </a>
                </td>
            </tr>
        {/if}
<tr id="show_extended" {if !$show_extended}style="display: none"{/if}>
    <td></td>
    <td class="product_config_container">
        <table border="0" cellpadding="2" cellspacing="0" width="100%">
            <input type="hidden" id="extended" name="show_extended" {if $show_extended}value="1"{else}value="0"{/if} />
    {foreach from=$extended_options item=conf key=k name=checker}
        {if $smarty.foreach.checker.iteration%2=='1'}
            <tr>
        {/if}

            {assign var="name" value=$conf.name}
            {assign var="baz" value="$modulename$name"}
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

        {if $smarty.foreach.checker.index%2=='1' && $smarty.foreach.checker.iteration!= '1'}
            </tr>
        {/if}
    {/foreach}
        </table>
    </td>
</tr>

{/if}

{literal}
<script>
         $(function(){
            $("a.vtip_description").not('.vtip_applied').vTip();

            function lookforsliders() {
            var pid = $('#product_id').val();
            $('.formchecker').unbind('click').click(function () {
                    if (!$('#serv_picker input[type=checkbox][name]:checked:eq(0)').val()) {
                        alert('Please configure & select server first');
                        return false;
                    }


                var tr = $(this).parents('tr, .ftr').eq(0);
                var rel = $(this).attr('rel').replace(/[^a-z0-9A-Z_]/g, '');
                if (!$(this).is(':checked')) {
                    if (!confirm('Are you sure you want to remove related Form element? ')) {
                        return false;
                    }
                    if ($('#configvar_' + rel).length) {
                        ajax_update('?cmd=configfields&make=delete', {
                            id: $('#configvar_' + rel).val(),
                            product_id: pid
                        }, '#configeditor_content');
                    }
                    tr.find('.tofetch').removeClass('fetched').removeClass('disabled');
                    tr.find('input, select').eq(0).removeAttr('disabled', 'disabled').show();
                    $(this).parents('span').eq(0).find('a.editbtn').remove();
                } else {
                    var el = $(this);
                    var rel = $(this).attr('rel');
                    tr.find('input, select').eq(0).attr('disabled', 'disabled').hide();
                    NProgress.start();

                    var index = $('.module_tab_pick','#module_tab_pick_container').index($('.module_tab_pick.picked','#module_tab_pick_container'));
                    var fields = $('form#productedit').serialize();

                    $.post('?cmd=services&action=showmodule'
                        +'&getvalues='+$('.module_config_tab:eq('+index+') input.elcc','#module_config_container').serialize()
                        +'&'+$('.module_config_tab:eq('+index+') input.elcc','#module_config_container').serialize()
                        ,
                        {
                        no_test_connection: 1,
                        addformelement: $(this).attr('rel'),
                        variableid: rel,
                        id: pid,
                        k: index,
                        fields: fields,
                        module: $('.module_config_tab:eq('+index+') .modulepicker','#module_config_container').val(),
                    }, function (data) {
                        var r = parse_response(data);
                        if (r) {
                            el.parents('span').eq(0).append(r);
                            NProgress.done();
                            ajax_update('?cmd=configfields', {product_id: pid, action: 'loadproduct'}, '#configeditor_content');
                        }
                    });
                }
            }).each(function () {

                var rel = $(this).attr('rel').replace(/[^a-z0-9A-Z_]/g, '');


                if ($('#configvar_' + rel).length < 1)
                    return 1;

                var fid = $('#configvar_' + rel).val();
                var tr = $(this).attr('checked', 'checked').parents('tr, .ftr').eq(0);

                tr.find('input, select').eq(0).attr('disabled', 'disabled').hide();
                tr.find('.tofetch').addClass('disabled');
                $(this).parents('span').eq(0).append(' <a href="#" onclick="return editCustomFieldForm(' + fid + ',' + pid + ')" class="editbtn orspace">Edit related form element</a>');
            });

        }
        lookforsliders();
         });
</script>
{/literal}


{else}
	{include file=$customconfig}
{/if}

{/if}
