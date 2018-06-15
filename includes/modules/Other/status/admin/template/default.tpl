<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd=status"{/if}><span>Statuses</span></a>
            </li>
            <li class="{if $action == 'add'}active{/if} last">
                <a {if $action != 'add'}href="?cmd=status&action=add"{/if}><span>New Status</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1 haveitems" style="display: block; height: 20px;">
        </div>
    </div>
</div>
{if $statuses}

    <a id="currentlist" updater="#updater" style="display:none" href="?cmd=status"></a>
    <table width="100%" cellspacing=0 cellpadding="6px" class="glike hover">
        <tr>
            <th><a href="?cmd=status&orderby=date|ASC" class="sortorder">Date</a></th>
            <th><a href="?cmd=status&orderby=name|ASC" class="sortorder">Subject</a></th>
            <th><a href="?cmd=status&orderby=status|ASC" class="sortorder">Current Status</a></th>
            <th>Related Servers</th>
            <th><a href="?cmd=status&orderby=author|ASC" class="sortorder">Added by</a></th>
            <th style="width: 150px"></th>
        </tr>
        <tbody id="updater">
            {include file="ajax.default.tpl"}
        </tbody>
        <tr>
            <th colspan="6"><small>{$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span></small></th>
        </tr>
    </table>
    <input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
    <div class="blu">
        <div class="right">
            <div class="pagination"></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
{else}
    <div class="blank_state blank_kb">
        <div class="blank_info">
            <h1>Status Updates</h1>
            You can add new statuses and update them from here.
            <div class="clear"></div>
            <a style="margin-top:10px" href="?cmd=status&action=add" class="new_add new_menu">
                <span>Add status</span></a>
            <div class="clear"></div>
        </div>
    </div>
{/if}