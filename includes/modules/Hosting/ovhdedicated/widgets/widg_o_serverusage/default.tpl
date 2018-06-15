<h2>Server Usage</h2>
<p>Your can check you server usage & load details below.</p>


<table class="table table-striped">
    <tr>
        <td><strong>CPU usage</strong></td>
        <td>{$load.cpu.value}{$load.cpu.unit}</td>
        <td><strong>Uptime</strong></td>
        <td>{$load.uptime.value}</td>
    </tr>
    <tr>
        <td><strong>Load average in the last 1 minute</strong></td>
        <td>{$load.loadavg1.value}</td>
        <td><strong>Number of process running</strong></td>
        <td>{$load.processRunning.value}</td>
    </tr>
    <tr>
        <td><strong>Load average in the last 5 minute</strong></td>
        <td>{$load.loadavg5.value}</td>
        <td><strong>Load average in the last 15 minute</strong></td>
        <td>{$load.loadavg15.value}</td>
    </tr>
    <tr>
        <td colspan="2"><strong>Memory Usage</strong>
            <div class="progress widget-progress">
                <div class="bar" style="width: {$load.memory.value}%">
                    <span>{$load.memory.value}{$load.memory.unit}</span>
                </div>
            </div>
        </td>
        <td colspan="2"><strong>Swap Usage</strong>
            <div class="progress widget-progress">
                <div class="bar" style="width: {$load.swap.value}%">
                    <span>{$load.swap.value}{$load.swap.unit}</span>
                </div>
            </div>
        </td>
    </tr>
</table>
                
<h3>Partition status</h3>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Name of partition</th>
            <th>Mount point</th>
            <th>Used space</th>
            <th>Inodes used</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$partitions item=stat}
            <tr>
                <td>{$stat.partition}</td>
                <td>{$stat.mountPoint}</td>
                <td>
                    <div class="progress widget-progress">
                        <div class="bar" style="width: {$stat.usage.value}%">
                            <span>{$stat.usage.value}{$stat.usage.unit}</span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="progress widget-progress">
                        <div class="bar" style="width: {$stat.inodeUsage.value}%">
                            <span>{$stat.inodeUsage.value}{$stat.inodeUsage.unit}</span>
                        </div>
                    </div>
                </td>
            </tr>
        {/foreach}
    </tbody>
</table>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">