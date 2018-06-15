{if !$wrapped}
    <div class="padding">
{/if}
{if $enableFeatures.netstat!='off'}
    <!-- Server Status -->
    <h2>{$lang.netstat|capitalize}</h2>
    <p>{$lang.showscurrentstatusyourservers}</p>

    <div class="server-status">
        <div class="padding" id="netstat_update">
            {include file="ajax.netstat.tpl"}
        </div>
    </div>
{/if}
{if !$wrapped}
    </div>
{/if}