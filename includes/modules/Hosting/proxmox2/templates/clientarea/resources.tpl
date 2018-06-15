{if $vpsdo=='upgrade'}
    {include file="`$onappdir`header.cloud.tpl"}
    {include file="`$onappdir`upgrade.tpl"}
    {include file="`$onappdir`footer.cloud.tpl"}

{else}

    {include file="`$onappdir`header.cloud.tpl"}
    <div class="header-bar">
        <h3 class="resources hasicon">{$lang.reslabel}</h3>

        <div class="clear"></div>
    </div>
    <div class="content-bar ">
        <div class="notice">{$lang.resnotice} </div>
        <table cellspacing="0" cellpadding="0" width="100%" class="ttable">
            <thead>
                <tr>
                    <th></th>
                    <th>{$lang.Usage}</th>
                    <th width="120">{$lang.Totallabel}</th>
                    <th width="120">{$lang.Leftlabel}</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$stats item=stat}
                    <tr>
                        <td width="120"><b>{$lang[$stat.lang]|default:$stat.name}</b></td>
                        <td >
                            <div class="progress-bar">
                                <div class="bar {if $stat.percent>90}red{else}green{/if}" style="width:{$stat.percent}%"></div>
                            </div>
                        </td>
                        <td class="bigger">{$stat.avail} {$stat.unit}</td>
                        <td class="bigger">{$stat.free} {$stat.unit}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div style="padding:0px 10px 10px;text-align: right">
            {if $addbandwidth.items}<a href="#netBandwidth" role="button" data-toggle="modal" class="btn btn-primary">{$lang.additionalbandwidth}</a>{/if}
            <a href="{$service_url}&vpsdo=upgrade" class="btn btn-primary">{$lang.UpgradeDowngrade}</a>
        </div>
    </div>
     {include file="`$onappdir`addbandwidthmodal.tpl"}
    {include file="`$onappdir`footer.cloud.tpl"}

{/if}