
<form action="" method="POST" class="form-horizontal" id="content-cloud">
    <div class="header-bar">
        <h3 class="vmdetails hasicon">Boot order</h3>
    </div>
    <div class="content-bar" id="boot-order-form">
        <div class="row-fluid">
            <div class="control-group span3">
                <label><b>Device #1</b> </label>
                <select id="boot_dev_1" name="boot[0]">
                    <option value="" >None</option>
                    {foreach from=$storage item=disk}
                        <option value="{$disk}" {if $boot[0] == 'c' && $bootdisk==$disk}selected{/if}>Disk "{$disk}"</option>
                    {/foreach}
                    <option value="d" {if $boot[0] == 'd'}selected{/if}>CD-ROM</option>
                    <option value="n" {if $boot[0] == 'n'}selected{/if}>Network</option>
                </select>
            </div>
            <div class="control-group span3">
                <label><b>Device #2</b></label>
                <select id="boot_dev_2" name="boot[1]">
                    <option value="" >None</option>
                    {foreach from=$storage item=disk}
                        <option value="{$disk}" {if $boot[1] == 'c' && $bootdisk==$disk}selected{/if}>Disk "{$disk}"</option>
                    {/foreach}
                    <option value="d" {if $boot[1] == 'd'}selected{/if}>CD-ROM</option>
                    <option value="n" {if $boot[1] == 'n'}selected{/if}>Network</option>
                </select>
            </div>
            <div class="control-group span3">
                <label><b>Device #3</b></label>
                <select id="boot_dev_3" name="boot[3]">
                    <option value="" >None</option>
                    {foreach from=$storage item=disk}
                        <option value="{$disk}" {if $boot[2] == 'c' && $bootdisk==$disk}selected{/if}>Disk "{$disk}"</option>
                    {/foreach}
                    <option value="d" {if $boot[2] == 'd'}selected{/if}>CD-ROM</option>
                    <option value="n" {if $boot[2] == 'n'}selected{/if}>Network</option>
                </select>
            </div>
            <div class="control-group span3">
                <label>&nbsp;</label>
                <button class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
    {securitytoken}
</form>
{literal}
    <script type="text/javascript">
        $(function() {
            var selects = $('#boot-order-form select');
            selects.change(function(){
                var self = $(this);
                if(!self.val().length)
                    return false;
                
                selects.not(this).each(function(){
                    if($(this).val() == self.val()){
                        $(this).val('');
                    }
                })
            }).change();
        })
    </script>
{/literal}