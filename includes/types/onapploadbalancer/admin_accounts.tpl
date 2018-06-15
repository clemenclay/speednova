{if $layer && $customfile}
{if $lbdo=='clientslbs'}


 <table class="data-table backups-list"  width="100%" cellspacing=0>
                                      <thead>
                                          <tr>
                                              <td></td>
                                              <td>Label</td>
                                              <td>Hostname</td>
                                              <td>IP Address</td>
                                              <td>Disk Space</td>
                                              <td>Memory</td>
                                              <td></td>
                                              <td></td>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          {if $MyVMs}
                                           {foreach from=$MyVMs item=vm name=foo}
                                           <tr >
				<td class="power-status">{if $vm.power=='true'}<span class="yes">Yes</span>{else}<span class="no">No</span>{/if}</td>
                                <td ><a href="{$onappurl}/load_balancers/{$vm.id}/" target="_blank" class="external"><strong>{$vm.label}</strong></a></td>
				<td>{$vm.hostname}</td>
				<td>{foreach from=$vm.ip item=ipp name=ssff}{$ipp}{if !$smarty.foreach.ssff.last},{/if} {/foreach}</td>
				<td>{$vm.disk} GB</td>
				<td>{$vm.memory} MB</td>
                                    <td >{if $vm.built=='true'}{if $vm.power=='true'}

					<a  onclick="return power_onapp($(this).attr('href'),'off')"  href="?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&lbdo=clientslbs&machine_id={$vm.id}&do=power" class="power off-inactive" >OFF</a>
<a class="power on-active">ON</a>

						{else}
					<a class="power off-active">OFF</a>
						<a  class="power on-inactive" onclick="return power_onapp($(this).attr('href'),'on')"  href="?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&lbdo=clientslbs&machine_id={$vm.id}&do=power">ON</a>

						{/if}{else}<a class="power pending">{$lang.Pending}</a>{/if}

                                </td>
					<td class="fs11">
					<a  href="?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&lbdo=clientslbs&machine_id={$vm.id}&do=destroy" onclick="return  destroyVM_onapp($(this).attr('href'))" class="delbtn">{$lang.delete}</a>

				</td>
			</tr>
                                            {/foreach}
                                          {else}
                                            <tr>
                                              <td style="text-align: center; font-size: 100%; width: 100%;" colspan="8">
                                                 This client dont have any load balancers created yet
                                              </td>
                                            </tr>
                                        {/if}
                                      </tbody>
                                    </table>
				
{/if}
{else}
<style type="text/css">
{literal}
	ul.accor li > div.darker {
	background:#e3e2e4 !important;
	border-bottom:1px solid #d7d7d7  !important;
border-left:1px solid #d7d7d7  !important;
border-right:1px solid #d7d7d7  !important;
	}
	ul.accor li > a.darker {
background:url("{/literal}{$template_dir}{literal}img/plus1.gif") no-repeat scroll 6px 50% #444547 !important;
}
#lmach {
padding:10px;
}
a.power {
  float: left;
  display: block;
  width: 31px;
  height: 19px;
  margin-left: 3px;
  text-decoration: none;
  text-align: center;
  color: #555 !important;
  cursor: default;
}
a.power.on-inactive, a.power.off-inactive, a.power.on-disabled, a.power.off-disabled {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll 0 0;
}

a.power.on-inactive:hover {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll -32px 0;
}

a.power.off-inactive:hover {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll -64px 0;
}

a.power.on-active {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll -96px 0;
}

a.power.off-active {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll -128px 0;
}
.power.pending {
  background: transparent url({/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/power-bg.png) no-repeat scroll -160px 0;
  width: 65px;
  color: #909090 !important;
}
.vm-overview a.power {
  margin-left: 0;
  margin-right: 3px;
  text-shadow: none;
}

a.power.on-inactive:hover, a.power.off-inactive:hover {
  cursor: pointer;
  color: #fafafa !important;
}

a.power.on-active {
  color: #efe !important;
}

a.power.off-active {
  color: #fee !important;
}

a.power.on-disabled, a.power.off-disabled {
  color: #909090 !important;
  opacity: 0.8;
}
.power-status .yes {
background:url("{/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/vm-on.png") no-repeat scroll 0 0 transparent;
display:block;
height:16px;
text-indent:-99999px;
width:16px;

}

.power-status .no {
background:url("{/literal}{$system_url}{literal}includes/types/onapploadbalancer/images/vm-off.png") no-repeat scroll 0 0 transparent;
display:block;
height:16px;
text-indent:-99999px;
width:16px;
}
.right-aligned {
text-align:right;
}
.ttable td {
	padding:3px 4px;
}
table.data-table.backups-list thead {
    border:1px solid #DDDDDD;
}
table.data-table.backups-list thead {
    border-left:1px solid #005395;
    border-right:1px solid #005395;
}
table.data-table.backups-list thead {
    font-size:80%;
    font-weight:bold;
    text-transform:uppercase;
}
table.data-table.backups-list thead td {
    background:none repeat scroll 0 0 #777777;
    color:#FFFFFF;
    padding:8px 5px;
}
table.data-table tbody td {
    background:none repeat scroll 0 0 #FFFFFF;
    border-top:1px solid #DDDDDD;
}
table.data-table tbody tr:hover td {
    background-color: #FFF5BD;
}
table.data-table tbody tr td {
    border-color:-moz-use-text-color #DDDDDD #DDDDDD;
    border-right:1px solid #DDDDDD;
    border-style:none solid solid;
    border-width:0 1px 1px;
    font-size:90%;
    padding:8px;
}
{/literal}
</style>

{if $details.status=='Active' || $details.status=='Suspended'}
<ul class="accor">
				<li><a href="#" class="darker">Client's Load Balancers</a>
				<div class="sor darker">
				<div id="lmach">
					<br />
				</div>
				<script type="text/javascript">
                                        {literal}
                                            function destroyVM_onapp(url) {
                                                if(confirm('Are you sure you wish to destroy this Load Balancer?')) {
                                                 $('#lmach').addLoader();
                                                 ajax_update(url,'','#lmach');
                                                     }
                                                         return false;
                                            }
                                            function power_onapp(url,what) {
                                                var conf = what=='off'?confirm('Are you sure you wish to power-off this Load Balancer?'):true;
                                                if(conf) {
                                                 $('#lmach').addLoader();
                                                 ajax_update(url+'&power='+what,'','#lmach');
                                                     }
                                                         return false;
                                            }
                                            function loadClientLoadBalancers_onapp() {
                                                var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&lbdo=clientslbs';{literal}
                                                ajax_update(url,'','#lmach',true);

                                            setInterval ( function(){
                                                  $('#lmach').addLoader();
                                                 ajax_update(url,'','#lmach');
                                            }, 20000);

                                            }
                                                appendLoader('loadClientLoadBalancers_onapp');
                                        {/literal}
					setInterval
				</script>
				
</div>

</li>


</ul>
{/if}
{/if}