{if !$contacts}
    None, send to main profile
{else}
    <select name="contact_id">
        <option value="0">None, send to main profile</option>
        {foreach from=$contacts item=contact}
            <option value="{$contact.email}">{$contact.firstname} {$contact.lastname}</option>
        {/foreach}
    </select>
{/if}