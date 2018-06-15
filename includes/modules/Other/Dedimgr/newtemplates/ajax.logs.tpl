
            {if $logs}
                {foreach from=$logs item=log}
                    <tr>
                        <td>{$log.when|dateformat:$date_format}</td>
                        <td>
                            {if $log.rel && $log.rel_id}
                                <a href="?cmd=module&module={$moduleid}
                                   {if $log.rel == 'colocation'}&do=floors&colo_id={$log.rel_id}
                                   {elseif $log.rel == 'floor'}&do=floors&floor_id={$log.rel_id}
                                   {elseif $log.rel == 'rack'}&do=rack&rack_id={$log.rel_id}
                                   {elseif $log.rel == 'item'}&do=itemeditor&item_id={$log.rel_id}
                                   {elseif $log.rel == 'vendor'}&do=vendors#v{$log.rel_id}
                                   {elseif $log.rel == 'inventory'}&do=inventory&subdo=category&category_id={$log.rel_id}
                                   {elseif $log.rel == 7}&do=inventory&subdo=item&item_id={$log.rel_id}
                                {elseif $log.rel == 8}&do=inventory&subdo=fieldtypes#f{$log.rel_id}{/if}" target="_blank">{$log.what|escape}</a>
                        {else}
                            {$log.what|escape}
                        {/if}
                    </td>
                    <td>{$log.who|capitalize}</td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="3">No logs to display yet.</td>
            </tr>
        {/if}
