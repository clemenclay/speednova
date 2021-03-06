<script>
    var currencySettings ={literal} {{/literal}
        decimalSeparator: ".", thousandsSeparator: "", decimalPlaces: {$currency.decimal}, prefix: "{$currency.sign}", suffix: " {$currency.code}", defaultValue: '0.00'
    {literal}}{/literal};

</script>
<link rel="stylesheet" type="text/css" media="screen" href="{$moduleliburl}jqueryui/custom-theme/jquery-ui-1.10.0.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="{$moduleliburl}jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" href="{$template_dir}js/facebox/facebox.css" type="text/css" />
<link rel="stylesheet" type="text/css"  href="{$moduleliburl}font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="{$template_dir}js/facebox/facebox.js"></script>

<script src="{$moduleliburl}common.js" type="text/javascript"></script>
<script src="{$moduleliburl}jqgrid/js/grid.locale-en.js" type="text/javascript"></script>
<script src="{$moduleliburl}jqgrid/js/jquery.jqGrid.src.js" type="text/javascript"></script>
<script src="{$moduleliburl}jquery.highlight.js" type="text/javascript"></script>
<script src="{$moduleliburl}handlebars.js" type="text/javascript"></script>
<script src="{$moduleliburl}jstpl.js" type="text/javascript"></script>


<div class="newhorizontalnav" id="newshelfnav">
    <div class="list-1">
        <ul>
            <li class="{if $action=='default' || !$action}active{/if}">
                <a href="?cmd=inventory_manager"><span>Dashboard</span></a>
            </li>

            <li class="{if $action=='inventory' || $action=='inventorylist'}active{/if}">
                <a href="?cmd=inventory_manager&action=inventory"><span>Inventory</span></a>
            </li>

            <li class="{if $action=='builds'}active{/if}">
                <a href="?cmd=inventory_manager&action=builds"><span>Server Builds</span>
                    {if $pending_builds>0}<span class="badge progress-bar-danger">{$pending_builds}</span>{/if}
                </a>
            </li>

            <li class="{if $action=='deliveries'}active{/if}">
                <a href="?cmd=inventory_manager&action=deliveries"><span>In Deliveries</span></a>
            </li>


            <li class="{if $action=='deployments'}active{/if}">
                <a href="?cmd=inventory_manager&action=deployments"><span>Offered Products</span></a>
            </li>

            <li class="{if $action=='settings' || $action=='producers' || $action=='vendors' || $action=='categories' || $action=='shipping'}active{/if} last">
                <a href="?cmd=inventory_manager&action=settings"><span>Settings</span></a>
            </li>

        </ul>
    </div>
    {if $action=='builds'}
        <div class="list-2">
            <div class="subm1 haveitems">
                <ul >
                    <li {if !$finished}class="picked"{/if} >
                        <a href="?cmd=inventory_manager&action=builds" ><span >Pending Builds</span></a>
                    </li>
                    <li {if $finished}class="picked"{/if}>
                        <a href="?cmd=inventory_manager&action=builds&finished=true"><span >Finished Builds</span></a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>

        </div>
    {elseif $action=='settings' || $action=='producers' || $action=='vendors' || $action=='categories' || $action=='shipping'}
        <div class="list-2">
            <div class="subm1 haveitems">
                <ul >
                    <li class="{if $action=='settings'}picked{/if}">
                        <a href="?cmd=inventory_manager&action=settings"><span>Options</span></a>
                    </li>
                    <li  class="{if $action=='categories'}picked{/if}">
                        <a href="?cmd=inventory_manager&action=categories"><span>Item Categories / Item types</span></a>
                    </li>
                    <li class="{if $action=='vendors'}picked{/if}">
                        <a href="?cmd=inventory_manager&action=vendors"><span>Vendors</span></a>
                    </li>
                    <li class="{if $action=='producers'}picked{/if}">
                        <a href="?cmd=inventory_manager&action=producers"><span>Manufacturers</span></a>
                    </li>
                    <li class="{if $action=='shipping'}picked{/if}">
                        <a href="?cmd=inventory_manager&action=shipping"><span>Shipping</span></a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>

        </div>
    {/if}
</div>
<div style="padding:10px">
    {if !$action || $action=='default'}
        {include file='dashboard.tpl'}
    {elseif $action=='inventory'}
        {include file='inventory.tpl'}
    {elseif $action=='inventorylist'}
        {include file='inventorylist.tpl'}
    {elseif $action=='builds'}
        {include file='builds.tpl'}
    {elseif $action=='deliveries'}
        {include file='deliveries.tpl'}
    {elseif $action=='deployments'}
        {include file='deployments.tpl'}
    {elseif $action=='producers'}
        {include file='producers.tpl'}
    {elseif $action=='vendors'}
        {include file='vendors.tpl'}
    {elseif $action=='categories'}
        {include file='categories.tpl'}
    {elseif $action=='settings'}
        {include file='settings.tpl'}
    {elseif $action=='shipping'}
        {include file='shipping.tpl'}
    {/if}    

</div>
{literal}
    <style>
        td.bordered {
            border-left: 0 none;
            border-right: 0 none;

            width: 100%;
        }
        td.leftNav{
            display: none;
        }
        #helpcontainer {
            padding-bottom:10px;     
        }
        .modernfacebox .conv_content .tabb {
            position:relative;
        }
        .subgrid-data , .subgrid-cell{
            background:#eee;
        }
        #porteditor {
            background: #F8F8F8;
            bottom: 52px;
            box-shadow: -1px 0 2px rgba(0, 0, 0, 0.2);
            display: none;
            left: 300px;
            position: absolute;
            right: 10px;
            top: 10px;
            padding:20px;
            z-index: 999;
            overflow:auto;
        }

        #facebox .ui-jqgrid .jqgrow td input, #facebox .ui-pg-input, #facebox .ui-pg-selbox {
            margin:0px;
            width:auto;
            border-radius:0px;
            padding:1px;
            box-shadow:none;
        }

        #promo{
            display: none
        }

        .bootstrap-facebox .form label{
            display: inline-block;
            float: none;
            width: 100%;
            margin: 0;
            font-size: inherit;
            clear: none;
        }
        .bootstrap-facebox .form input,
        .bootstrap-facebox .form textarea,
        .bootstrap-facebox .form select{
            margin:0;
            padding: 6px 12px;
            clear:none;
            float:none;
            height: 31px;
            line-height: 1.42857;
        }
        .bootstrap-facebox .form textarea{
            height: auto;
        }
    </style>
{/literal}