<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.rebuild}</h3>

    <div class="clear"></div>
</div>
<div class="content-bar">


    <div class="notice">
        <h3>{$lang.ReinstallVPS}<br/></h3>
        <p>{$lang.choose_template1} <font color="#cc0000">{$lang.choose_template2}</font></p>
    </div>
    <form action="" method="post">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker form-horizontal">
            <tbody>
                <tr>
                    <td colspan="2"><label><input type="radio" name="use_old_template" value="1" checked="checked" onchange="selecttplopt(1)"> {$lang.reinstalnotpl}</label></td>
                </tr>
                <tr>
                    <td colspan="2"><label><input type="radio" name="use_old_template" value="0" onchange="selecttplopt(0)"> {$lang.reinstalwithtpl}</label></td>
                </tr>
            </tbody>
            <tbody id="os_templates"  style="display: none" class="form-horizontal">
                {if $ostemplates}
                    <tr>
                        <td colspan="2">
                            <div class="control-group">
                                <label class="control-label">{$lang.os}</label>
                                <div class="controls">
                                    <select required="required" name="CreateVM[operating_system]" id="virtual_machine_operating_system" onchange="filtertemplates('family')" style="min-width:250px;" >
                                        <option value="linux" selected="selected">Linux</option>
                                        <option value="windows">Windows</option>
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr
                    <tr>
                        <td colspan="2">
                            <div class="control-group">
                                <label class="control-label">{$lang.distribution}</label>
                                <div class="controls">
                                    <select required="required" name="CreateVM[operating_system_distro]" id="virtual_machine_operating_system_distro" onchange="filtertemplates('distro')"style="min-width:250px;" >
                                        {foreach from=$distributions.linux item=d}
                                            <option value="{$d}">{$d|ucfirst}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="control-group">
                                <label class="control-label">{$lang.ostemplate}</label>
                                <div class="controls">
                                    <select style="min-width:250px;" required="required" name="os" id="virtual_machine_template_id" onchange="swapcheck($(this).val())" >
                                        {foreach from=$ostemplates item=templa}
                                            {if $templa.family=='linux' && $templa.distro==$distributions.linux[0]}
                                                <option value="{$templa[0]}" >
                                                    {$templa[1]} 
                                                    {if ($templa[4] && $templa[4]>0) || ($templa[3]>0 && $templa[2]=='template')} (
                                                        {if $templa[4] && $templa[4]>0} {$templa[4]|price:$currency} 
                                                        {/if}
                                                        {if $templa[3]>0 && $templa[2]=='template'} {$templa[3]}GB
                                                        {/if}
                                                        )
                                                    {/if}
                                                </option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
                {else}
                    <tr>
                        <td colspan="2" align="center" > 
                            <div class="text-center highlight-danger">
                                <strong>{$lang.ostemplates_error}</strong>
                            </div>
                        </td>
                    </tr>
                {/if}
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2" align="center" > 
                        <input type="submit" value="{$lang.ReinstallVPS}" name="changeos" class="blue" />
                    </td>
                </tr>
            </tbody>
        </table>

        {securitytoken}
    </form>
</div>
{if $ostemplates}
    <script type="text/javascript">

        {literal}
            var ostemplates = [];
            var distributions = {
                linux: [],
                windows: []
            };{/literal}

            {foreach from=$distributions.linux item=i key=k}distributions.linux[{$k}] = "{$i}";{/foreach}
            {foreach from=$distributions.windows item=i key=k}distributions.windows[{$k}] = "{$i}";{/foreach}
            {foreach from=$ostemplates item=i key=k}ostemplates[{$k}] ={literal} {{/literal}
                    id: "{$i[0]}", name: "{$i[1]} {if ($i[4] && $i[4]>0) || ($i[3]>0 && $i[2]=='template')} ( {if $i[4] && $i[4]>0} {$i[4]|price:$currency}  {/if} {if $i[3]>0 && $i[2]=='template'} {$i[3]}GB{/if} ){/if}", distro: "{$i.distro}", family: "{$i.family}", disabled: "{if $lang[$i.disabled]}{$lang[$i.disabled]}{else}{$i.disabled}{/if}"
                {literal}}{/literal};{/foreach}
                {literal}
                    $(function() {
                        filtertemplates('distro');
                    })
                {/literal}
            </script>
            {/if}