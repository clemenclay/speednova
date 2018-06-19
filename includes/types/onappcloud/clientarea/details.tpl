<div class="header-bar">
    <h3 class="vmdetails hasicon">{$lang.servdetails}</h3>
</div>
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
                            {if $VMDetails.locked=='false'}
                                {if $VMDetails.power=='true'}
                                <a {if $o_sections.o_startstop}href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweroff&vpsid={$VMDetails.id}&security_token={$security_token}" onclick="return powerchange(this,'{$lang.sure_to_poweroff}?');"{else}href="#" onclick="return false;"{/if} class="iphone_switch_container iphone_switch_container_on" ><img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" /></a>

                                {else}
                                <a {if $o_sections.o_startstop}href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweron&vpsid={$VMDetails.id}&security_token={$security_token}" onclick="return powerchange(this,'{$lang.sure_to_power_on}?');"{else}href="#"  onclick="return false;"{/if} class="iphone_switch_container iphone_switch_container_off" ><img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" /></a>
                                
                                {/if}
                            {else}
                                 <a  class="iphone_switch_container iphone_switch_container_pending left"><img src="includes/types/onappcloud/images/iphone_switch_container_off.png" alt="" /></a>
                                 <a class="fs11" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$VMDetails.id}" style="padding-left:10px;">{$lang.refresh}</a>
                             {/if}

                            </td>
                    </tr>
                    <tr>
                        <td ><b>{$lang.hostname}</b> </td>
                        <td >{$VMDetails.hostname}</td>
                    </tr>
                    <tr>
                        <td ><b>{$lang.ipadd}</b> </td>
                        <td>{foreach from=$VMDetails.ip item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
                    </tr>
                    <tr>
                        <td >
                            <b>{$lang.rootpassword}</b>
                        </td>
                        <td><a href="#" onclick="$(this).hide();$('#rootpss').show();return false;" style="color:red">{$lang.show}</a><span id="rootpss" style="display:none">{$VMDetails.rootpassword}</span> <a onclick="return confirm('{$lang.suretoresetrootpassword}? {$lang.notethatwillrebooted}');" class="key-solid fs11 small_control" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=reset_root&vpsid={$vpsid}&security_token={$security_token}">{$lang.reset_root}</a></td>
                    </tr>
                    <tr class="lst">
                        <td >
                            <b>{$lang.ostemplate}</b>
                        </td>
                        <td > {$VMDetails.os} </td>
                    </tr>

                </table>
            </td>
            <td width="50%" style="padding-left:10px;">
                <table  cellpadding="0" cellspacing="0" width="100%" class="ttable">
                    <tr>
                        <td width="120">
                            <b>{$lang.bwused}</b>
                        </td>
                        <td>  {$vpsdetails.bwused} {$vpsdetails.bandwidth_s} <span class="fs11">{$lang.updatedhourly}</span></td>
                    </tr>

                    <tr>
                        <td  >
                            <b>{$lang.disk_limit}</b>
                        </td>
                        <td >
                            {$VMDetails.disk_size} GB

                        </td>
                    </tr>
                    <tr>
                        <td >
                            <b>{$lang.memory}</b>
                        </td>
                        <td >
                            {$VMDetails.memory} MB
                        </td>
                    </tr>

                    <tr>
                        <td  >
                            <b>{$lang.cpucores}</b>
                        </td>
                        <td valign="top" style="">
                            {$VMDetails.cpus} {$lang.cpus}

                        </td>
                    </tr>
                    <tr  class="lst">  {if !$vcpu}
                        <td >
                            <b>{$lang.cpuprio}</b>
                        </td>
                        <td valign="top" style="">
                            {$VMDetails.cpu_shares} %
                        </td>{else}
                        <td colspan="2">&nbsp;</td>
                        {/if}
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table border="0" cellspacing="0" cellpadding="5" style="margin-bottom:20px;" width="100%">
                    <tr><td width="120"><b>{$lang.tags}</b></td>
                        <td>
                            
                            {if $VMDetails.tags}{foreach from=$VMDetails.tags item=tag}<span class="label label-success  fs11 " style="margin-right:5px;">{$tag} | <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$VMDetails.id}&make=removetag&tag={$tag}&security_token={$security_token}" style="color:#fff;">x</a></span> {/foreach}{else}<em class="fs11">{$lang.notags}</em>{/if}

                        <input type="button" onclick="$(this).toggle();$('#fida').toggle()" class="blue" style="margin-left:50px;padding:2px 3px;" value="{$lang.newtag}"></td>
                    </tr>
                    <tr id="fida" style="display:none"><td></td>
                        <td >
                            <form action="" method="post">
                                <input type="hidden" name="make" value="addtag" />
                                <b>{$lang.newtag}:</b>
                                <input style="width:150px;margin-bottom:0px;" value="" name="tag"/>
                                <input type="submit"  class="blue" style="padding:2px 3px;" value="{$lang.submit}">
                                {securitytoken}
                            </form>
                        </td></tr>
                </table>
            </td>

        </tr>
    </table>


</div>