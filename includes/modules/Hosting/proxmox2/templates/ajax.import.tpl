{if $converted}
    <strong style="display: block; color: green; text-align: center;padding:10px;">Update compleated</strong>
{else}
    <div class="blu">
        <h3>Product Update</h3>
        {if $convert}
            Products listed below can be updated to use Proxmox v2
            <form action="?cmd=proxmox2&action=accountimport&id={$server_id}" id="convert">
                <table class="glike hover" style="width:100%">
                    <tr>
                        <th>Product</th>
                        <th>Update Product</th>
                        <th>Update existing Accounts to use this server</th>
                    </tr>
                    {foreach from=$convert item=product}
                        <tr>
                            <td><a href="?cmd=services&action=product&id={$product.id}">{$product.catname} - {$product.name}</a></td>
                            <td><input type="checkbox" name="convert[{$product.id}]" value="{$product.module}" checked /></td>
                            <td>
                                <input type="checkbox" name="migrate[{$product.id}]" value="{$server_id}" checked />
                                <input type="hidden" name="data[{$product.id}]" value="{$product.module}" />
                            </td>
                        </tr>
                    {/foreach}
                </table>
                <button type="submit">Update products to Proxmox v2</button>
            </form>
            {literal}
                <script type="text/javascript">
                    $(function() {
                        $('#convert').submit(function() {
                            var self = $(this),
                                data = self.serializeObject();
                            data.make = 'convert';
                            self.addLoader();
                            $.post(self.attr('action'), data, function(data) {
                                data = parse_response(data);
                                $('#convert').replaceWith(data);
                            })
                            return false;
                        });
                    })
                </script>
            {/literal}
        {else}
            All product associatd with this server are already using newest Proxmox version
        {/if}
    </div>
    <br />
    <div class="blu">
        <h3>Import</h3>
        <span >This module doesn't support account import</span>
    </div>
{/if}