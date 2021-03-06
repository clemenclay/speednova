<div class="header-bar">
    <h3 class="vmdetails hasicon">{$lang.servdetails}</h3>
</div>
{literal}
    <style>
        .status-bar {
            background: url("templates/common/cloudhosting/images/progress-bg.png") repeat scroll 0 0 #5A5A5A;
            border-bottom: 1px solid #8F8F8F;
            border-radius: 3px 3px 3px 3px;
            border-top: 1px solid #555555;
            clear: both;
            height: 20px;
            position: relative;
            overflow: hidden;
        }
        .status-bar p{
            margin:0;
            position: relative;
            z-index: 1;
            color: white;
            padding: 0 5px
        }
        .status-bar .usage{
            background: url("templates/common/cloudhosting/images/bg_header1.png") repeat scroll 0 -14px #5A5A5A;
            border-bottom: 1px solid #2B5177;
            border-radius: 3px 3px 3px 3px;
            border-top: 1px solid #87BCE4;
            height: 18px;
            left: 1px;
            position: absolute;
            top: 0;
            z-index: 0;
        }
    </style>
{/literal}
<div class="content-bar" >
    <div class="right" id="lockable-vm-menu"> {include file="`$onappdir`ajax.vmactions.tpl"} </div>

    <div class="clear"></div>

    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td width="50%" style="padding-right:10px;">
                <table cellpadding="0" cellspacing="0" width="100%" class="ttable">
                    <tr>
                        <td width="120">
                            <b>{$lang.status}</b>
                        </td>
                        <td style="padding:8px 5px 9px;">
                            {if !$VMDetails.locked}
                                {if $VMDetails.status=='active'}
                                    <a {if $o_sections.o_startstop}href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=shutdown&vpsid={$VMDetails.id}&security_token={$security_token}" onclick="return powerchange(this, 'Are you sure you want to Power OFF this VM?');"{else}href="#" onclick="return
    false;"{/if} class="iphone_switch_container iphone_switch_container_on" ><img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" /></a>
                                    {else}
                                    <a {if $o_sections.o_startstop}href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=startup&vpsid={$VMDetails.id}&security_token={$security_token}" onclick="return
    powerchange(this, 'Are you sure you want to Power ON this VM?');"{else}href="#"  onclick="return
    false;"{/if} class="iphone_switch_container iphone_switch_container_off" ><img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" /></a>
                                    {/if}
                                {else}
                                <a style="opacity: 0.4; filter: alpha(opacity = 40)" href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vm.id}" class="iphone_switch_container iphone_switch_container_off left">
                                    <img src="templates/common/cloudhosting/images/iphone_switch_container_off.png" alt="" />
                                </a><a class="fs11 left" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$VMDetails.id}" style="padding-left:10px;">{$lang.refresh}</a>
                            {/if}

                        </td>
                    </tr>
                    <tr>
                        <td ><b>{$lang.hostname}</b> </td>
                        <td >{$VMDetails.hostname}</td>
                    </tr>
                    <tr>
                        <td ><b>{$lang.ipadd}</b> </td>
                        <td>{foreach from=$VMDetails.ips item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last}, {/if}{/foreach} </td>
                    </tr>

                    <tr class="lst">
                        <td >
                            <b>{$lang.ostemplate}</b>
                        </td>
                        <td > {$VMDetails.os.name} </td>
                    </tr>
                </table>
            </td>
            <td width="50%" style="padding-left:10px;">
                <table  cellpadding="0" cellspacing="0" width="100%" class="ttable">

                    <tr >
                        <td  >
                            <b>{$lang.size}</b>
                        </td>
                        <td valign="top" style="">
                            {$VMDetails.space} GB
                        </td>
                    </tr>
                    <tr>
                        <td class="lst" >
                            <b>CPU</b>
                        </td>
                        <td valign="top" style="">
                            {$VMDetails.cores} Core(s)
                        </td>
                    </tr>
                    <tr>
                        <td class="lst" >
                            <b>{$lang.memory}</b>
                        </td>
                        <td valign="top" style="">
                            {$VMDetails.ram} MB
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


</div>