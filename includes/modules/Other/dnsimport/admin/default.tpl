<link href="templates/default/js/chosen/chosen.css" rel="stylesheet" type="text/css"/>
<script src="templates/default/js/chosen/chosen.min.js" type="text/javascript"></script>
<link href="{$moduleurl}admin/styles.css" rel="stylesheet" type="text/css"/>
<script src="{$moduleurl}admin/script.js" type="text/javascript"></script>

<ul class="hbnav breadcrumb">
    <li class="step {if $section == 'default'}active{/if}">
        <a {if $section != 'default'} href="?cmd={$modulename}"{/if}><span>Select Server</span></a>
    </li>
    <li class="step {if $section == 'setup' }active{/if}">
        <a {if $section == 'setup'} href="?cmd={$modulename}&action=setup&server={$sid}"{/if}><span>Select Zones</span></a>
    </li>
    <li class="step {if $section == 'result' || $section == 'nozones'}active{/if}">
        <a><span>Result</span></a>
    </li>
</ul>
<div id="dnsimport">


    {if $section == 'default'}
        <form method="GET" action="">
            <input type="hidden" value="dnsimport" name="cmd">
            <input type="hidden" value="setup" name="action">
            <h2>Select App to import from</h2>
            <div>
                <select name="server" class="chosen">
                    {foreach from=$groups item=group}
                        <optgroup label="{$group.name}">
                            {foreach from=$group.servers item=server}
                                <option value="{$server.id}">{$server.name}</option>
                            {/foreach}
                        </optgroup>
                    {/foreach}
                </select>
                <button type="submit" class="dns-btn">Continue</button>
            </div>
            {securitytoken}
        </form>
    {elseif $section=='setup'}
        <form method="POST" action="">
            <input type="hidden" value="{$server|escape}" name="server">
            {if !$products}
                <p class="error">
                    No valid products. This tool requires at leas one product configured for dns module used with selected server.
                </p>
                <a class="dns-btn" href="?cmd={$modulename}" >Go Back</a>
            {else}
                <h2>Select domain to import</h2>
                <p class="info">Found {$zones|@count} zone(s) that can be imported</p>

                <table class="table dns-table" style="width: 90%">
                    <thead>
                        <tr>
                            <th>
                                <select name="zones" class="chosen" style="width: 100%" data-placeholder="Select Zones to import" multiple>
                                    <option></option>
                                    {foreach from=$zones item=zone key=zid}
                                        <option value="{$zid}">{$zone}</option>
                                    {/foreach}
                                </select>
                            </th>
                            <th style="width: 30%">
                                <select name="client" load="clients" style="width: 100%">
                            </th>
                            <th>
                                </select>
                                <select name="product"  class="chosen" style="width: 100%" data-placeholder="Select dns product">
                                    {foreach from=$products item=product}
                                        <option value="{$product.id}">{$product.name}</option>
                                    {/foreach}
                                </select>
                            </th>
                            <th>
                                <a id="add" class="dns-btn" href="#add" >Add item</a>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="dnsitems">
                        <tr class="placeholder">
                            <td colspan="4">No items added to import yet.</td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    <button class="dns-btn" type="submit">Import selected</button>
                    <a class="dns-btn" href="?cmd={$modulename}" >Go Back</a>
                </p>
                {securitytoken}
            {/if}
        </form>
    {elseif $section=='nozones'}
        <p class="info">
            No dns zones to import. Either ther are no zones on selected server or all of them exist in hostbill database.
        </p>
        <a class="dns-btn" href="?cmd={$modulename}" >Go Back</a>
    {elseif $section=='result'}
        {foreach from=$result item=req}
            <p class="info">Imported {$req.done|@count} zone(s) from {$req.zone|@count} requested, 
                <a href="?cmd=accounts&action=edit&id={$req.accountId}">Account #{$req.accountId}</a></p>
        {/foreach}
        <a class="dns-btn" href="?cmd={$modulename}&action=setup&server={$server|escape}" >Go Back</a>
    {/if}
</div>
