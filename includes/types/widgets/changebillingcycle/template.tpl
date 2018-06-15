<div class="wbox">
        <div class="wbox_header">
            {$lang.changebillingcycle_widget}
        </div>
        <div class="wbox_content">
            {if $notsupportedcycle}
                {$lang.changebillingcycle_notsupported}

            {elseif $unpaidinvoice}
                {$lang.changebillingcycle_invoiceinfo}<br>
                {$lang.manualrenew_unpaidinvoice} <a href="{$ca_url}clientarea/invoice/{$unpaidinvoice.id}/" >{$unpaidinvoice|@invoice}</a>

            {else}
                <form action="" method="post">
                    <input type="hidden" name="make" value="submit" />
                    {$lang.changebillingcycle_guide}<br/><br/>

                    <table class="table">
                        <tr>
                            <td width="150"><strong>{$lang.bcycle}</strong></td>
                            <td>{$service.total|price:$currency} / {$lang[$service.billingcycle]}</td>
                        </tr>
                        <tr>
                            <td width="150"><strong>{$lang.newbcycle}</strong></td>
                            <td>
                                <select name="cnewcycle">
                                    {if $newcycles.h!=0}<option value="h" >{$newcycles.h|price:$currency:true:true} {$lang.h}</option>{/if}
                                    {if $newcycles.d!=0}<option value="d" >{$newcycles.d|price:$currency:true:true} {$lang.d}</option>{/if}
                                    {if $newcycles.w!=0}<option value="w" >{$newcycles.w|price:$currency:true:true} {$lang.w}</option>{/if}
                                    {if $newcycles.m!=0}<option value="m" >{$newcycles.m|price:$currency:true:true} {$lang.m}</option>{/if}
                                    {if $newcycles.q!=0}<option value="q" >{$newcycles.q|price:$currency:true:true} {$lang.q}</option>{/if}
                                    {if $newcycles.s!=0}<option value="s" >{$newcycles.s|price:$currency:true:true} {$lang.s}</option>{/if}
                                    {if $newcycles.a!=0}<option value="a" >{$newcycles.a|price:$currency:true:true} {$lang.Annually}</option>{/if}
                                    {if $newcycles.b!=0}<option value="b" >{$newcycles.b|price:$currency:true:true} {$lang.b}</option>{/if}
                                    {if $newcycles.t!=0}<option value="t" >{$newcycles.t|price:$currency:true:true} {$lang.t}</option>{/if}
                                </select>
                            </td>
                        </tr>
                        {if $service.custom}
                        <tr>
                            <td colspan="2">
                                {$lang.changebillingcycle_guide2}
                            </td>
                        </tr>
                        {/if}
                    </table>
                    <input type="submit" class="btn btn-primary" value="{$lang.changebillingcycle_widget}" onclick="return confirm('{$lang.manualrenew_confirm}');" />
                {securitytoken}</form>
            {/if}

        </div>
</div>

