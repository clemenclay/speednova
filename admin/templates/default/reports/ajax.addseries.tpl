

<link href="{$template_dir}js/jqueryui/css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="all" />
<form action="?cmd=reports&action=savenewseries&widget_id={$widget.id}" method="post">
    {if  $series}
        <input type="hidden" name="series_id" value="{$series.id}" />
    {/if}
    <div id="aconditions">
    <label>Series name:</label>
    <input class="form-control" name="series-name" placeholder="Series name" value="{$series.name}" />
    <br/>
        <a href="#" class="editbtn" onclick="$(this).hide();$('#columncontainer').show();return false;">Edit series columns (max two in output)</a>
        <div id="columncontainer" style="display: none">
            {include file='reports/report.columns.tpl'}
        </div>
            <br/>
        <a href="#" class="editbtn" onclick="$(this).hide();$('#conditionscontainer').show();return false;">Edit series parameters</a>
        <div id="conditionscontainer"  style="display: none">
    {include file='reports/report.params.tpl'}
        </div>
</div>
    <div style="margin:20px;text-align: center">
        {if  $series}
            <input type="submit" class="btn  btn-primary" value="Save changes" />
            {else}
            <input type="submit" class="btn  btn-primary" value="Add new series" />
        {/if}

    </div>
{securitytoken}</form>
{literal}
<script>

    $("#aconditions a.vtip_description").vTip();
</script>
{/literal}