<h3>Edit series in widget</h3>
Widget: <b>{$widget.name}</b><br/>
Related report: <b><a href="?cmd=reports&action=get&id={$widget.report_id}" target="_blank">{$widget.report_name}</a></b>
<br/><br/>

<table class="table table-bordered table-striped">
<tr>
    <th></th>
    <th>Series name:</th>
</tr>
{foreach from=$widget.series item=data}
    <tr>
        <td width="60" class="text-center"><div class="btn-group" role="group" aria-label="...">
                <a class="btn btn-primary btn-xs" {literal}onclick="$.facebox({ajax: '?cmd=reports&action=editseries&series_id={/literal}{$data.id}{literal}&widget_id={/literal}{$widget.id}{literal}'});return false;"{/literal}><i class="fa fa-pencil"></i></a>
                <a class="btn btn-danger btn-xs" href="?cmd=reports&action=rmseries&series_id={$data.id}&widget_id={$widget.id}" onclick="return confirm('Are you sure?');"><i class="fa fa-trash"></i></a>
            </div></td>
        <td>{$data.name}</td>
    </tr>
{/foreach}
</table>
<br/>{literal}
<button class='btn btn-sm btn-success' onclick="$.facebox({ajax: '?cmd=reports&action=addseries&widget_id={/literal}{$widget.id}{literal}'});return false;"><i class="fa fa-plus"></i> Add new data series</button>
{/literal}