{*
@@author:: HostBill team
@@name:: Chart Table, Wizard
@@description:: Can hold any amount of products. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>
@@thumb:: cart_chart_table/thumb.png
@@img:: cart_chart_table/preview.png
*}
<script type="text/javascript"> var step = {$step}; </script>
<script type="text/javascript" src="{$orderpage_dir}common/cart.js?step={$step}"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}cart_chart_table/css/orderpage.css" />
<script type="text/javascript" src="{$orderpage_dir}cart_chart_table/js/script.js"></script>

{if $step==0}
    {include file='cart_chart_table/cart0.tpl'}
{elseif $step==1}
    {include file='cart_chart_table/cart1.tpl'}
{elseif $step==2}
    {include file='cart_chart_table/cart2.tpl'}
{elseif $step==3}
    {include file='cart_chart_table/cart3.tpl'}
{elseif $step==4}
    {include file='cart_chart_table/cart4.tpl'}
{elseif $step==5}
    {include file='cart5.tpl'}
{/if}