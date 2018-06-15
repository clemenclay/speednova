
<form action="" method="POST" class="form-horizontal" id="content-cloud">
    <div class="header-bar">
        <h3 class="vmdetails hasicon">CD/DVD Drive</h3>
    </div>
    <div class="content-bar" id="boot-order-form">
        <div class="row-fluid">
            {foreach from=$drives item=cd}
                <div class="control-group span3">
                    <label><b>Device #{$cd.name}</b> </label>
                    <select name="device[{$cd.name}]">
                        <option value="" >None</option>
                        {foreach from=$isos item=iso}
                            <option value="{$iso[0]}" {if $cd.volid == $iso[0]}selected{/if}>{$iso[1]}</option>
                        {/foreach}
                    </select>
                </div>
            {foreachelse}
                <p class="alert alert-danger">
                    You do not have any CD/DVD drive attached to this vm
                </p>
            {/foreach}
            <div class="control-group span3">
                <label>&nbsp;</label>
                <button class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
    {securitytoken}
</form>