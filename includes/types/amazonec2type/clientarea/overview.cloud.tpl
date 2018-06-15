{include file="`$cloudstackdir`header.cloud.tpl"}
<div class="header-bar">
    <h3>{$lang.cloudlabel1}</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $sshkey}Your ssh key fingerprint: <b>{$sshkey.KeyFingerprint}</b>{/if}
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tonapp" style="margin:10px 0px;">

        <thead>
            <tr>
                <th width="66"></th>
                <th>{$lang.hostname}</th>
                <th width="233">{$lang.ipadd}</th>
                <th width="70">{$lang.size}</th>
                <th width="60"></th>
            </tr>
        </thead>
        <tbody id="updater">
            {if $MyVMs}
                {foreach from=$MyVMs item=vm name=foo}
                    <tr >
                        <td >
                            {include file="`$cloudstackdir`ajax.vmstatus.tpl"}
                        </td>
                        <td><a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vm.id}&vpsdo=vmdetails" ><b>{$vm.hostname}</b></a></td>
                        <td>
                            {$vm.PublicIpAddress}
                            {if $vm.NetworkInterfaces[0].PrivateIpAddresses[1]}
                                  <br/>Elastic:  {$vm.NetworkInterfaces[0].PrivateIpAddresses[1].Association.PublicIp}
                                    {/if}
                        </td>
                        <td>{$vm.size}</td>
                        <td class="fs11">
                            <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vm.id}&vpsdo=vmdetails"  class="ico ico_wrench" title="{$lang.edit}">{$lang.edit}</a>
                            <a  href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=destroy&vpsid={$vm.id}&security_token={$security_token}" onclick="return  confirm('{$lang.sure_to_destroy}?')" class="ico ico_cross" title="{$lang.delete}">{$lang.delete}</a>
                        </td>
                    </tr>
                {/foreach}
            {else}
                <tr >
                    <td colspan="6" align="center">{$lang.nomachinesnote}, <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=createvm">{$lang.addservernote}</a>.</td>
                </tr>
            {/if}
        </tbody>
    </table>
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}