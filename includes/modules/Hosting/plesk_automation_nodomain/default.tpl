<tr>
    <td></td>
    <td>
        <div style="padding: 5px;">
            {if $loadable || $test_connection}
                {if $test_connection_result}
                    <span style="margin-left: 10px; font-weight: bold;text-transform: capitalize; color: {if $test_connection_result.result == 'Success'}#009900{else}#990000{/if}">
                        {$lang.test_configuration}:
                        {if $lang[$test_connection_result.result]}{$lang[$test_connection_result.result]}
                        {else}{$test_connection_result.result}
                        {/if}
                        {if $test_connection_result.error}: {$test_connection_result.error}
                        {/if}
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

            <table border="0"  width="600" class="editor-container" cellpadding="5" cellspacing="0" id="configoptionstable">
                {foreach from=$options item=conf key=k name=checker} 
                    <tr {if $smarty.foreach.checker.iteration%2==0}class="odd"{/if} id="{$k}row">

                        {assign var="name" value=$conf.name}
                        {assign var="baz" value="$modulename$name"}

                        <td align="right" width="190">
                            <strong>{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}: </strong>{if $conf.description}<br/>
                            <small {if $conf.variable}id="config_{$conf.variable}_descr"{/if}>{$conf.description}</small>{/if}
                        </td>
                        <td {if $conf.variable}id="config_{$conf.variable}"{/if}>
                            {if $conf.type=='input'}
                                {if !$editor}
                                    <div class="org-content "> 
                                        <span>
                                            {if $default.$k!==false}{$default.$k}
                                            {elseif $conf.default}{$conf.default}
                                            {/if} 
                                        </span>
                                        <a href="#" class="editbtn iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {/if}
                                    <input name="options[{$k}]" value="{if $default.$k!==false}{$default.$k}{elseif $conf.default}{$conf.default}{/if}" />
                                    {if $k == 'package'}
                                        <button id="getPlanBtn">Get plan values</button>
                                    {/if}
                                </div>
                                {if !$editor}
                                    </div>    
                                {/if}
                            {elseif $conf.type=='loadable'}
                                {if !$editor}
                                    <div class="org-content "> 
                                        <span>
                                            {if is_array($conf.default)}
                                                {foreach from=$conf.default item=cs}
                                                    {if $cs|is_array && $default.$k==$cs[0]}{$cs[1]}
                                                    {elseif $default.$k== $cs}{$cs}
                                                    {/if}
                                                {/foreach}
                                            {elseif $default.$k!=''}{$default.$k}
                                            {/if}
                                        </span>
                                        <a href="#" class="editbtn  iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {/if}
                                    {if is_array($conf.default)}
                                        <select name="options[{$k}]" {if $conf.reload}onchange="return getFieldValues('{if $product_id}{$product_id}{else}{$product.id}{/if}')"{/if}>
                                            {foreach from=$conf.default item=cs}
                                                {if $cs|is_array}
                                                    <option {if $default.$k== $cs[0]}selected="selected" {/if} value="{$cs[0]}">{$cs[1]}</option>
                                                {else}
                                                    <option {if $default.$k== $cs}selected="selected" {/if}>{$cs}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {else}
                                        <input name="options[{$k}]" value="{if $default.$k}{$default.$k}{/if}" />
                                    {/if}
                                    {if !$editor}
                                    </div>
                                {/if}
                            {elseif $conf.type=='loadablebox'}
                                {if !$editor}
                                    <div class="org-content ">
                                        {if $default.$k=='1'}{$lang.On}
                                        {else}{$lang.Off}
                                        {/if}
                                        <a href="#" class="editbtn  iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {/if}    
                                    {if is_array($conf.default)}
                                        <input name="options[{$k}]" value="1" type="checkbox" {if $conf.default[0]}checked="checked"{/if} />
                                    {else}
                                        <input type="checkbox" value="1" name="options[{$k}]" {if $default.$k=='1'}checked='checked'{/if} />
                                    {/if}
                                    {if !$editor}
                                    </div>    
                                {/if}
                            {elseif $conf.type=='loadablecheck'}
                                {if !$editor}
                                    <div class="org-content ">
                                        {if is_array($conf.default)}
                                            {foreach from=$conf.default item=cs}
                                                {if $cs|is_array && is_array($default.$k) && in_array($cs[0],$default.$k)}{$lang.On}
                                                {elseif is_array($default.$k) && in_array($cs,$default.$k)}{$lang.On}
                                                {/if}
                                            {/foreach}
                                        {elseif $default.$k|is_array}
                                            {foreach from=$default.$k item=opt name=multicheck2}
                                                {if $opt != '' || $smarty.foreach.multicheck2.iteration == 1}{$opt}<br />
                                                {/if}
                                            {/foreach}
                                        {/if}
                                        <a href="#" class="editbtn   iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {/if}
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
                                        <a href="" onclick="addmultifield(this, '{$k}');
                                                return false;" style="font-size:9px;" >Add next value</a>
                                    {/if}
                                    {if !$editor}
                                    </div>    
                                {/if}
                            {elseif $conf.type=='check'}
                                {if !$editor}
                                    <div class="org-content ">
                                        {if $default.$k=='1' || (!$default.type && $conf.default)}{$lang.On}
                                        {else}{$lang.Off}
                                        {/if}
                                        <a href="#" class="editbtn  iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {/if}                        
                                    <input type="checkbox" value="1" name="options[{$k}]" {if $default.$k=='1' || (!$default.type && $conf.default)}checked='checked'{/if}  {if $conf.reload}onchange="return getFieldValues({if $product_id}{$product_id}{else}{$product.id}{/if})"{/if} />
                                    {if !$editor}
                                    </div>    
                                {/if}
                            {elseif $conf.type=='select'}
                                {if !$editor}
                                    <div class="org-content  ">
                                        <span>
                                            {foreach from=$conf.default item=cs}
                                                {if $cs|is_array && $default.$k== $cs[0]}{$cs[1]}
                                                {elseif $default.$k== $cs}{$cs}
                                                {/if}
                                            {/foreach}
                                        </span>
                                        <a href="#" class="editbtn iseditable">{$lang.Edit}</a>
                                    </div>
                                    <div class="editor">
                                    {else}
                                        <div>
                                        {/if}
                                        <select id="conf_opt_{$k}" name="options[{$k}]" {if $conf.reload}onchange="return getFieldValues({if $product_id}{$product_id}{else}{$product.id}{/if})"{elseif $conf.onchange}onchange="{$conf.onchange}"{/if}>
                                            {foreach from=$conf.default item=cs}
                                                {if $cs|is_array}
                                                    <option {if $default.$k== $cs[0]}selected="selected" {/if} value="{$cs[0]}">{$cs[1]}</option>
                                                {else}
                                                    <option {if $default.$k== $cs}selected="selected" {/if}>{$cs}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                        {if $conf.onchange}

                                            <script type="text/javascript">function lm{$k}{literal}() {{/literal}
                                                    $('#conf_opt_{$k}').change();
                                                {literal}}
                                                {/literal}
                                                    lm{$k}();
                                                    appendLoader('lm{$k}');
                                            </script>

                                        {/if}
                                        {if !$editor}
                                        </div>    
                                    {else}
                                    </div>
                                {/if}
                            {/if}

                        </td>
                    </tr>
                {/foreach}
                <tr id="last">
                    <td colspan="2">
                        <p>To set the unlimited resource value, enter '-1' into a field. Leave empty for default plan value</p>
                    </td>
                </tr>
            </table>
            
        </div>
        <div class="clear"></div>
    </td>
</tr>
{literal}
    <script type="text/javascript">
        $(function() {
            $('#serv_picker input').change(function() {
                if ($('#serv_picker input:checked').length) {
                    $('#getPlanBtn').prop('disabled', false).removeAttr('disabled');
                } else {
                    $('#getPlanBtn').prop('disabled', true).attr('disabled', 'disabled');
                }
            }).change();
            $('input[name="options[subscribe]"]').change(function() {
                var self = $(this),
                    opt = self.parents('#subscriberow').nextAll();
                if (self.is(':checked'))
                    opt.show();
                else
                    opt.hide();
            }).change();

            $('#getPlanBtn').click(function(e) {
                e.preventDefault();
   
                function fillPlanData(resp) {
                    var pack = $('[name="options[package]"]');
                    $('#subwiz_opt').addLoader()
                    
                    $.post('?cmd=plesk_automation_nodomain&action=getTemplate', {
                        id: pack.val(),
                        server: $('#serv_picker input:checked:first').val(),
                    }, function(resp) {
                        $('#preloader').remove();
                        if (resp.list) {
                            var npack = $('<select name="options[package]" clas="inp"></select>');
                            for (var i = 0; i < resp.list.length; i++) {
                                npack.append('<option value="' + resp.list[i].st_id + '">' + resp.list[i].name + '</option>');
                            }
                            npack.val(pack.val());
                            pack.replaceWith(npack);
                            npack.change(fillPlanData)
                        }
                        if (resp.data) {
                            var resources = {};
                            for (var x = 0; x < resp.data.resource_types.length; x++) {
                                resources[resp.data.resource_types[x].resclass_name] = resp.data.resource_types[x].limit;
                            }

                            $('#configoptionstable tr[id]:not(#packagerow)').each(function() {
                                var upd = false;
                                var that = $(this),
                                    id = that.attr('id').replace(/row$/, '');
                                for (x in resources) {
                                    if (x.match(id)) {
                                        var val = parseInt(resources[x]);
                                        that.find('input').val(resources[x]);
                                        upd = true;
                                        break;
                                    }
                                }
                                if (!upd)
                                    that.find('input').val('');
                            });
                        }
                    });
                };
                fillPlanData();
            });
            
        });
    </script>
{/literal}