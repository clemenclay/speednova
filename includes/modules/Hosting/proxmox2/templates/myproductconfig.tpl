<tr><td id="getvaluesloader">{if $test_connection_result}
        <span style="margin-left: 10px; font-weight: bold;text-transform: capitalize; color: {if $test_connection_result.result == 'Success'}#009900{else}#990000{/if}">
            {$lang.test_configuration}:
    {if $lang[$test_connection_result.result]}{$lang[$test_connection_result.result]}{else}{$test_connection_result.result}{/if}
    {if $test_connection_result.error}: {$test_connection_result.error}{/if}
</span>
{/if}</td>
<td id="onappconfig_"><div id="">
        <ul class="breadcrumb-nav" style="margin-top:10px;">
            <li><a href="#" class="active disabled" onclick="load_onapp_section('provisioning')">Provisioning</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('resources')">Resources</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('ostemplates')">OS Templates</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('storage')">Storage</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('backup')">Backup</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('network')">Network</a></li>
            <li><a href="#" class="disabled" onclick="load_onapp_section('ipam')">IPAM</a></li> 
            <li><a href="#" class="disabled" onclick="load_onapp_section('finish')">Finish</a></li>
        </ul>
        <div style="margin-top:-1px;border: solid 1px #DDDDDD;padding:10px;margin-bottom:10px;background:#fff" id="onapptabcontainer">
            <div class="onapptab" id="provisioning_tab">
                To start please configure and select server above.<br/>
                You can configure your HostBill to provision Proxmox VE resources in multiple ways:

                <div class="onapp_opt {if $default.option10=='Single Machine, autocreation'}onapp_active{/if}">
                    <table border="0" width="500">
                        <tr>
                            <td class="opicker"><input type="radio" name="options[option10]" id="single_vm" value="Single Machine, autocreation" {if $default.option10=='Single Machine, autocreation'}checked='checked'{/if}/></td>
                            <td class="odescr">
                                <h3>Single VPS</h3>
                                <div class="graylabel">One account in HostBill = 1 virtual machine in Proxmox VE</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="onapp_opt {if $default.option10=='Multiple Machines, full management'}onapp_active{/if}">
                    <table border="0" width="500">
                        <tr>
                            <td  class="opicker"><input type="radio" name="options[option10]"  id="cloud_vm" value="Multiple Machines, full management" {if $default.option10=='Multiple Machines, full management'}checked='checked'{/if} /></td>
                            <td class="odescr">
                                <h3>Cloud Hosting</h3>
                                <div class="graylabel">Your client will be able to create machines by himself in HostBill interface </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="nav-er" style="{if !$default.option10}display:none{/if}" id="step-1">
                    <a href="#" class="next-step">Next step</a>
                </div>

            </div>
            <div class="onapptab form" id="resources_tab">
                <div class="odesc_ odesc_single_vm pdx">Your client's Virtual Machine will be provisioned with limits configured here</div>
                <div class="odesc_ odesc_cloud_vm pdx">Your client will be able to use resource with limits configured here</div>
                <table border="0" cellspacing="0" cellpadding="6" width="100%" >
                    <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>


                    <tr>
                        <td width="160"><label >Virtualization<a class="vtip_description" title="Select virtualization method for this package. This will affect other options, like templates loaded."></a></label></td>
                        <td ><select name="options[option30]"  id="option30">
                                <option value="qemu" {if $default.option30!='openvz'}selected="selected"{/if}>KVM</option>
                                <option value="openvz" {if $default.option30=='openvz'}selected="selected"{/if}>OpenVZ</option>
                                <option value="lxc" {if $default.option30=='lxc'}selected="selected"{/if}>LXC</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="160"><label >User Role<a class="vtip_description" title="HostBill will add user to pool with this role."></a></label></td>
                        <td id="option1container" class="tofetch"><input type="text" size="3" name="options[option1]" value="{$default.option1}" id="option1"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="160"><label >User Group<a class="vtip_description" title="Assign new user to this group."></a></label></td>
                        <td id="option2container" class="tofetch"><input type="text" size="3" name="options[option2]" value="{$default.option2}" id="option2"/>
                        </td>
                    </tr>


                    <tr>
                        <td width="160"><label >Memory [MB]</label></td>
                        <td id="option3container"><input type="text" size="3" name="options[option3]" value="{$default.option3}" id="option3"/>
                            <span class="fs11"><input type="checkbox" class="formchecker"  rel="memory"> Allow client to adjust with slider during order</span>
                        </td>
                    </tr>
                    <tr class="odesc_ odesc_single_vm">
                        <td width="160"><label >Swap [GB]</label></td>
                        <td id="swapcontainer"><input type="text" size="3" name="options[swap]" value="{$default.swap}" id="swap"/>
                            <span class="fs11"><input type="checkbox" class="formchecker"  rel="swap"> Allow client to adjust with slider during order</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="160"><label >CPU Cores <a class="vtip_description" title="Number of cores per socket. For cloud packages client will be able to adjust it"></a></label></td>
                        <td id="option5container"><input type="text" size="3" name="options[option5]" value="{$default.option5}" id="option5"/>
                            <span class="fs11"><input type="checkbox" class="formchecker"  rel="cpu_cores" /> Allow client to adjust with slider during order</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="160">
                            <label >CPU Units 
                                <a class="vtip_description" title="LXC: CPU weight for a VM. Argument is used in the kernel fair scheduler. 
                                   The larger the number is, the more CPU time this VM gets. Number is relative to weights of all the other running VMs. Minimum 8, maximum: 500000"></a>
                            </label>
                        </td>
                        <td id="option44container"><input type="text" size="3" name="options[option44]" value="{$default.option44}" id="option44"/>
                        </td>
                    </tr>
                    {* <tr>
                    <td width="160"><label >CPU Sockets  <a class="vtip_description" title="Each client VM will be created with this qty of sockets. Default=1"></a></label></td>
                    <td id="option4container"><input type="text" size="3" name="options[option4]" value="{$default.option4}" id="option4"/>
                    <span class="fs11"><input type="checkbox" class="formchecker" rel="cpu_sockets" /> Allow client to adjust with slider during order</span>
                    </td>
                    </tr>
                    *}
                    <tr>
                        <td width="160"><label >CPU Type </label></td>
                        <td id="option24container" class="tofetch"><input type="text" size="3" name="options[option24]" value="{$default.option24}" id="option24"/>
                        </td>
                    </tr>

                    <tr>
                        <td width="160"><label >Available nodes <a class="vtip_description" title="If more than one selected, HostBill will provision VM on least used Node"></a></label></td>
                        <td >
                            <div id="option23container" class="tofetch">
                                <select name="options[option23][]" id="option23" multiple="multiple" class="multi">
                                    <option value="Auto-Assign" {if in_array('Auto-Assign',$default.option23)}selected="selected"{/if}>All Nodes</option>
                                    {foreach from=$default.option23 item=vx}
                                        {if $vx=='Auto-Assign'}{continue}
                                        {/if}
                                        <option value="{$vx}" selected="selected">{$vx}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="clear"></div>
                            <span class="fs11"> <input type="checkbox" class="formchecker"  rel="node" />Allow to select by client during checkout</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="160"><label >Node selection</label></td>
                        <td >
                            <input type="radio" name="options[findnode]" value="dense" {if !$default.findnode || $default.findnode=='dense'}checked{/if} /> 
                            <strong>Dense</strong>, use nodes with minimum free RAM <br />
                            <input type="radio" name="options[findnode]" value="sparse" {if $default.findnode=='sparse'}checked{/if} /> 
                            <strong>Sparse</strong>, use nodes with maximum free RAM, <br/>
                            <input type="radio" name="options[findnode]" value="random" {if $default.findnode=='random'}checked{/if} /> 
                            <strong>Random</strong>, select nodes randomly
                        </td>
                    </tr>
                    <tr>
                        <td width="160">
                            <label> HA </label>
                        </td>
                        <td >
                            <span class="f-hide">
                                <input type="checkbox" size="3" name="options[ha]" value="1" id="privnetwork" {if $default.ha}checked="checked"{/if}/> Allow clients to enable High availability for VMs
                                <br />
                            </span>
                            <span class="fs11"> <input type="checkbox" class="formchecker"  rel="ha" />Allow to select by client during checkout</span>
                            <br/>
                            <input type="checkbox" size="3" name="options[hanewms]" value="1" id="privnetwork" {if $default.hanewms}checked="checked"{/if}/> Enable HA on new VMs by default
                        </td>
                    </tr>
                    <tr>
                        <td width="160">
                            <label> HA Group </label>
                        </td>
                        <td >
                            <div id="optionhagroup" class="tofetch">
                                <select name="options[hagroup]" id="hagroup">
                                    <option value="{$default.hagroup}" selected="selected">{$default.hagroup }</option>
                                </select>
                            </div>
                        </td>
                    </tr>

                </table>
                <div class="nav-er"  id="step-2">
                    <a href="#" class="prev-step">Previous step</a>
                    <a href="#" class="next-step">Next step</a>
                </div>

            </div>
            <div class="onapptab form" id="ostemplates_tab">
                <div class=" pdx">Limit access to ISO Images available in your Proxmox, you can also add charge to selected images</div>
                <table border="0" cellspacing="0" cellpadding="6" width="100%" >
                    <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>

                    <tr>
                        <td width="160"><label >ISO Storage<a class="vtip_description" title="Select storage your clients will be able to choose ISO from. Note: iso stores should share name/id across nodes, HostBill will assume that selected ISO is available on all nodes configured with this product"></a></label></td>
                        <td  class="tofetch" id="option20container"><select name="options[option20][]" id="option20" multiple="multiple" class="multi">
                                <option value="All" {if in_array('All',$default.option20)}selected="selected"{/if}>All</option>
                            {foreach from=$default.option20 item=vx}{if $vx=='All'}{continue}{/if}
                                <option value="{$vx}" selected="selected">{$vx}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr class="odesc_ odesc_cloud_vm">
                    <td></td>
                    <td><span class="fs11" ><input type="checkbox" rel="os2" class="formchecker osloader" />Set template pricing</span></td>
                </tr>
                <tr class="odesc_ odesc_single_vm">
                    <td><label >OS Template <a class="vtip_description" title="Your client VM will be automatically provisioned with this template"></a></label></td>
                    <td id="option12container" ><div  class="tofetch"><input type="text" size="3" name="options[option12]" value="{$default.option12}" id="option12"/></div>
                        <span class="fs11" ><input type="checkbox" class="formchecker osloader" rel="os1" />Allow client to select during checkout</span></td>
                </tr>

            </table>
            <div class="nav-er"  id="step-3">
                <a href="#" class="prev-step">Previous step</a>
                <a href="#" class="next-step">Next step</a>
            </div>
        </div>
        <div class="onapptab form" id="storage_tab">
            <table border="0" cellspacing="0" cellpadding="6" width="100%" >
                <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>

                <tr>
                    <td width="160"><label >Disk size [GB]</label></td>
                    <td id="option6container"><input type="text" size="3" name="options[option6]" value="{$default.option6}" id="option6"/>
                        <span class="fs11"  ><input type="checkbox" class="formchecker" rel="disk_size" />Allow client to adjust with slider during order</span>
                    </td>
                </tr>
                <tr>
                    <td width="160"><label >Storage <a class="vtip_description" title="VM's disk will be created on selected storage. Auto-assign option will use random storage"></a></label></td>
                    <td id="option21container" ><div  class="tofetch"><select name="options[option21][]" id="option21" multiple="multiple" class="multi">
                                <option value="Auto-Assign" {if in_array('Auto-Assign',$default.option21)}selected="selected"{/if}>Auto-Assign</option>
                            {foreach from=$default.option21 item=vx}{if $vx=='Auto-Assign'}{continue}{/if}
                                <option value="{$vx}" selected="selected">{$vx}</option>
                            {/foreach} 
                        </select></div>
                    <span class="fs11"><input type="checkbox" class="formchecker" rel="datastorezone" />Allow client to select during order</span>
                </td>
            </tr>

            <tr>
                <td width="160"><label >Bus/Device <a class="vtip_description" title="Select bus/device available for client. Selecting more than one for cloud will allow client to choose from"></a></label></td>
                <td id="option18container" ><div  ><select name="options[option18][]" id="option18" multiple="multiple" class="multi">
                            <option value="IDE" {if in_array('IDE',$default.option18)}selected="selected"{/if}>IDE</option>
                            <option value="VIRTIO" {if in_array('VIRTIO',$default.option18)}selected="selected"{/if}>VIRTIO</option>
                            <option value="SATA" {if in_array('SATA',$default.option18)}selected="selected"{/if}>SATA</option>
                            <option value="SCSI" {if in_array('SCSI',$default.option18)}selected="selected"{/if}>SCSI</option>
                        </select></div>
                </td>
            </tr>
            <tr>
                <td width="160"><label >Disk Format <a class="vtip_description" title="For KVM provisioning"></a></label></td>
                <td id="option43container" ><div  ><select name="options[option43]" id="option43" >
                            <option value="raw" {if $default.option43=='raw'}selected="selected"{/if}>Raw disk image (raw)</option>
                            <option value="qcow2" {if $default.option43=='qcow2'}selected="selected"{/if}>QUEMU image format (qcow2)</option>
                            <option value="vmdk" {if $default.option43=='vmdk'}selected="selected"{/if}>VMWare image format (vmdk)</option>
                        </select></div>
                </td>
            </tr>
        </table>
        <div class="nav-er"  id="step-4">
            <a href="#" class="prev-step">Previous step</a>
            <a href="#" class="next-step">Next step</a>
        </div>

    </div>
    <div class="onapptab form" id="backup_tab">
        <table border="0" cellspacing="0" cellpadding="6" width="100%" >
            <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>

            <tr>
                <td width="160"><label >Backups limit</label></td>
                <td id="backuplimitcontainer"><input type="text" size="3" name="options[backuplimit]" value="{$default.backuplimit}" id="backuplimit"/>
                    <span class="fs11"  ><input type="checkbox" class="formchecker" rel="backuplimit" />Allow client to adjust with slider during order</span>
                </td>
            </tr>
            <tr>
                <td width="160"><label >Backups size [GB]</label></td>
                <td id="backupsizelimitcontainer"><input type="text" size="3" name="options[backupsizelimit]" value="{$default.backupsizelimit}" id="backupsizelimit"/>
                    <span class="fs11"  ><input type="checkbox" class="formchecker" rel="backupsizelimit" />Allow client to adjust with slider during order</span>
                </td>
            </tr>
            <tr>
                <td width="160"><label >Backup storage <a class="vtip_description" title="Backup will be saved to selected storage. Selecting multiple options will use random storage for each backup"></a></label></td>
                <td id="backupstoragecontainer" >
                    <div  class="tofetch">
                        <select name="options[backupstorage][]" id="backupstorage" multiple="multiple" class="multi">
                            {foreach from=$default.backupstorage item=vx}
                                <option value="{$vx}" selected="selected">{$vx}</option>
                            {/foreach}
                        </select>
                    </div>
                    <span class="fs11"><input type="checkbox" class="formchecker" rel="backupstorage" />Allow client to select during order</span>
                </td>
            </tr>
            <tr>
                <td width="160"><label >Backup method </label></td>
                <td id="backupmodecontainer" ><div  ><select name="options[backupmode]" id="backupmode" >
                            <option value="snapshot" {if $default.backupmode=='snapshot'}selected="selected"{/if}>Snapshot</option>
                            <option value="suspend" {if  $default.backupmode=='suspend'}selected="selected"{/if}>Suspend</option>
                            <option value="stop" {if $default.backupmode=='stop'}selected="selected"{/if}>Stop</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <td width="160"><label >Compression </label></td>
                <td id="backupcompressioncontainer" ><div  ><select name="options[backupcompression]" id="backupcompression" >
                            <option value="none" {if $default.backupcompression=='none'}selected="selected"{/if}>None (raw)</option>
                            <option value="lzo" {if !$default.backupcompression || $default.backupcompression=='lzo'}selected="selected"{/if}>LZO (fast)</option>
                            <option value="gzip" {if $default.backupcompression=='gzip'}selected="selected"{/if}>GZIP (good)</option>
                        </select>
                    </div>
                </td>
            </tr>
        </table>
        <div class="nav-er"  id="step-4">
            <a href="#" class="prev-step">Previous step</a>
            <a href="#" class="next-step">Next step</a>
        </div>

    </div>
    <div class="onapptab form" id="network_tab">
        <table border="0" cellspacing="0" cellpadding="6" width="100%" >
            <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>

            <tr>
                <td width="160"><label >Port Speed [Mbps] <a class="vtip_description" title="Leave blank to unlimited. For cloud hosting this value will be used for each Virtual Machine created by client"></a></label></td>
                <td id="option9container"><input type="text" size="3" name="options[option9]" value="{$default.option9}" id="option9"/>
                    <span class="fs11"><input type="checkbox" class="formchecker" rel="rate"  />Allow client to select during order</span>
                </td>
            </tr>
            <tr>
                <td >
                    <label>Bandwidth Limit 
                        <a class="vtip_description" title="Limit port speed on client vms when bandwith usage exceeds send/receive limits"></a>
                    </label>
                </td>
                <td id="limitbandwidthcontainer">
                    <input type="checkbox" size="3" name="options[limitbandwidth]" value="1" {if $default.limitbandwidth}checked{/if} id="limitbandwidth"/>
                    Reduce network iterface port speed when bandwidth usage reaches certain values.
                </td>
            </tr>
            <tr class="bandwidth_opt">
                <td ><label >Data sent <a class="vtip_description" title="This is total limit for all client's virtual machines usage. Use 0 for unlimited"></a></label></td>
                <td id="option16container">
                    <input type="text" size="3" name="options[datasent]" value="{$default.datasent}" id="option16"/>
                    <select name="options[datasent_unit]" >
                        <option value="1">GB</option>
                        <option value="1024" {if $default.datasent_unit==1024}selected{/if}>TB</option>
                    </select>
                    <span class="fs11">
                        <input type="checkbox" class="formchecker" rel="data_sent" /> Allow client to adjust with slider during order
                    </span>
                </td>
            </tr>
            <tr class="bandwidth_opt">
                <td ><label >Data received <a class="vtip_description" title="This is total limit for all client's virtual machines usage. Use 0 for unlimited"></a></label></td>
                <td id="option18container">
                    <input type="text" size="3" name="options[datarecv]" value="{$default.datarecv}" id="option18"/>
                    <select name="options[datarecv_unit]" >
                        <option value="1">GB</option>
                        <option value="1024" {if $default.datarecv_unit==1024}selected{/if}>TB</option>
                    </select>
                    <span class="fs11">
                        <input type="checkbox" class="formchecker" rel="data_recv" /> Allow client to adjust with slider during order
                    </span>
                </td>
            </tr>
            <tr class="bandwidth_opt">
                <td ><label >On bandwidth overuse</label></td>
                <td id="portspeedcappcontainer">
                    <div>
                        <input type="radio" name="options[bandwidthaction]" value="limit" {if !$default.bandwidthaction || $default.bandwidthaction == 'limit'}checked{/if} />
                        Limit Port Speed to 
                        <input type="text" size="3" name="options[portspeedcapp]" value="{$default.portspeedcapp|default:10}" id="portspeedcapp"/>
                        [Mbps] (<em>Requires 4.2 for LXC</em>)
                    </div>
                    <div>
                        <input type="radio" name="options[bandwidthaction]" value="suspend" {if $default.bandwidthaction == 'suspend'}checked{/if} />
                        Suspend account (<em>This will power off client VMs</em>)
                    </div>
                </td>
            </tr>
            <tr class="bandwidth_opt">
                <td ><label >Notification Email <a class="vtip_description" title="This option requires you to set an email template in &quot;Emails&quot; tab, if it is not set this notification is disabled."></a></label></td>
                <td id="portspeedcappcontainer">
                    <div>
                        Send email notification when bandwidth usage reaches
                        <input type="text" size="3" name="options[bandwidthnotify]" value="{$default.bandwidthnotify|default:80}" id="portspeedcapp"/>
                        %
                    </div>
                </td>
            </tr>
            <tr>
                <td width="160"><label >Network mode <a class="vtip_description" title="For OpenVZ virtualization only"></a></label></td>
                <td ><select name="options[option31]" id="option31" >
                        <option value="bridged" {if $default.option31!='routed'}selected="selected"{/if}>Bridged</option>
                        <option value="routed" {if $default.option31=='routed'}selected="selected"{/if}>Routed (venet) - requires IPAM plugin</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td width="160"><label >Network bridge <a class="vtip_description" title="Client VM's will be connected trough this bridge. <br>Note1: For OpenVZ used in bridged mode, and LXC by default<br>Note2: when using multiple nodes make sure your bridge names are the same across all nodes"></a></label></td>
                <td id="option22container" class="tofetch"><select name="options[option22]" id="option22" >
                        <option value="{$default.option22}" selected="selected">{$default.option22}</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td width="160"><label >Model <a class="vtip_description" title="Select network device models available. Selecting more than one for cloud will allow client to choose from"></a></label></td>
                <td id="option27container" ><div  ><select name="options[option27][]" id="option27" multiple="multiple" class="multi">
                            <option value="rtl8139" {if in_array('rtl8139',$default.option27)}selected="selected"{/if}>Realtec RTl8139</option>
                            <option value="e1000" {if in_array('e1000',$default.option27)}selected="selected"{/if}>Intel E1000</option>
                            <option value="virtio" {if in_array('virtio',$default.option27)}selected="selected"{/if}>VirtIO (paravirtualized)</option>
                        </select></div>
                </td>
            </tr>
        </table>
        <div class="nav-er"  id="step-5">
            <a href="#" class="prev-step">Previous step</a>
            <a href="#" class="next-step">Next step</a>
        </div>
    </div>
    <div class="onapptab form" id="network_tab">
        <table border="0" cellspacing="0" cellpadding="6" width="100%" >
            <tr>
                <td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td>
            </tr>
            {if $ipam}
                <tr>
                    <td colspan="2">
                        You have enabled ipam plugin - thats great, now you can enable feature to automatically assign IP addresses to client's virtual machines.<br/>
                        <b>How it works?</b><br/>
                        <ul>
                            <li>Enable IPAM integration below</li>
                            <li>Select IP pool from IPAM to use with this product</li>
                            <li>Each time client creates virtual machine HostBill will get free IP from IPAM, and mark it as assigned to this virtual machine</li>
                            <li>IP will be displayed in clientarea interface, and set as admin comment to client VM</li>
                            <li>Use those IPs as reference when configuring networking for client VM's</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td width="160"><label >Enable IPAM</label></td>
                    <td ><input type="checkbox" name="options[option33]" value="1" {if $default.option33=='1'}checked="checked"{/if}> </td>
                </tr>
                <tr>
                    <td width="160"><label >IPAM Pool <a class="vtip_description" title="Select pool from which HostBill should assign IPs for this package."></a></label></td>
                    <td >
                        <select name="options[option32]" >
                            {foreach from=$ipam_lists item=list}
                                <option value="{$list.id}" {if $list.indent!='0'}style="padding-left:10px"{/if} {if $default.option32==$list.id}selected="selected"{/if}>{$list.name}</option>
                            {/foreach}

                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="160"  style="vertical-align: top"><label >Vlan tag <a class="vtip_description" title="Network interface will be assigned with vlan tag from selected IP pool"></a></label></td>
                    <td  style="line-height: 20px;">
                        <input type="hidden" name="options[ipamvlan]" value="0">
                        <input type="checkbox" {if $default.ipamvlan}checked{/if}  name="options[ipamvlan]" value="1"> Enabled<br />
                    </td>
                </tr>
                <tr>
                    <td width="160"><label >IP Limit <a class="vtip_description" title="Leave blank for unlimited. If this limit is reached clients won't be able to provision new VMs."></a></label></td>
                    <td id="ipamlimitcontainer"><input type="text" size="3" name="options[ipamlimit]" value="{$default.ipamlimit}" id="ipamlimit"/>
                        <span class="fs11"><input type="checkbox" class="formchecker"  rel="ipamlimit"> Allow client to adjust with slider during order</span>
                    </td>
                </tr>
            {else}
                <tr>
                    <td width="160"><label >IPAM Integration</label></td>
                    <td >This feature requires IPAM plugin to be installed and enabled on your system.</td>
                </tr>
            {/if}
        </table>
        <div class="note">In case when using LXC virtualization IPs will be assigned using DHCP if IPAM integration is not available.</div>
        <div class="nav-er"  id="step-5">
            <a href="#" class="prev-step">Previous step</a>
            <a href="#" class="next-step">Next step</a>
        </div>
    </div>
    <div class="onapptab form" id="finish_tab">
        <table border="0" cellspacing="0" width="100%" cellpadding="6">
            <tr><td colspan="2" class="onapp-preloader" style=""><img src="templates/default/img/ajax-loader3.gif"> Fetching data from Proxmox, please wait...</td></tr>
            <tr>
                <td valign="top" width="160" style="border-right:1px solid #E9E9E9">
                    <h4 class="finish">Finish</h4>
                    <span class="fs11" style="color:#C2C2C2">Save &amp; start selling</span>
                </td>
                <td valign="top">
                    Your Proxmox VE package is ready to be purchased. <br/>
                </td>
            </tr>
        </table>

    </div>
</div>
<link href="../includes/modules/Hosting/proxmox2/templates/product.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="../includes/modules/Hosting/proxmox2/templates/product.js"></script>
</div>
</td>
</tr>