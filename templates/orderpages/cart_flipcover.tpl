{*
@@author:: HostBill Team
@@name:: Cover flip
@@description::  A 5-step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: cart_flipcover/thumb.png
@@img:: cart_flipcover/preview.png
*}
<script type="text/javascript"> var step = {$step}; </script>
<script type="text/javascript" src="{$orderpage_dir}common/cart.js?step={$step}"></script>
<script type="text/javascript" src="{$orderpage_dir}cart_flipcover/js/script.js"></script>
{include file='cart.progress.tpl'}

<div id="orderpage" class="orderpage">

{if $step==0}
{include file='cart_flipcover/cart0.tpl'}	
{elseif $step==1}
	{include file='cart_flipcover/cart1.tpl'}
{elseif $step==2}
	{include file='cart_flipcover/cart2.tpl'}
{elseif $step==3}
	{include file='cart_flipcover/cart3.tpl'}
{elseif $step==4} 
	{include file='cart_flipcover/cart4.tpl'}
{elseif $step==5} 
	{include file='cart5.tpl'}
{/if}

</div>