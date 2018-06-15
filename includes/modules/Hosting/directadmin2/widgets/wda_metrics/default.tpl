
<h2>  Account statistics</h2> 
<br />
{foreach from=$list item=stat}
    <div>
        <div id="stats_emailac_counts_text" class="stats_left">
            {if $lang[$stat.key]}{$lang[$stat.key]}{elseif $stat.item}{$stat.item}{else}{$stat.key|capitalize}{/if}
            <div class="pull-right">
                <span id="stats_emailac_counts_count">{$stat.count}</span> /
                <span id="stats_emailac_counts_max">{$stat.max}</span>
                {$stat.unit}
            </div>
        </div>
        <div>

            <div class="progress {if $stat.percent>90}progress-danger{elseif $stat.percent>65}progress-warning{else}progress-success{/if}">
                <div style="width: {$stat.percent}%;" title="0%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="{$stat.percent}" 
                     role="progressbar" class="progress-bar bar">
                </div>
            </div>
        </div>
    </div>
{/foreach}
<h3> Server Information </h3> 
<table class="table">
    {foreach from=$infostat item=stat}
        <tr>
            <td>
    {if $lang[$stat.key]}{$lang[$stat.key]}{elseif $stat.item}{$stat.item}{else}{$stat.key|capitalize}{/if}
            </td>
            <td>
                {$stat.value}
            </td>
        </tr>
    {/foreach}
</table>
