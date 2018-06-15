<div class="box no-padding">
    <div class="box-header">
        <h3 class="box-title">Support report</h3>
    </div>
    <div class="box-body">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped">

            <tr>
                <th>Date</th>
                <th>Ticket</th>
                <th>Time spent</th>
                <th>Staff notes</th>
            </tr>

            {foreach from=$report item=r}
                <tr>
                    <td>{$r.date_created|dateformat:$date_format}</td>
                    <td><a href="?cmd=tickets&action=view&num={$r.ticket_number}" target="_blank">#{$r.ticket_number} - {$r.subject}</a></td>
                    <td>{$r.hours} h</td>
                    <td>{$r.output}</td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="4">No data to report yet</td>
                </tr>
            {/foreach}
        </table>
    </div>

</div>