<table class="tonapp"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td>{$lang.backupevery}</td>
            <td>Next backup</td>
            <td>Backups to keep</td>
            <td width="120"></td>
        </tr>
    </thead>
    {foreach item=schedule from=$schedules key=id}
        <tr>
            <td align="right">
                {foreach from=$schedule.days item=day name=days}
            {if $lang[$day]}{$lang[$day]|capitalize}{else}{$day|capitalize}{/if} {$schedule.starttime}{if !$smarty.foreach.days.last},{/if}
        {/foreach}
    </td>
    <td>
        {$schedule.next|dateformat:$date_format}
    </td>
    <td>
    {if $schedule.maxfiles}{$schedule.maxfiles}{else}-{/if}
</td>
<td>
    <a title="{$lang.delete}" href="{$service_url}&vpsdo=backupschedule&vpsid={$vpsid}&schedule_id={$schedule.id}&do=delete&security_token={$security_token}" 
       onclick="return confirm('{$lang.suretodeleteschedule}');" class="small_control small_delete fs11" >
        {$lang.delete}
    </a>
</td>
</tr>
{foreachelse}
    <tr>
        <td colspan="5">{$lang.nothing}</td>
    </tr>
{/foreach}
</table>
{if $maxsnapshots > 0}
    <div style="padding:10px 0px;text-align:right" class="right">
        <input type="button" value="{$lang.newschedule}" onclick="$('#addschedule').show();
                return false" class="blue">

    </div>
    <div id='addschedule' style="display:none;">
        <form action="" method="post" id>
            <input type="hidden" name="do" value="create"/>

            <br/><h3> {$lang.addschedule}: </h3>
            <table class="table"  cellspacing="0" style="border-top:solid 1px #DDDDDD; width: 100%">
                <tr>
                    <td>
                        <span class="period monthly weekly">
                            <b>
                                <span class="period weekly">{$lang.dayweek}</span>
                            </b><br />
                            <label class="checkbox span2">
                                <input type="checkbox" value="mon" name="schedule[dow][]" /> Monday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="tue" name="schedule[dow][]" /> Tuesday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="wed" name="schedule[dow][]" /> Wednesday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="thu" name="schedule[dow][]" /> Thursday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="fri" name="schedule[dow][]" /> Friday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="sat" name="schedule[dow][]" /> Saturday
                            </label>
                            <label class="checkbox span2">
                                <input type="checkbox" value="sun" name="schedule[dow][]" /> Sunday
                            </label>
                        </span>
                    </td>
                    <td style="white-space: nowrap; width: 30%">
                        <b>{$lang.time}</b><br />

                        <select id="hour" name="schedule[hour]" class="styled period monthly weekly daily" style="width: 50px"></select>
                        <select id="min" name="schedule[min]" class="styled" style="width: 50px"></select>

                    </td>
                    <td>
                        <b class="span2">Backups to keep</b><br />
                        <select id="maxsnap" name="schedule[maxsnapshots]" class="styled" style="width: 50px"></select>

                    </td>
                    <td align="center" valign="bottom">
                        <input type="submit" value="{$lang.submit}" style="font-weight:bold;padding:2px 3px;"  class="blue" />
                    </td>
                </tr>
            </table>
            {securitytoken}
        </form>
    </div>
    <div class="clear"></div>
    {literal}
        <script type="text/javascript">
            String.prototype.lpad = function(padString, length) {
                var str = this;
                while (str.length < length)
                    str = padString + str;
                return str;
            }
            function _insertOptions(el, from, to, by, nopad) {
                by = by | 1
                el.children().remove();
                while (from <= to) {

                    var pv = from;
                    if (!nopad)
                        pv = pv.toString().lpad('0', 2);
                    el.append('<option value="' + pv + '">' + pv + '</option>');
                    from += by;
                }
            }
            _insertOptions($('#hour'), 0, 24);
            _insertOptions($('#min'), 0, 58, 15);
        {/literal}
        {if $maxsnapshots}
            _insertOptions($('#maxsnap'), 1, parseInt('{$maxsnapshots}') || 7, 1, true);
        {else}
            $('#maxsnap').parent().remove();
        {/if}
        {literal}

        </script>
    {/literal}
{else}
    <p style="padding:10px 0px;text-align:right; text-align: right" >Backup job limit reached</p>
{/if}