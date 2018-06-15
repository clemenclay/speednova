
<div class="blu"> 
    <div class=" menubar">
        {if $action == 'viewlog'}
            <a href="?cmd=invoices&action=edit&id={$invoice.id}"  class="tload2" id="backto">
                <strong>&laquo; {$lang.backto} {$lang.invoice}</strong>
            </a>
        {else}
            <a href="?cmd=invoices&list={$currentlist}&showall=true"  class="tload2" id="backto">
                <strong>&laquo; {$lang.backto} {$currentlist} {$lang.invoices}</strong>
            </a>
        {/if}
        {if !$invoice.readonly}
            &nbsp;

            {if $invoice.status!='Draft' && $invoice.status!='Recurring' && $invoice.status!='Creditnote'}
                <a class="setStatus menuitm menu-auto" name="markpaid" id="hd1"  >
                    <span class="morbtn">{$lang.Setstatus}</span>
                </a>
                <a class="addPayment menuitm menu-auto {if $invoice.status=='Draft'}disabled{/if}" name="markunpaid"  href="#" >
                    <span class="addsth">{$lang.addpayment}</span>
                </a>
            {/if}
            {if !$forbidAccess.deleteInvoices}
                <a class="deleteInvoice menuitm menu-auto" name="delete" >
                    <span style="color:#FF0000">{$lang.Delete}</span>
                </a>
            {/if}

            <span class="menu-auto-reset">&nbsp;</span>

            {if $invoice.status!='Draft' && $invoice.status!='Recurring'}
                <a class="sendInvoice menuitm menu-auto" name="send" href="#" >
                    <span style="font-weight:bold">{$lang.Send}</span>
                </a>
                <a class="menuitm setStatus menu-auto" id="hd2" onclick="return false;" href="#" >
                    <span class="morbtn">{$lang.moreactions}</span>
                </a>
            {/if}

            {if $invoice.status=='Recurring'}
                <a class="menuitm menu-auto-reset" name="send"  href="?action=download&invoice={$invoice.id}" >
                    <span >{$lang.previewinvoice}</span>
                </a>
                {if $invoice.recurring.recstatus!='Finished'} {$lang.generatenewinvoices}
                    <a class="menuitm menu-auto {if $invoice.recurring.recstatus!='Stopped'}activated{/if} recstatus recon" href="#" >
                        <span >On</span>
                    </a>
                    <a class="menuitm menu-auto {if $invoice.recurring.recstatus=='Stopped'}activated{/if} recstatus recoff" href="#" >
                        <span >Off</span>
                    </a>
                {/if}
            {/if}

            {if $type != 'bottom'}
                <ul id="hd1_m" class="ddmenu">
                    <li class="act-status off-paid">
                        <a href="Paid">{$lang.Paid}</a>
                    </li>
                    <li  class="act-status off-unpaid ">
                        <a href="Unpaid">{$lang.Unpaid}</a>
                    </li>
                    <li  class="act-status off-cancelled ">
                        <a href="Cancelled">{$lang.Cancelled}</a>
                    </li>

                    <li  class="act-status off-collections ">
                        <a href="Collections">{$lang.Collections}</a>
                    </li>
                    <li  class="act-status off-refunded">
                        <a href="Refunded">{$lang.Refunded}</a>
                    </li>
                    {if "config:CNoteIssueForUnpaid"|checkcondition}
                        <li  class="act-status off-credited">
                            <a href="Credited">{$lang.Credited}</a>
                        </li>
                    {/if}
                </ul>

                <ul id="hd2_m" class="ddmenu">
                    <li>
                        <a href="?action=download&invoice={$invoice.id}"  class="directly">{$lang.downloadpdf}</a>
                    </li>
                    {if count($currencies)>1}
                        <li class="act-status off-paid">
                            <a href="ChangeCurrency">{$lang.ChangeCurrency}</a>
                        </li>
                    {/if}
                    {if $invoice.status!='Creditnote'}
                        <li class="act-status on-paid">
                            <a href="IssueRefund">{$lang.issuerefund}</a>
                        </li>
                        {if "config:CNoteIssueForUnpaid"|checkcondition}
                            <li class="act-status on-unpaid">
                                <a  href="?cmd=invoices&action=issuecreditnote&id={$invoice.id}&security_token={$security_token}" 
                                    class="directly"
                                    >Issue Credit Note</a>
                            </li>
                        {/if}
                        <li class="act-status on-unpaid">
                            <a href="SendReminder">{$lang.sendreminder}</a>
                        </li>
                    {/if}
                    <li>
                        <a href="EditDetails">{$lang.editdetails}</a>
                    </li>

                    <li>
                        <a href="CreateInvoice">{$lang.createnewinvoice}</a>
                    </li>
                    <li>
                        <a href="SendMessage">{$lang.SendMessage}</a>
                    </li>

                    {if $proforma && $invoice.paid_id!='' && !$invoice.bulkinvoice}
                        <li class="act-status on-paid on-creditnote">
                            <a href="EditNumber">{$lang.editnumber}</a>
                        </li>
                    {/if}
                    {if $proforma && $invoice.paid_id==''  && !$invoice.bulkinvoice}
                        <li class="act-status off-unpaid {if $invoice.status!='Paid' ||( $invoice.datepaid!='' &&  $invoice.datepaid!='0000-00-00 00:00:00')}disabled{/if}">
                            <a href="GenerateFinalId">Generate Final ID</a>
                        </li>
                    {/if}
                    <li class="act-status on-unpaid">
                        <a href="{if $invoice.locked}UnlockInvoice{else}LockInvoice{/if}">{if $invoice.locked}Unlock{else}Lock{/if} invoice</a>
                    </li>
                </ul>
            {/if}

            {adminwidget module="invoices" section="invoiceheader"}
        {/if}
    </div>
</div>
