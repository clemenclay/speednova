<a href="?cmd=emails&resetfilter=1"  {if $currentfilter}style="display:inline"{/if}  class="freseter">{$lang.filterisactive}</a>
<form class="searchform filterform" action="?cmd=logs&action={$log}" method="post" onsubmit="return filter(this)">
    <table width="100%" cellspacing="2" cellpadding="3" border="0" >
        <tbody>

{if $log=='clientactivity'}
    <tr>

        <td width="15%">{$lang.clientname}</td>
        <td><input type="text" value="{$currentfilter.lastname}" size="40" name="filter[lastname]"/></td>
        <td width="15%">Logged staff</td>
        <td><input type="text" value="{$currentfilter.admin_name}" size="40" name="filter[admin_name]"/></td>
    </tr>
    <tr>
        <td>Action</td>
        <td ><input type="text" value="{$currentfilter.description}" size="40" name="filter[description]"/></td>
        <td>IP</td>
        <td ><input type="text" value="{$currentfilter.ip}" size="40" name="filter[ip]"/></td>

    </tr>
{elseif $log=='adminactivity'}
    <tr>

        <td width="15%">{$lang.Username}</td>
        <td><input type="text" value="{$currentfilter.username}" size="40" name="filter[username]"/></td>
        <td width="15%">IP</td>
        <td><input type="text" value="{$currentfilter.ip}" size="40" name="filter[ip]"/></td>
    </tr>

{elseif $log=='importlog'}
    <tr>

        <td width="15%">{$lang.To}</td>
        <td><input type="text" value="{$currentfilter.to}" size="40" name="filter[to]"/></td>
        <td width="15%">{$lang.Subject}</td>
        <td><input type="text" value="{$currentfilter.subject}" size="40" name="filter[subject]"/></td>
    </tr>
    <tr>

        <td width="15%">{$lang.Status}</td>
        <td colspan="3"><select  name="filter[status]">
                <option value=""></option>
                <option value="0">Filtered Out</option>
                <option value="1">Unregistered </option>
                <option value="2">Sucessful</option>
                <option value="3">Not&nbsp;Found </option>
                <option value="4">Skipping</option>
                <option value="5">Error</option>
                <option value="6">Mismatch</option>
                <option value="7">System</option>
                <option value="8">Auto-Submitted</option>
                <option value="9">Time-Limit</option>
                <option value="10">Ticket Closed</option>
                <option value="11">Duplicate</option>
            </select></td>
    </tr>


{elseif $log=='default'}
    <tr>

        <td width="15%">{$lang.Description}</td>
        <td colspan="3"><input type="text" value="{$currentfilter.what}" size="40" name="filter[what]"/></td>
    </tr>
    <tr>
        <td>Username</td>
        <td ><input type="text" value="{$currentfilter.who}" size="40" name="filter[who]"/></td>
        <td>IP</td>
        <td ><input type="text" value="{$currentfilter.ip}" size="40" name="filter[ip]"/></td>

    </tr>
{elseif $log=='coupons'}
    <tr>

        <td width="15%">{$lang.clientname}</td>
        <td><input type="text" value="{$currentfilter.lastname}" size="40" name="filter[lastname]"/></td>
        <td width="15%">Coupon code</td>
        <td><input type="text" value="{$currentfilter.code}" size="40" name="filter[code]"/></td>
    </tr>

{elseif $log=='apilog'}

    <tr>

        <td width="15%">IP</td>
        <td><input type="text" value="{$currentfilter.ip}" size="40" name="filter[ip]"/></td>
        <td width="15%">API ID</td>
        <td><input type="text" value="{$currentfilter.api_id}" size="40" name="filter[api_id]"/></td>
    </tr>
    <tr>

        <td width="15%">Called function</td>
        <td><input type="text" value="{$currentfilter.action}" size="40" name="filter[action]"/></td>
        <td width="15%">Result</td>
        <td><input type="text" value="{$currentfilter.result}" size="40" name="filter[result]"/></td>
    </tr>
{elseif $log=='fraudlog'}  <tr>

    <td width="15%">{$lang.clientname}</td>
    <td><input type="text" value="{$currentfilter.lastname}" size="40" name="filter[lastname]"/></td>
    <td width="15%">Output</td>
    <td><input type="text" value="{$currentfilter.output}" size="40" name="filter[output]"/></td>
</tr>
{elseif $log=='errorlog'}
    <tr>

        <td width="15%">Error</td>
        <td colspan="3"><input type="text" value="{$currentfilter.entry}" size="120" name="filter[entry]"/></td>
    </tr>
{elseif $log=='cancelations'}
    <tr>

        <td width="15%">{$lang.clientname}</td>
        <td><input type="text" value="{$currentfilter.lastname}" size="40" name="filter[lastname]"/></td>
        <td width="15%">Reason</td>
        <td><input type="text" value="{$currentfilter.reason}" size="40" name="filter[reason]"/></td>
    </tr>
{/if}



<tr><td colspan="4"><center><input type="submit" value="{$lang.Search}" class="btn btn-primary btn-sm" />&nbsp;&nbsp;&nbsp;<input class="btn btn-default btn-sm" type="submit" value="{$lang.Cancel}" onclick="$('#hider2').show();
                        $('#hider').hide();
                        return false;"/></center></td></tr>


        </tbody>
    </table>{securitytoken}</form>

<script type="text/javascript">bindFreseter();</script>