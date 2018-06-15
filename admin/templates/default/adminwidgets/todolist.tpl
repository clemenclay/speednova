{if !empty($todo)}
<p style="line-height: 1.75em;">
    {if $todo.templates_c_outside}
        <label class="label label-danger">{$lang.critical}</label> Move templates_c directory outside of web-accessible folder! <a href="https://hostbill.atlassian.net/wiki/display/DOCS/Additional+security+steps" target="_blank">Secure directories</a></a> <br />
    {/if}
    {if $todo.emailoff}
        <label class="label label-danger">{$lang.emailisturnetoff}</label> <br />
    {/if}
    {if $todo.install}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.removeinstall}<br />
    {/if}
    {if $todo.changepass}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.changeadminpass}<br />
    {/if}
    {if $todo.cron}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.cronnotwork} <a href="?cmd=configuration&action=cron">{$lang.doitnow}.</a><br />

        {if $todo.chmodcron}
            <label class="label label-info">Info</label> {$lang.chmodcron}<br />
        {/if}
    {/if}

    {if $todo.queue_failed}
        <label class="label label-danger">{$lang.critical}</label>  Queue is not enabled in cron. Add following crontab entry: <code>* * * * * php {$hb_maindir}queue.php</code><br />
    {/if}
    {if $todo.queue_slow}
        <label class="label label-info">Info</label> You can increase your queue processing performance: <a href="https://hostbill.atlassian.net/wiki/display/DOCS/HostBill+Queue+Performance" target="_blank">Learn more</a><br />
    {/if}

    {if $todo.crontaskblock}
        <label class="label label-danger">{$lang.crontaskdisabled}</label> <a href="?cmd=configuration&action=cron">{$lang.Learnmore}.</a> <a href="?cmd=logs&action=errorlog"> Error Log</a><br />
    {/if}
    {if $todo.downindex}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.placeindexdownload}<br />
    {/if}
    {if $todo.tempindex}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.placeindextemplates}<br />
    {/if}
    {if $todo.attindex}
        <label class="label label-danger">{$lang.critical}</label>  {$lang.placeindexattachments}<br />
    {/if}
    {if $todo.config}
        <label class="label label-info">Info</label> {$lang.shouldeditconfig}. <a href="?cmd=configuration">{$lang.doitnow}.</a><br />
    {/if}
    {if $todo.modules}
        <label class="label label-info">Info</label> {$lang.tostartconfigservers} <a href="?cmd=managemodules">{$lang.doitnow}.</a><br />
    {/if}
    {if $todo.servers}
        <label class="label label-info">Info</label> {$lang.configureservers} <a href="?cmd=servers">{$lang.doitnow}.</a><br />
    {/if}
    {if $todo.packages}
        <label class="label label-info">Info</label> {$lang.addpackagestosell}<a href="?cmd=services&action=addproduct">{$lang.doitnow}.</a><br />
    {/if}
</p>
{/if}