<tr><td></td>
    <td ><div id="">


            <table style="background: white" class="table table-striped" >
                <tbody>

                    <tr id="v4_subnet_sizerow">
                        <td align="right" width="190" >
                            <strong>IPv4 Subnet Size:</strong>                        
                        </td>
                        <td>
                            <select id="conf_opt_v4_subnet_size" name="options[v4_subnet_size]">
                                <option value="0" {if $default.v4_subnet_size=='0'}selected="selected"{/if}>None (0 ips)</option>
                                {foreach from=$subnets item=sub}
                                    <option value="{$sub.mask}"  {if $default.v4_subnet_size==$sub.mask}selected="selected"{/if}>{$sub.mask} ({$sub.num})</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>IPv4 Subnet Lists:</strong> </td>
                        <td>
                            <select id="conf_opt_v4_subnet" name="options[v4_subnet][]" multiple>
                                <option value="auto">Auto-Assign</option>
                                {foreach from=$ipams.pub.ipv4 item=list}
                                    <option value="{$list.id}" {if $list.id|@in_array:$default.v4_subnet}selected="selected"{/if}>{$list.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr class="odd" id="v6_subnet_sizerow">
                        <td align="right" width="190">
                            <strong>IPv6 Subnet size:</strong>                        </td>
                        <td>


                            <select id="conf_opt_v6_subnet_size" name="options[v6_subnet_size]">
                                <option value="0" {if $default.v6_subnet_size=='0'}selected="selected"{/if}>None (0 ips)</option>
                                {foreach from=$subnets item=sub}
                                    <option value="{$sub.mask6}"  {if $default.v6_subnet_size==$sub.mask6}selected="selected"{/if}>{$sub.mask6} ({$sub.num})</option>
                                {/foreach}
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td><strong>IPv6 Subnet Lists:</strong> </td>
                        <td>
                            <select id="conf_opt_v4_subnet" name="options[v6_subnet][]" multiple>
                                <option value="auto">Auto-Assign</option>
                                {foreach from=$ipams.pub.ipv6 item=list}
                                    <option value="{$list.id}" {if $list.id|@in_array:$default.v6_subnet}selected="selected"{/if}>{$list.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr class="odd" id="auto_vlanrow">
                        <td align="right" width="190">
                            <strong>Auto provision vlan:</strong>                        </td>
                        <td>
                            <div class="editor" style="display: block;">
                                <input id="conf_opt_auto_vlan" type="checkbox" {if $default.auto_vlan}checked="checked"{/if} name="options[auto_vlan]">
                            </div>    
                        </td>
                    </tr>

                    <tr id="v4_subnet_size_privrow">
                        <td align="right" width="190">
                            <strong>Private IPv4 Subnet size:</strong>                        </td>
                        <td>

                            <select id="conf_opt_v4_subnet_size_priv" name="options[v4_subnet_size_priv]">
                                <option value="0" {if $default.v4_subnet_size_priv=='0'}selected="selected"{/if}>None (0 ips)</option>
                                {foreach from=$subnets item=sub}
                                    <option value="{$sub.mask}"  {if $default.v4_subnet_size_priv==$sub.mask}selected="selected"{/if}>{$sub.mask} ({$sub.num})</option>
                                {/foreach}
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td><strong>Private IPv4 Subnet Lists:</strong> </td>
                        <td>
                            <select id="conf_opt_v4_subnet" name="options[v4_subnet_priv][]" multiple>
                                <option value="auto">Auto-Assign</option>
                                {foreach from=$ipams.priv.ipv4 item=list}
                                    <option value="{$list.id}" {if $list.id|@in_array:$default.v4_subnet_priv}selected="selected"{/if}>{$list.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>

                    <tr class="odd" id="v6_subnet_size_privrow">
                        <td align="right" width="190">
                            <strong>Private IPv6 Subnet size:</strong>                        </td>
                        <td>
                            <select id="conf_opt_v6_subnet_size_priv" name="options[v6_subnet_size_priv]">
                                <option value="0" {if $default.v6_subnet_size_priv=='0'}selected="selected"{/if}>None (0 ips)</option>
                                {foreach from=$subnets item=sub}
                                    <option value="{$sub.mask6}"  {if $default.v6_subnet_size_priv==$sub.mask6}selected="selected"{/if}>{$sub.mask6} ({$sub.num})</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Private IPv6 Subnet Lists:</strong> </td>
                        <td>
                            <select id="conf_opt_v4_subnet" name="options[v6_subnet_priv][]" multiple>
                                <option value="auto">Auto-Assign</option>
                                {foreach from=$ipams.priv.ipv6 item=list}
                                    <option value="{$list.id}" {if $list.id|@in_array:$default.v6_subnet_priv}selected="selected"{/if}>{$list.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>

                    <tr class="odd" id="auto_vlan_privrow">
                        <td align="right" width="190">
                            <strong>Auto provision private vlan:</strong>                        </td>
                        <td>
                            <div class="editor" style="display: block;">
                                <input id="conf_opt_auto_vlan_priv" type="checkbox" {if $default.auto_vlan_priv}checked="checked"{/if} name="options[auto_vlan_priv]">
                            </div>    
                        </td>
                    </tr>

                    <tr class="odd">
                        <td align="right" width="190">
                            <a onclick="return preconfig_forms();"  class="new_control" href="#"><span class="gear_small">Auto-add form fields</span></a>
                        </td>
                        <td>

                            <div id="preconfigure_option">
                                Note: Your clients can choose subnet sizes during signup using Forms, if related forms elements are added, settings above takes no effect <br/>

                            </div>    
                        </td>
                    </tr>


                </tbody></table>
                {literal}


                <script type="text/javascript">

                    function preconfig_forms() {
                        if ($('#configvar_ip4size').length || $('#configvar_ip6size').length) {
                            alert('Form elemens are already added, to re-create remove old elements first');
                            return false;
                        }
                        $.post('?cmd=ip_provisioning&action=preconfigure',
                            {
                                id: $('#product_id').val(),
                                cat_id: $('#category_id').val()
                            }, function (data) {
                            var r = parse_response(data);
                            ajax_update('?cmd=configfields', {product_id: $('#product_id').val(), action: 'loadproduct'}, '#configeditor_content');
                        });
                        return false;
                    }

                </script>

            {/literal}

        </div>

    </td>
</tr>

