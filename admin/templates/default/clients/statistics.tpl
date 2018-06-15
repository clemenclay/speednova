<div class="row" style="margin-bottom: 20px;">

    <div class="col-md-3">
        <div class="stat-item">
            <div class="stat-data Open"><span class="Open">{$stats.income|price:$stats.currency_id}</span></div>
            <div class="stat-label">Transactions  Income</div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="stat-item">
            <div class="stat-data Paid"><span class="Paid">{$stats.invoice_paid|price:$stats.currency_id}</span></div>
            <div class="stat-label">{$stats.paid} {$lang.invoicespaid}</div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="stat-item">
            <div class="stat-data "><span class="Unpaid">{$stats.invoice_unpaid|price:$stats.currency_id}</span></div>
            <div class="stat-label">{$stats.unpaid} {$lang.invoicesdue}</div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="stat-item">
            <div class="stat-data "><span class="Cancelled">{$stats.invoice_cancelled|price:$stats.currency_id}</span></div>
            <div class="stat-label">{$stats.cancelled} {$lang.invoicescancel}</div>
        </div>
    </div>

</div>
{literal}
<style>

</style>
{/literal}

<table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tr>
        <td><strong>{$lang.Credit}</strong></td>
        <td >
            <div class="editline left" style="margin-right:10px">
                <div class="a1 editor-line" style="display:none;">
                    <textarea name="credit" style="height: 15px;width:80px;background:#fff;">{$client.credit}</textarea>
                    <a href="#" class="savebtn" onclick="$('#clientsavechanges').click();
                            return false">{$lang.savechanges}</a>
                </div>
            </div>
            <span class="a2  livemode" onclick="$('.secondtd').show();
                    $('.tdetails').hide();
                    $('.a2').hide();
                    $('.a1').show();
                    return false;"> <strong class="">{$client.credit|price:$stats.currency_id}</strong></span>
            <span class="a2 fs11 "><a href="#" class="editbtn" onclick="$('.secondtd').show();
                    $('.tdetails').hide();
                    $('.a2').hide();
                    $('.a1').show();
                    return false;">{$lang.Edit}</a></span>
            <span class="fs11 ">
                [ 
                <a class="editbtn" href="?cmd=transactions&amp;action=add&amp;related_client_id={$client_id}">{$lang.addcredit}</a>
                <a class="editbtn editgray" href="?cmd=clientcredit&filter[client_id]={$client_id}" target="_blank">Credit log</a>  
                ]
            </span>
        </td>
    </tr>

    {if $stats.accounts}
        {foreach from=$stats.accounts item=acct key=k}
            {assign var="descr" value="_hosting"}
            {assign var="baz" value="$k$descr"}
            <tr>
                <td><strong>{if $lang.$baz}{$lang.$baz}{else}{$k}{/if}</strong>	</td>
                <td>{$acct}</td>
            </tr>
        {/foreach}
    {/if}

    <tr>
        <td><strong>{$lang.Domains}</strong>	</td>
        <td>{$stats.domain}</td>
    </tr>
    <tr>
        <td><strong>{$lang.supptickets}</strong>	</td>
        <td>{$stats.ticket}</td>
    </tr>
    

</table>