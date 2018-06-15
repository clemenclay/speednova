{if $graphs}
 {foreach from=$graphs item=ds}
<strong>{$ds.name}</strong>
 <div class="lgraph"><img src="?cmd=graphs&action=show&graph_id={$ds.id}" alt="{$graph.name}" /></div>
 {/foreach}
 {literal}
 <style type="text/css">
        .lgraph {
            min-height:150px;
            text-align: center;
            margin-bottom:10px;
}
    </style>
 {/literal}
    {else}
    <h4>No graphs assigned to this account yet</h4>
{/if}