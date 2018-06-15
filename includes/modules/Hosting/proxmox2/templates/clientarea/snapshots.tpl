{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        {if $vpsdo=='vmsnapshotschedule'}{$lang.snapshotschedule}
        {else}{$lang.snapshots}
        {/if}
    </h3>

    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $vpsdo=='snapshotschedule'}
        {include file="`$onappdir``$vpsdo`.tpl"}
    {else}
        <table class="tonapp"  width="100%" cellspacing=0>
            <thead>
                <tr>
                    <td style="width: 250px;">{$lang.date}</td>
                    <td>{$lang.name}</td>
                    <td>{$lang.description}</td>
                    <td style="width: 50px;">{$lang.memory}</td>
                    <td style="width: 100px;">&nbsp;</td>
                </tr>
            </thead>
            {foreach item=backup from=$backups}
                <tr>
                    <td style="white-space: nowrap;">
                        <span class="levels" data-level="{$backup.level}">
                            {section name=level loop=$backup.level step=1 start=0}&nbsp;&nbsp;&nbsp;{/section}{*}
                            {*}
                        </span>
                        {$backup.date}
                    </td>
                    <td>
                        {if $backup.current}<strong>{$backup.name}</strong> (Current)
                        {else}
                            {$backup.name}
                        {/if}

                    </td>
                    
                    <td>{$backup.description}</td>
                    <td>{if $backup.vmstate}Yes{else}No{/if}</td>
                    <td width="60" >
                        <a href="{$service_url}&vpsid={$vpsid}&vpsdo=snapshots&do=restore&snapshot={$backup.name|escape:'url'}&security_token={$security_token}" 
                           onclick="return confirm('Are you sure you want to restore to this snapshot?')" class="small_control small_backup_restore fs11">{$lang.restore}</a>
                        <a href="{$service_url}&vpsid={$vpsid}&vpsdo=snapshots&do=delete&snapshot={$backup.name|escape:'url'}&security_token={$security_token}" 
                           onclick="return confirm('Are you sure you want to delete to this snapshot?')" class="small_control small_delete fs11">{$lang.delete}</a>
                    </td>
                </tr>
            {foreachelse}
                <tr>
                    <td colspan="7">{$lang.nothing}</td>
                </tr>
            {/foreach}
        </table>
        <div style="padding: 10px 0; text-align: right">
            <a href="#create" id="snapshot-btn"
               class="btn btn-primary" >{$lang.createsnapshot}</a>
        </div>
    {/if}
    <div class="clear"></div>
    <div style="display: none">
        <div class="modal hide fade" id="createsnapshot">
            <div class="modal-header">
                <button type="button" class="close hide-modal" aria-hidden="true">×</button>
                <h3>Snapshot</h3>
            </div>
            <form class="form-horizontal" method="post" action="" style="margin: 0" >
                <div class="modal-body">
                    <input type="hidden" name="do" value="create" id="wdo">

                    <div class="control-group">
                        <label class="control-label" for="inputFirst">List Name</label>
                        <div class="controls">
                            <input type="text" id="inputFirst" name="snapshot[name]" placeholder="Snapshot name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputMemory">{$lang.memory}</label>
                        <div class="controls">
                            <input type="checkbox" id="inputMemory" name="snapshot[memory]" >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputDescription">{$lang.Description}</label>
                        <div class="controls">
                            <textarea id="inputDescription" name="snapshot[description]" placeholder="{$lang.description}"></textarea>
                        </div>
                    </div>
                    {securitytoken}
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" id="buttonSubmit">Create Snapshot</button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file="`$onappdir`footer.cloud.tpl"}
{literal}

    <script type="text/javascript">
        $(function() {
            $('#snapshot-btn').click(function(e) {
                e.preventDefault();
                var self = $(this),
                    edit = $('#createsnapshot').clone(true);

                edit.find('.hide-modal').click(function() {
                    edit.modal('hide');
                });
                edit.on('hidden', function() {
                    edit.remove();
                });
                edit.find(".vtip_description").data('tooltip', '');

                edit.on('shown', function() {
                    edit.find(".vtip_description").tooltip();
                });
                edit.modal({
                    show: true,
                })
            })
        })
    </script>
{/literal}