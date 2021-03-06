{if $vpsdo=='upgrade'}
    {include file="`$cloudstackdir`header.cloud.tpl"}
    {include file="`$cloudstackdir`upgrade.tpl"}
    {include file="`$cloudstackdir`footer.cloud.tpl"}

{else}

    {include file="`$cloudstackdir`header.cloud.tpl"}
    <div class="header-bar">
        <h3 class="resources hasicon">{$lang.reslabel}</h3>

        <div class="clear"></div>
    </div>
    <div class="content-bar ">
        <div class="notice">{$lang.resnotice} </div>
        <table cellspacing="0" cellpadding="0" width="100%" class="ttable cloud-resources">
            <thead>
                <tr>
                    <th></th>
                    <th>{$lang.Usage}</th>
                    <th width="120">{$lang.Totallabel}</th>
                    <th width="120">{$lang.Leftlabel}</th>
                </tr>
            </thead>
            <tbody >
                {foreach from=$FastStat item=stat key=statkey}
                    {if !$stat.hidden}
                        <tr>
                            <td>
                                <b title="{if $lang[$stat.name]}{$lang[$stat.name]}{else}{$stat.name}{/if}">
                            {if $lang[$stat.name]}{$lang[$stat.name]}{else}{$stat.name}{/if}
                        </b>
                    </td>
                    <td >
                        <div class="progress-bar">
                            <div class="bar {if $stat.percent>90}red{else}green{/if}" style="width:{$stat.percent}%"></div>
                        </div>
                    </td>
                    <td class="bigger">{$stat.avail} {if $lang[$stat.unit]}{$lang[$stat.unit]}{else}{$stat.unit}{/if}</td>
                    <td class="bigger">{$stat.free} {if $lang[$stat.unit]}{$lang[$stat.unit]}{else}{$stat.unit}{/if}</td>
                </tr>
            {/if}
        {/foreach}
        {*}
        <tr>
        <td width="120"><b>{$lang.memory}</b></td>
        <td >
        <div class="progress-bar">
        <div class="bar {if $FastStat.memory_percent>90}red{else}green{/if}" style="width:{$FastStat.memory_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.memory_avail} MB</td>
        <td class="bigger">{$FastStat.memory_free} MB</td>
        </tr>
        {if $FastStat.disk_avail}
        <tr>
        <td><b>{$lang.storage}</b> </td>
        <td>
        <div class="progress-bar">
        <div class="bar {if $FastStat.disk_percent>90}red{else}green{/if}" style="width:{$FastStat.disk_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.disk_avail} GB</td>
        <td class="bigger">{$FastStat.disk_free} GB</td>
        </tr>
        {/if}
        <tr>
        <td><b>{$lang.cpuprio}</b> </td>
        <td>
        <div class="progress-bar">
        <div class="bar {if $FastStat.cpu_percent>90}red{else}green{/if}" style="width:{$FastStat.cpu_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.cpu_avail}</td>
        <td class="bigger">{$FastStat.cpu_free}</td>
        </tr>
        <tr>
        <td><b>{$lang.cpuspeed}</b></td>
        <td>
        <div class="progress-bar">
        <div class="bar {if $FastStat.cpus_percent>90}red{else}green{/if}"  style="width:{$FastStat.cpus_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.cpus_avail} MHz</td>
        <td class="bigger">{$FastStat.cpus_free} MHz</td>
        </tr>
        <tr>
        <td><b>{$lang.ipcount}</b></td>
        <td>
        <div class="progress-bar">
        <div class="bar {if $FastStat.ips_percent>90}red{else}green{/if}"  style="width:{$FastStat.ips_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.ips_avail}</td>
        <td class="bigger">{$FastStat.ips_free}</td>
        </tr>
        {if $FastStat.vms_avail || $FastStat.vms_used}
        <tr class="lst">
        <td><b>{$lang.vpslimit}</b></td>
        <td>
        <div class="progress-bar">
        <div class="bar {if $FastStat.vms_percent>90}red{else}green{/if}"  style="width:{$FastStat.vms_percent}%"></div>
        </div>
        </td>
        <td class="bigger">{$FastStat.vms_avail}</td>
        <td class="bigger">{$FastStat.vms_free}</td>
        </tr>
        {/if}
        {*}
    </tbody></table>
<div class="btn-group-cloud">
    <input type="submit" value="{$lang.UpgradeDowngrade}" class="blue" onclick="window.location = '?cmd=clientarea&action=services&service={$service.id}&vpsdo=upgrade'"/>
</div>
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}

{/if}