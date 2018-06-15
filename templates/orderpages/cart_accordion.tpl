{*
@@author:: HostBill Team
@@name:: Accordion Slider
@@description::  A 5-step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: cart_accordion/thumb.png
@@img:: cart_accordion/preview.png
*}
<script type="text/javascript"> var step = {$step}; </script>
<script type="text/javascript" src="{$orderpage_dir}common/cart.js?step={$step}"></script>
<script type="text/javascript" src="{$orderpage_dir}cart_accordion/js/script.js"></script>
{include file='cart.progress.tpl'}

<div id="orderpage" class="orderpage">

{if $step==0}
{include file='cart_accordion/cart0.tpl'}	
{elseif $step==1}
	{include file='cart_accordion/cart1.tpl'}
{elseif $step==2}
	{include file='cart_accordion/cart2.tpl'}
{elseif $step==3}
	{include file='cart_accordion/cart3.tpl'}
{elseif $step==4} 
	{include file='cart_accordion/cart4.tpl'}
{elseif $step==5} 
	{include file='cart5.tpl'}
{/if}

</div>