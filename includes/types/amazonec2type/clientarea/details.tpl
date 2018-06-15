<div class="header-bar">
    <h3 class="vmdetails hasicon">{$lang.servdetails}</h3>
</div>
<div class="content-bar" >
   <div class="right" id="lockable-vm-menu"> {include file="`$cloudstackdir`ajax.vmactions.tpl"} </div>
    
    <div class="clear"></div>

    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td width="50%" style="padding-right:10px;" valign="top">
                <table cellpadding="0" cellspacing="0" width="100%" class="ttable">
                    <tr>
                        <td width="120">
                            <b>{$lang.status}</b>
                        </td>
                        <td style="padding:8px 5px 9px;" id="vm-power">
                            {include file="`$cloudstackdir`ajax.vmstatus.tpl" vm=$VMDetails}
                             <a class="fs11" href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$VMDetails.id}" style="padding-left:10px;">{$lang.refresh}</a>
                            </td>
                    </tr>
                    <tr>
                        <td ><b>{$lang.hostname}</b> </td>
                        <td >{$VMDetails.hostname}</td>
                    </tr>
                    <tr>
                        <td ><b>Public {$lang.ipadd}</b> </td>
                        <td>
                            {$vm.PublicIpAddress}
                        </td>
                    </tr>
                   
                    <tr>
                        <td ><b>Private {$lang.ipadd}</b> </td>
                        <td>
                            {$vm.PrivateIpAddress}
                        </td>
                    </tr>
                   
                </table>
            </td>
            <td width="50%" style="padding-left:10px;">
                <table  cellpadding="0" cellspacing="0" width="100%" class="ttable">
                   

                    <tr>
                        <td><b>{$lang.size}</b></td>
                        <td >{$VMDetails.size}</td>
                    </tr>
                      <tr>
                        <td ><b>Elastic {$lang.ipadd}</b> </td>
                        <td>
                                {if $vm.NetworkInterfaces[0].PrivateIpAddresses[1]}
                                    <span class="pull-left">{$vm.NetworkInterfaces[0].PrivateIpAddresses[1].Association.PublicIp}</span>
                                    <a  class="btn  btn-small pull-right btn-warning" style="padding:2px 3px;" onclick="return confirm('Are you sure?')" href="{$service_url}&PublicIp={$vm.NetworkInterfaces[0].PrivateIpAddresses[1].Association.PublicIp}&vpsdo=rmelasticip&vpsid={$vpsid}&security_token={$security_token}&PrivateIp={$vm.NetworkInterfaces[0].PrivateIpAddresses[1].PrivateIpAddress}&NetworkInterfaceId={$vm.NetworkInterfaces[0].NetworkInterfaceId}">Release</a>
                                    {else}
                                        
                                    <span class="pull-left"><em>{$lang.none}</em></span>
                                <a  class="btn  btn-success pull-right btn-small" style="padding:2px 3px;" href="{$service_url}&vpsdo=getelasticip&vpsid={$vpsid}&security_token={$security_token}" onclick="return confirm('Are you sure? Additional charges may be applied')">Acquire Elastic IP</a>
                                {/if}
                        </td>
                    </tr>
                    
                                {if $vm.NetworkInterfaces[0].PrivateIpAddresses[1]}
                                     <tr>
                        <td ><b>2nd Private Ip</b> </td>
                        <td>
                            {$vm.NetworkInterfaces[0].PrivateIpAddresses[1].PrivateIpAddress}
                        </td>
                    </tr>
                                     {/if}
                    <tr class="lst">
                        <td><b>{$lang.ostemplate}</b></td>
                        <td> {$VMDetails.os.Name} </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


</div>