{foreach from=$series item=data key=name}
    <table class="table table-striped" id="datatable_{$widget.id}">
       <thead> <tr>
            {foreach from=$data.columns item=column}
                <th>{$column}</th>
            {/foreach}
        </tr></thead>
        <tbody>
        {foreach from=$data.data item=r}
            <tr>
                {foreach from=$r item=col}
                    <td>{$col}</td>
                {/foreach}
            </tr>
        {/foreach}
        </tbody>
    </table>
{/foreach}

<script>

    var pie_{$widget.id|replace:".":""} = function(){literal} {
        $('#datatable_{/literal}{$widget.id}{literal}').dataTable();
     }
    {/literal}
        {if $ajax}
        pie_{$widget.id|replace:".":""}();
        {else}
        appendLoader('pie_{$widget.id|replace:".":""}');
    {/if}

</script>