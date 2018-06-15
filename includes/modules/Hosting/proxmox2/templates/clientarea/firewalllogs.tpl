{include file="`$onappdir`firewall_header.tpl"}
<table width="100%" cellspacing="0" class="data-table">
    <thead>
        <tr>
            <td width="120">#</td>
            <td>Log</td>
        </tr>
    </thead>
    <tbody>
        {foreach from=$logs item=log}
            <tr>
                <td>{$log.n}</td>
                <td>{$log.t}</td>
            </tr>
        {foreachelse}
            <tr>
                <td colspan="4">{$lang.nothing}</td>
            </tr>
        {/foreach}
    </tbody>
</table>