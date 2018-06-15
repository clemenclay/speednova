<div class="wbox">
        <div class="wbox_header">
            {$lang.changeowner_widget}
        </div>
        <div class="wbox_content">
            {if $unpaidinvoice}
                {$lang.changeowner_invoiceinfo}<br>
                {$lang.manualrenew_unpaidinvoice} <a href="{$ca_url}clientarea/invoice/{$unpaidinvoice.id}/" >{$unpaidinvoice|@invoice}</a>

            {else}
                <form action="" method="post">
                    <input type="hidden" name="make" value="submit" />
                    {$lang.changeowner_guide}<br/><br/>

                    <table class="table">

                        <tr>
                            <td width="150"><strong>{$lang.new_owner_email}</strong></td>
                            <td>
                                <input name="newemail" class="inp" value="" />
                            </td>
                        </tr>

                    </table>
                    <input type="submit" class="btn btn-primary" value="{$lang.changeowner_widget}" onclick="return confirm('{$lang.manualrenew_confirm}');" />
                {securitytoken}</form>
            {/if}

        </div>
</div>

