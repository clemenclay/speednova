{if $vpsdo == 'list_servers'}
    <select name="extra_details[server-id]" >
        <option value="">No server selected</option>
        {foreach from=$list item=name}
            <option {if $current == $name}selected="selected"{/if} value="{$name}">{$name}</option>
        {/foreach}
    </select>
{/if} 