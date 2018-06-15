{if !$ajax}
    <form action="" method="post" id="testform" >
        <input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
        <div class="blu">
            <div class="right">
                <div class="pagination"></div>
            </div>
            <div class="clear"></div>
        </div>
        <a href="?cmd=module&module={$moduleid}&do=viewlogs" id="currentlist" style="display:none" updater="#updater"></a>
        <table width="100%" cellspacing="0" cellpadding="3" border="0" class="glike hover" style="">
            <thead>
                <tr>
                    <th width="20%"><a href="?cmd=module&module={$moduleid}&do=viewlogs&orderby=when|ASC" class="sortorder">Date</a></th>
                    <th width="60%"><a href="?cmd=module&module={$moduleid}&do=viewlogs&orderby=what|ASC" class="sortorder">Description</a></th>
                    <th width="20%"><a href="?cmd=module&module={$moduleid}&do=viewlogs&orderby=who|ASC" class="sortorder">Username</a></th>
                </tr>
            </thead>
            <tbody id="updater">
            {/if}
           {include file="`$newtemplates`ajax.logs.tpl"}
        {if !$ajax}
        </tbody>
    </table>
    <div class="blu">

        <div class="right">
            <div class="pagination"></div>
        </div>
        <div class="clear"></div>
    </div>
    {securitytoken}
</form>
{/if}