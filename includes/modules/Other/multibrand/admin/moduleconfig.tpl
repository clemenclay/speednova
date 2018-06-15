
<table border="0" width="100%" cellpadding="3" class="gate-conf-overide">
    {*if $b.type=='Payment' || $b.type=='Other'}  
    <tr>
    <td width="170" style="vertical-align: top;text-align: right">{$lang.dispname}: </td>
    <td> 
    {hbinput value=$b.modname_unparsed  name="name"} 

    </td>
    </tr>
    {/if*}
    {if !empty($b.config)}
        {foreach from=$b.config item=conf key=k}
            <tr >
                {assign var="name" value=$k}
                {assign var="name2" value=$b.module}
                {assign var="baz" value="$name2$name"}

                {if $conf.type=='input'}
                    <td width="170" style="text-align: right">{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}: </td>   
                    <td >{if $conf.description}<a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if} 
                        <input type="text" name="option[{$k}]" value="{$conf.value}" /></td>
                    {elseif $conf.type=='password'}
                    <td width="170" style="text-align: right">{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}:</td>   
                    <td >{if $conf.description}<a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if} 
                        <input type="password" autocomplete="off" name="option[{$k}]" value="{$conf.value}" /></td>
                    {elseif $conf.type=='check'}
                    <td width="170" style="text-align: right">{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}:</td>  
                    <td >{if $conf.description}<a style="padding: 5px 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if} 
                        <input name="option[{$k}]" type="checkbox" value="1" {if $conf.value == "1"}checked="checked"{/if} /></td>
                    {elseif $conf.type=='checklist'}
                    <td width="170" style="text-align: right">{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}:</td>  
                    <td class="fs11" >{if $conf.description}<a style="padding: 5px 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if} 
                        {foreach from=$conf.default item=selectopt}
                            <label class="left" style="padding-right:10px"><input name="option[{$k}][]" type="checkbox" value="{$selectopt}" {if  in_array($selectopt,$conf.value)}checked="checked"{/if} />&nbsp;{$selectopt}</label>
                            {/foreach}
                    </td>
                {elseif $conf.type=='select'}
                    <td width="170" style="text-align: right"> {if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}: </td>  
                    <td >{if $conf.description}<a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if} 
                        <select name="option[{$k}]">
                            {foreach from=$conf.default item=selectopt}
                                <option {if $conf.value == $selectopt}selected="selected" {/if}>{$selectopt}</option>
                            {/foreach}
                        </select> 
                    </td>
                {elseif $conf.type=='textarea'}
                    <td colspan="2">{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}: {if $conf.description}<a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="{$conf.description}"></a>{/if}<br />
                        <span style="vertical-align:top"><textarea name="option[{$k}]" rows="5" cols="60">{$conf.value}</textarea></span>
                    </td>
                {elseif $conf.type=='button'}
                    <td colspan="2" >
                        <a href="#" class="menuitm menu" onclick="{$conf.value}"><span><strong>{if $lang.$baz}{$lang.$baz}{elseif $lang.$name}{$lang.$name}{else}{$name}{/if}</strong></span></a>
                    </td>
                {/if}

            </tr>
        {/foreach}
        {if $b.callback}
            <tr >
                <td width="170"  style="text-align: right">Callback URL:</td>
                <td ><input readonly="readonly" value="{$b.callback}" size="70"/></td>
            </tr>
        {/if}
    {/if}
</table> 
