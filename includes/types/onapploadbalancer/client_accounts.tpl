{if $onappcloudtpl}
<a href="?cmd=clientarea&action=services&service={$service.id}" class="small_control  small_2 small_balancer"><b>Back to load balancer</b></a>

{include file=$onappcloudtpl}
{else}

<link media="all" type="text/css" rel="stylesheet" href="{$system_url}includes/types/onapploadbalancer/styles.css" />
<style type="text/css">
{literal}
.details .status-bar .usage {
background:url("{/literal}{$template_dir}{literal}img/bb_ga.gif") repeat-x scroll 0 0 #21a4c5;
float:left;
height:30px;
outline:1px solid #AAAAAA;
}
a.bigbluepricetag  {
background: url("{/literal}{$template_dir}{literal}img/c_submit.gif") repeat-x scroll left top #6D9D2C !important;
text-decoration:none;
}
.lbbtn{
	text-align: center;
	color: #333333;
	line-height: 18px;
	padding: 4px 10px;
	font-size: 13px;
	margin:5px;
	border: solid 1px #cccccc;
	border-bottom: solid 1px #b3b3b3;
	display: inline-block;
	filter: progid:dximagetransform.microsoft.gradient(enabled=false);
	cursor: pointer;
	border-radius: 4px 4px 4px 4px;
	box-shadow: inset 0px 1px 0px rgba(255,255,255,0.2), 0px 1px 2px rgba(0,0,0,0.05);
	background-repeat: repeat-x;
	background-color: rgb(245, 245, 245);
    text-decoration: none;
}

{/literal}
</style>
<script type="text/javascript" src="{$template_dir}js/facebox/facebox.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}js/facebox/facebox.css" />

{if $service}
{if $service.status=='Active'}
<div id="cloginform" style="display:none">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
        <tr>
            <td colspan="2"><span class="slabel">{$lang.username}</span> <span class="slabel">{$service.username}</span></td>
        </tr>
        <tr>
            <td colspan="2"><span class="slabel">{$lang.password}</span> <span class="slabel">{$service.password}</span></td>
        </tr>
        <tr class="lastone">
            <td align="center">
                <form action="{$panellink}" method="get" target="_blank">
                    <input type="submit" value="{$lang.proceedtocp}" class="padded" style="font-weight:bold;font-size:14px" />
                </form>
            </td>
        </tr>
    </table>
</div>
{/if}


<ul class="page_tabs">
    <li ><a href="?cmd=clientarea&action=services&service={$service.id}"  class="{if !$lbid && !$lbdo}active{/if}" ><span class="left-border"></span><span class="text">{$lang.overview}</span><span class="right-border"></span></a></li>

{if $lbid}
    <li ><a href="?cmd=clientarea&action=services&service={$service.id}&lbid={$lbid}&lbdo=lbdetails"  class="{if $lbdo=='lbdetails' }active{/if}" ><span class="left-border"></span><span class="text">Balancer Details</span><span class="right-border"></span></a></li>
 {/if}


    <li style="float: right"><a href="?cmd=clientarea&action=services&service={$service.id}&lbdo=billing" class="{if $lbdo=='billing'}active{/if}"><span class="left-border"></span><span class="text">{$lang.billing_resources}</span><span class="right-border"></span></a></li>

	  {if $upgrades && $upgrades!='-1'}<li style="float: right"><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&make=upgrades&upgradetarget=service" class="{if $lbdo=='upgrade'}active{/if}"><span class="left-border"></span><span class="text"><strong>{$lang.Upgrade}</strong></span><span class="right-border"></span></a></li>{/if}
</ul>

            <div class="virtual-machine-details wide">
                <div class="grey-bar">
                    <dl class="actions">

                      {if $service.status=='Active' && $lbid && $lbdo=='lbdetails'}
                        <dt></dt>
                       {if $lbdetails.built!='true'}
                        <dd><a href="?cmd=clientarea&action=services&service={$service.id}&lbid={$lbid}&lbdo=lbdetails" ><img src="{$template_dir}img/arrow_refresh_small.gif" /></a></dd>
                        <dt></dt>
                        <dd style="display:block;margin-top:5px;padding:2px 0 2px 20px;">Load Balancer is currently running a task</dd>
                       {else}
                           {if $lbdetails.power=='true'}

                        <dt></dt>
                        <dd><a onclick="return confirm('Are you sure to Power Off this load balancer?');" class="power-off" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweroff&lbid={$lbid}">{$lang.ForcePowerOff}</a></dd>
                        <dt></dt>
                        <dd><a onclick="return confirm('Are you sure to Reboot this load balancer?');" class="reboot" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=reboot&lbid={$lbid}">{$lang.GracefulReboot}</a></dd>
                            {else}

                        <dd><a class="startup" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweron&lbid={$lbid}">{$lang.Startup}</a></dd>
                            {/if}
                        {/if}
                      
                    {if $service.options.option10=='Virtual Machine Autoscaling'}
                        <dt></dt>
                        <dd><a class="autoscaling" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=autoscaling&lbid={$lbid}">Autoscale Parameters</a></dd>
                    {/if}
                    {elseif !$lbdo && !$lbid}


		{if $service.options.option11=='Yes'}
                        <dt></dt>
                        <dd><a class="startup" href="{$panellink}" target="_blank" onclick="{literal}$.facebox({div:'#cloginform',width:350});return false;{/literal}"><strong>Login to control panel</strong></a></dd>
		{/if}

		{elseif $lbdo=='billing'}
                        <dd><a  class="delete" href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel">{$lang.cancelrequest}</a></dd>

                    {/if}
                    </dl>
                </div>


              <div class="virtual-machine-details-content">

                <div class="top-background">
				{if !$lbdo && !$lbid}

				 <div style="padding:10px 10px 20px;">
				
<div class="clear"></div>

				 </div>


                                    <table class="data-table backups-list"  width="100%" cellspacing=0>
                                      <thead>
                                        <tr>
										<td></td>
                                          <td>{$lang.hostname}</td>
                                          <td>{$lang.ipadd}</td>
                                          <td>{$lang.status}</td>
                                          <td>{$lang.disk_limit}</td>
                                          <td>{$lang.memory}</td>
										  <td></td>
                                        </tr>
                                      </thead>
                                      <tbody>
                                          {if $MyVMs}
                                           {foreach from=$MyVMs item=vm name=foo}
                                           <tr >
				<td class="power-status">{if $vm.power=='true'}<span class="yes">Yes</span>{else}<span class="no">No</span>{/if}</td>
				<td><a href="?cmd=clientarea&action=services&service={$service.id}&lbid={$vm.id}&lbdo=lbdetails" >{$vm.hostname}</a></td>
				<td>{foreach from=$vm.ip item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
				<td >{if $vm.built=='true'}{if $vm.power=='true'}

					<a  onclick="return confirm('Are you sure you wish to power OFF this balancer??');"  href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweroff&lbid={$vm.id}" class="power off-inactive" >OFF</a>
<a class="power on-active">ON</a>

						{else}
					<a class="power off-active">OFF</a>
						<a  class="power on-inactive" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweron&lbid={$vm.id}">ON</a>

						{/if}{else}<a class="power pending">{$lang.Pending}</a>{/if}

				</td>
				<td>{$vm.disk} GB</td>
				<td>{$vm.memory} MB</td>
				<td class="fs11">
					<a  href="?cmd=clientarea&action=services&service={$service.id}&lbdo=destroy&lbid={$vm.id}" onclick="return  confirm('{$lang.sure_to_destroy}?')" class="small_control small_delete">{$lang.delete}</a>

				</td>
			</tr>
                                            {/foreach}
                                          {else}
                                            <tr>
                                              <td style="text-align: center; font-size: 100%; width: 100%;" colspan="7">
                                                  You dont have any Load Balancers created yet
                                              </td>
                                            </tr>
                                        {/if}
                                      </tbody>
                                    </table>
				

				 {elseif $lbdo=='billing'}
                    <table cellpadding="0" cellspacing="0" class="billingtable" width="100%">
                        <tr>
                            <td class="title" width="160" align="right">{$lang.registrationdate}</td>
                            <td>{$service.date_created|dateformat:$date_format}</td>
                            <td width="160" class="title" align="right">{$lang.service}</td>
                            <td>{$service.catname} - {$service.name} </td>
                        </tr>
                                            {if $service.showbilling} <tr>
                            <td class="title" align="right">{$lang.firstpayment_amount}</td>
                            <td>{$service.firstpayment|price:$currency}</td>
                            <td class="title" align="right">{if $service.billingcycle=='Hourly'}{$lang.curbalance}{else}{$lang.reccuring_amount}{/if}</td>
                            <td>{$service.total|price:$currency} {if $service.billingcycle=='Hourly'}({$lang.updatedhourly}){/if}</td>

                        </tr>
                                         {if $service.billingcycle!='Free' && $service.billingcycle!='Once'}
                        <tr >
                            <td class="title" align="right">{$lang.bcycle}</td>
                            <td>{$lang[$service.billingcycle]}</td>
                            <td class="title" align="right">{$lang.nextdue}</td>
                            <td>{$service.next_due|dateformat:$date_format}</td>
                        </tr>
                                          {/if}{/if}
                        <tr>
                            <td class="title" align="right">{$lang.status}</td>
                            <td><span class="{$service.status}"><strong>{$lang[$service.status]}</strong></span></td>
                            <td class="title" align="right"></td>
                            <td></td>

                        </tr>
								{if $service.custom}
			{foreach from=$service.custom item=cst name=ff}
			   {if $smarty.foreach.ff.index%2=='0'}<tr >{/if}
                            <td align="right" class="title">{$cst.name}</td>
                            <td>{include file=$cst.configtemplates.clientarea}
                            </td>

			   {if $smarty.foreach.ff.index%2=='5'}</tr >{/if}

			{/foreach}

		{/if}

		{if $addons}
                        <tr><td colspan="4"><div>

                                    <strong>{$lang.accaddons|capitalize}</strong>


                                    <div >
                                        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">

                                            <tr><td colspan="2" style="border:none">


                                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="styled">
                                                        <colgroup class="firstcol"></colgroup>
                                                        <colgroup class="alternatecol"></colgroup>
                                                        <colgroup class="firstcol"></colgroup>
                                                        <colgroup class="alternatecol"></colgroup>

                                                        <tbody>
                                                            <tr>
                                                                <th width="40%" align="left">{$lang.addon}</th>
                                                                <th align="left">{$lang.price}</th>
                                                                <th>{$lang.nextdue}</th>
                                                                <th >{$lang.status}</th>

                                                            </tr>
	{foreach from=$addons item=addon name=foo}
                                                            <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                                                                <td>{$addon.name}</td>
                                                                <td>{$addon.recurring_amount|price:$currency}</td>
                                                                <td align="center">{$addon.next_due|dateformat:$date_format}</td>
                                                                <td align="center" ><span class="{$addon.status}">{$lang[$addon.status]}</span></td>

                                                            </tr>

	{/foreach}
                                                        </tbody>

                                                    </table>



                                                </td></tr>
                                        </table>
                                    </div></div></td></tr>
{/if}

                    </table>
                {elseif $lbdo=='managenodes'}
                    <form id="nodemanager" action="" method="post">
                        <input type="hidden" name="make" value="updatenodes" />
                        {foreach from=$lbdetails.nodes item=vm name=foo key=vmid}
                            <input name="nodes_attributes[{$vmid}][_destroy]" type="hidden" value="0" class="node_attributes_{$vmid}_destroy" />
                            {foreach from=$vm.ip item=ipadd}<input name="nodes_attributes[{$vmid}][ip_address_id]" type="hidden" value="{$ipadd.id}" />{/foreach}
                            <input name="nodes_attributes[{$vmid}][virtual_machine_id]" type="hidden" value="{$vmid}" />
                            <input name="nodes_attributes[{$vmid}][node_id]" type="hidden" value="{$vm.node_id}" />
                        {/foreach}
                           
                    </form>
                    <table border="0" cellpadding="0" width="100%">
                    <tr><td colspan="2"><b>Cluster Nodes</b>
                                <table class="data-table backups-list"  width="100%" cellspacing=0>
                                    <thead>
                                        <tr>
                                            <td></td>
                                            <td>{$lang.hostname}</td>
                                            <td>{$lang.ipadd}</td>
                                            <td>{$lang.status}</td>
                                            <td>{$lang.disk_limit}</td>
                                            <td>{$lang.memory}</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody> {if $lbdetails.nodes}
                                           {foreach from=$lbdetails.nodes item=vm name=foo}
                                        <tr >
                                            <td class="power-status">{if $vm.power=='true'}<span class="yes">Yes</span>{else}<span class="no">No</span>{/if}</td>
                                            <td>{if $vm.account_id}<a href="?cmd=clientarea&action=services&vpsdo=vmdetails&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}" >{$vm.hostname}</a>{else}{$vm.hostname}{/if}</td>
                                            <td>{foreach from=$vm.ip item=ipp name=ssff}{$ipp.ip}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
                                            <td >{if $vm.built=='true'}{if $vm.power=='true'}

                                                <a  onclick="return confirm('{$lang.sure_to_poweroff}?');"  href="?cmd=clientarea&action=services&vpsdo=poweroff&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}" class="power off-inactive" >OFF</a>
                                                <a class="power on-active">ON</a>

						{else}
                                                <a class="power off-active">OFF</a>
                                                <a  class="power on-inactive" href="?cmd=clientarea&action=services&vpsdo=poweron&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}">ON</a>

						{/if}{else}<a class="power pending">{$lang.Pending}</a>{/if}

                                            </td>
                                            <td>{$vm.disk} GB</td>
                                            <td>{$vm.memory} MB</td>
                                            <td><a href="?cmd=clientarea&action=services&service={$service.id}" onclick="return remove_node(this)" rel="{$vm.id}" class="small_control small_delete">Remove</a></td>
                                        </tr>
                                            {/foreach}
                                        {else}
                                        <tr >
                                            <td colspan="7">No nodes attached yet</td>
                                        </tr>
                                        {/if}
                                    </tbody>
                                </table>

                              {if $nodes} <p align="right"><a class="btn lbbtn" href="#" onclick="$('#assignnodes').show();$(this).hide();return false" >Assign nodes</a></p>

                              <div id="assignnodes" style="display:none">
                                <table class="data-table backups-list"  width="100%" cellspacing=0>
                                    <thead>
                                        <tr>
                                            <td>Virtual Machine</td>
                                            <td>IP Address</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr >

                                            <td ><select name="" id="node_vm_id" onchange="sh_selects(this)">{foreach from=$nodes item=node}<option value="{$node.id}" {if $node.assigned}disabled{/if}>{$node.hostname}</option>{/foreach}</select></td>
                                            <td id="ipselector">{foreach from=$nodes item=node name=nloop}<select id="node_ip_{$node.id}" {if !$smarty.foreach.nloop.first}style="display:none"{/if}>{foreach from=$node.ip item=ipp}<option value="{$ipp.id}">{$ipp.ip}</option>{/foreach}</select>{/foreach}</td>
                                            <td><a class="btn lbbtn" href="#" onclick="return assign_node(this);" >Assign</a></td>
                                        </tr>

                                    </tbody>
                                </table>
                              </div>
                              <script>
                              {literal}
                              function sh_selects(el) {
                                $('#ipselector select').hide();
                                    $('#ipselector select#node_ip_'+$(el).val()).show();
                                        return false;            }
                                            function remove_node(link) {
                                                if(confirm("Are you sure you wish to unassign this node?")) {
                                                    $(link).parents().find('tr').eq(0).hide();
                                                    var vm = $(link).attr('rel');
                                                        $('#nodemanager .node_attributes_'+vm+'_destroy').val(1);
                                                            $('#nodemanager').submit();

                                                    }
                                                            return false;
                                                }
                                            function assign_node(link) {
                                                $(link).attr('disabled','disabled');
                                                var vm= $('#node_vm_id').val();
                                                var ip = $('#ipselector select#node_ip_'+vm).val();
                                                    if(!vm)
                                                        return false;
                                                $('#nodemanager').append('<input name="node_add['+vm+'][_destroy]" type="hidden" value="0" /><input name="node_add['+vm+'][ip_address_id]" type="hidden" value="'+ip+'" /><input name="node_add['+vm+'][virtual_machine_id]" type="hidden" value="'+vm+'" />').submit();
                                                return false;
                    }
{/literal}
                          </script>
                              {/if}

                            </td></tr>   </table>
                {elseif $lbdo=='autoscaling'}

                    <form method="post" action="" >
                        <input type="hidden" name="make" value="applyrules" />
                        <center> <table border="0" cellspacing="4" cellpadding="0" class="nicepadding">
                                <tr>
                                      <td colspan="5"><h3>Autoscale Out Parameters</h3></td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <input type="checkbox" name="scale[auto_scaling_out_memory][enabled]" value="1" {if $scale.auto_scaling_out_memory.enabled}checked="checked"{/if} onclick="if($(this).is(':checked')) $('#memory_in_row input').removeAttr('disabled'); else  $('#memory_in_row input').attr('disabled','disabled');"/>
                                                      </td>
                                                      <td>if free RAM
                                                      </td>
                                                      <td>is less than <input type="text" class="styled" size="2" name="scale[auto_scaling_out_memory][value]" value="{$scale.auto_scaling_out_memory.value}" /> MB
                                                      </td>
                                                      <td>for
                                                          <select name="scale[auto_scaling_out_memory][for_minutes]">
                                                              {section name=foo start=5 loop=65 step=5}
                                                              <option value="{$smarty.section.foo.index}" {if $scale.auto_scaling_out_memory.for_minutes==$smarty.section.foo.index}selected="selected"{/if}>{$smarty.section.foo.index} minutes</option>
                                                              {/section}
                                                          </select>
                                                      </td>
                                                      <td> add <input type="text" class="styled" name="scale[auto_scaling_out_memory][units]" size="2" value="{$scale.auto_scaling_out_memory.units}" /> more VMs </td>

                                                  </tr>
                                                    <tr>
                                                      <td>
                                                          <input type="checkbox" name="scale[auto_scaling_out_cpu][enabled]" value="1" {if $scale.auto_scaling_out_cpu.enabled}checked="checked"{/if}  onclick="if($(this).is(':checked')) $('#cpu_in_row input').removeAttr('disabled'); else  $('#cpu_in_row input').attr('disabled','disabled');" />
                                                      </td>
                                                      <td>if CPU usage
                                                      </td>
                                                      <td>is above than <input type="text" class="styled" size="2" name="scale[auto_scaling_out_cpu][value]" value="{$scale.auto_scaling_out_cpu.value}" /> %
                                                      </td>
                                                      <td>for
                                                          <select name="scale[auto_scaling_out_cpu][for_minutes]">
                                                              {section name=foo start=5 loop=65 step=5}
                                                              <option value="{$smarty.section.foo.index}" {if $scale.auto_scaling_out_cpu.for_minutes==$smarty.section.foo.index}selected="selected"{/if}>{$smarty.section.foo.index} minutes</option>
                                                              {/section}
                                                          </select>
                                                      </td>
                                                      <td> add <input type="text" class="styled" name="scale[auto_scaling_out_cpu][units]" size="2" value="{$scale.auto_scaling_out_cpu.units}" /> more VMs </td>

                                                  </tr>


                                                  <tr>
                                                      <td colspan="5"><h3>Autoscale In Parameters</h3></td>
                                                  </tr>
                                                  <tr id="memory_in_row">
                                                      <td>
                                                          <input type="checkbox" name="scale[auto_scaling_in_memory][enabled]" value="1" {if $scale.auto_scaling_in_memory.enabled}checked="checked"{/if} {if !$scale.auto_scaling_out_memory.enabled}disabled="disabled"{/if}/>
                                                      </td>
                                                      <td>if free RAM
                                                      </td>
                                                      <td>is more than <input type="text" class="styled" size="2" name="scale[auto_scaling_in_memory][value]" value="{$scale.auto_scaling_in_memory.value}"  {if !$scale.auto_scaling_out_memory.enabled}disabled="disabled"{/if}/> MB
                                                      </td>
                                                      <td>for
                                                          <select name="scale[auto_scaling_in_memory][for_minutes]">
                                                              {section name=foo start=5 loop=65 step=5}
                                                              <option value="{$smarty.section.foo.index}" {if $scale.memory.for_minutes==$smarty.section.foo.index}selected="selected"{/if}>{$smarty.section.foo.index} minutes</option>
                                                              {/section}
                                                          </select>
                                                      </td>
                                                      <td> remove <input type="text" class="styled" name="scale[auto_scaling_in_memory][units]" size="2" value="{$scale.auto_scaling_in_memory.units}"  {if !$scale.auto_scaling_out_memory.enabled}disabled="disabled"{/if} />  VMs </td>

                                                  </tr>
                                                    <tr id="cpu_in_row">
                                                      <td>
                                                          <input type="checkbox" name="scale[auto_scaling_in_cpu][enabled]" value="1" {if $scale.auto_scaling_in_cpu.enabled}checked="checked"{/if}  {if !$scale.auto_scaling_out_cpu.enabled}disabled="disabled"{/if} />
                                                      </td>
                                                      <td>if CPU usage
                                                      </td>
                                                      <td>is less than <input type="text" class="styled" size="2" name="scale[auto_scaling_in_cpu][value]" value="{$scale.auto_scaling_in_cpu.value}"   {if !$scale.auto_scaling_out_cpu.enabled}disabled="disabled"{/if} /> %
                                                      </td>
                                                      <td>for
                                                          <select name="scale[auto_scaling_in_cpu][for_minutes]">
                                                              {section name=foo start=5 loop=65 step=5}
                                                              <option value="{$smarty.section.foo.index}" {if $scale.auto_scaling_in_cpu.for_minutes==$smarty.section.foo.index}selected="selected"{/if}>{$smarty.section.foo.index} minutes</option>
                                                              {/section}
                                                          </select>
                                                      </td>
                                                      <td> remove <input type="text" class="styled" name="scale[auto_scaling_in_cpu][units]" size="2" value="{$scale.auto_scaling_in_cpu.units}"   {if !$scale.auto_scaling_out_cpu.enabled}disabled="disabled"{/if} /> VMs </td>
                                       </tr>
                            </table>
                            <br/>
                            <input type="submit" class="padded" style="font-weight:bold" value="Apply" /></center>

                    </form>
		
				 {elseif $lbdo=='lbdetails'}
                    <table border="0" cellpadding="0" width="100%">
                        <tr><td width="60" class="vm-overview" valign="top"><div class="os-logo {$lbdetails.distro}"></div></td><td>

                                <table cellpadding="4" width="100%" class="ttable">
                                    <tbody><tr>
                                            <td class="right-aligned">
                                                <b>{$lang.hostname}</b>
                                            </td>
                                            <td class="courier-font">{$lbdetails.hostname}</td>
                                            <td class="right-aligned">
                                                <b>{$lang.ostemplate}</b>
                                            </td>
                                            <td class="courier-font"> {$lbdetails.os} </td>
                                        </tr>
                                        <tr>
                                            <td class="right-aligned">
                                                <b>{$lang.status}</b>
                                            </td>
                                            <td class="power-status">
						{if $lbdetails.built=='true'}{if $lbdetails.power=='true'}
                                                <a  onclick="return confirm('{$lang.sure_to_poweroff}?');"  href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweroff&lbid={$lbid}" class="power off-inactive" >OFF</a>
                                                <a class="power on-active">ON</a>

						{else}
                                                <a class="power off-active">OFF</a>
                                                <a  class="power on-inactive" href="?cmd=clientarea&action=services&service={$service.id}&lbdo=poweron&lbid={$lbid}">ON</a>

						{/if}{else}<a class="power pending">{$lang.Pending}</a>{/if}</td>
                                            <td class="right-aligned">
                                                <b>{$lang.ipadd}</b>
                                            </td>
                                            <td>{foreach from=$lbdetails.ip item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
                                        </tr>

                                        <tr>
                                            <td class="right-aligned">
                                                <b>{$lang.inirootpass}</b>
                                            </td>
                                            <td>{$lbdetails.rootpassword}</td>
                                            <td class="right-aligned">
                                                <b>{$lang.monthly_bandwidth_used}</b>
                                            </td>
                                            <td>  {$lbdetails.bwused} {$lbdetails.bandwidth_s} (updated hourly)</td>
                                        </tr>

                                        <tr>
                                            <td class="right-aligned">
                                                <b>Port</b>
                                            </td>
                                            <td><div id="defaultport">{foreach from=$lbdetails.port item=port name=port}{$port}{if !$smarty.foreach.port.last}, {/if}{/foreach} <a class="small_control small_pencil fs11" href="#" onclick="$('#defaultport').hide();$('#portedit').show();return false">edit</a></div>
                                                <div id="portedit" style="display:none">
                                                    <form action="" method="post">
                                                            <input type="hidden" name="do" value="setdefaultport" />
                                                                    <input type="text" name="default_port" style="font-size:11px;" value="{foreach from=$lbdetails.port item=port name=port}{$port}{if !$smarty.foreach.port.last}, {/if}{/foreach}" size="3" class="styled" />
                                                                    <input type="submit" value="{$lang.savechanges}" style="font-weight:bold;font-size:11px;padding:2px 3px;"/>
                                                            </form>
                                                </div>
                                            </td>

                                            <td class="right-aligned">
                                                {if $service.options.option10=='Virtual Machine Autoscaling'}<b>Nodes</b>{/if}
                                            </td>
                                            <td>
                                                {if $service.options.option10=='Virtual Machine Autoscaling'}
                                                Min: <b>{$lbdetails.config.min_node_amount}</b> Max: <b>{$lbdetails.config.max_node_amount}</b>
                                            {/if}
                                            </td>
                                        </tr>
                                    
                                   


                                        <tr>

                                            <td colspan="2" align="right" class="right-aligned">
						   {if $service.options.option11=='Yes'}<a class="small_control small_2 small_startup" href="{$panellink}" target="_blank"  onclick="{literal}$.facebox({div:'#cloginform',width:350});return false;{/literal}"><strong>Login to control panel</strong></a>	{/if}
                                            </td>
                                            <td colspan="2" align="right" class="right-aligned">
                                            </td>
                                        </tr>

                                    </tbody></table>
                            </td></tr>
                    
                        <tr><td colspan="2"><b>Cluster Nodes</b>
                                <table class="data-table backups-list"  width="100%" cellspacing=0>
                                    <thead>
                                        <tr>
                                            <td></td>
                                            <td>{$lang.hostname}</td>
                                            <td>{$lang.ipadd}</td>
                                            <td>{$lang.status}</td>
                                            <td>{$lang.disk_limit}</td>
                                            <td>{$lang.memory}</td>
                                        </tr>
                                    </thead>
                                    <tbody> {if $lbdetails.nodes}
                                           {foreach from=$lbdetails.nodes item=vm name=foo}
                                        <tr >
                                            <td class="power-status">{if $vm.power=='true'}<span class="yes">Yes</span>{else}<span class="no">No</span>{/if}</td>
                                            <td>{if $vm.account_id}<a href="?cmd=clientarea&action=services&vpsdo=vmdetails&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}" >{$vm.hostname}</a>{else}{$vm.hostname}{/if}</td>
                                            <td>{foreach from=$vm.ip item=ipp name=ssff}{$ipp.ip}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
                                           <td >{if $vm.built=='true'}{if $vm.power=='true'}

                                                <a  onclick="return confirm('{$lang.sure_to_poweroff}?');"  href="?cmd=clientarea&action=services&vpsdo=poweroff&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}" class="power off-inactive" >OFF</a>
                                                <a class="power on-active">ON</a>

						{else}
                                                <a class="power off-active">OFF</a>
                                                <a  class="power on-inactive" href="?cmd=clientarea&action=services&vpsdo=poweron&service={if $vm.account_id}{$vm.account_id}&vpsid={$vm.id}{else}{$service.id}&balancer_id={$vm.id}&vpsid={$vm.id}{/if}">ON</a>

						{/if}{else}<a class="power pending">{$lang.Pending}</a>{/if}

                                            </td>
                                            <td>{$vm.disk} GB</td>
                                            <td>{$vm.memory} MB</td>
                                            
                                        </tr>
                                            {/foreach}
                                        {else}
 <tr >
                                            <td colspan="6">No nodes attached yet</td>

                                        </tr>
                                        {/if}
                                    </tbody>
                                </table>
                            
                               <p align="right"><a class="btn lbbtn" href="?cmd=clientarea&action=services&lbdo=managenodes&service={$service.id}&lbid={$lbid}" >Manage cluster nodes</a></p>
                            
                            </td></tr>

                                        {/if}


                    </table>


				 





                </div>
              </div>
              <div class="virtual-machine-details-bottom"></div>
            </div>

            <div class="clear"></div>

{/if}{/if}