<table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
                <tbody>
                  <tr>
                    <th width="20"><input type="checkbox" id="checkall"/></th>
                    <th width="80"><a href="?cmd=accounts&list={$currentlist}&orderby=id|ASC" class="sortorder">{$lang.accounthash}</a></th>
                    <th width="190"><a href="?cmd=accounts&list={$currentlist}&orderby=lastname|ASC"  class="sortorder">{$lang.clientname}</a></th>
                    <th><a href="?cmd=accounts&list={$currentlist}&orderby=name|ASC"  class="sortorder">{$lang.Service}</a></th>
                    <th><a href="?cmd=accounts&list={$currentlist}&orderby=lblabel|ASC"  class="sortorder">Label</a></th>
                    <th  width="80"><a href="?cmd=accounts&list={$currentlist}&orderby=lbtype|ASC"  class="sortorder">{$lang.Type}</a></th>
                    <th  width="60"><a href="?cmd=accounts&list={$currentlist}&orderby=lbport|ASC"  class="sortorder">Port</a></th>
                    <th  width="200"><a href="?cmd=accounts&list={$currentlist}&orderby=lbips|ASC"  class="sortorder">IP</a></th>
                    <th width="100"><a href="?cmd=accounts&list={$currentlist}&orderby=status|ASC"  class="sortorder">{$lang.Status}</a></th>
                    <th  width="80"><a href="?cmd=accounts&list={$currentlist}&orderby=next_due|ASC"  class="sortorder">{$lang.nextdue}</a></th>
                    <th width="20"/>
                  </tr>
                </tbody>
                <tbody id="updater">

              {if file_exists("`$custolist_dir`ajax.admin_list.tpl")}
					{include file="`$custolist_dir`ajax.admin_list.tpl"}
			  {/if}
    </tbody><tbody id="psummary">
            <tr>
                <th></th>
                <th colspan="10">
                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                </th>
            </tr>
        </tbody>
</table>