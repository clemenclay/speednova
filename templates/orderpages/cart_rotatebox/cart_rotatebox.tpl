{*
@@author:: Amarok Design
@@name:: Rotate Boxes
@@description::  desc.
@@thumb:: cart_rotatebox/thumb.png
@@img:: cart_rotatebox/preview.png
*}
<script type="text/javascript"> var step = {$step}; </script>
<script type="text/javascript" src="{$orderpage_dir}common/cart.js?step={$step}"></script>
<script type="text/javascript" src="{$orderpage_dir}cart_rotatebox/js/script.js"></script>
{include file='cart.progress.tpl'}

<div id="orderpage" class="orderpage">

{if $step==0}
{include file='cart_rotatebox/cart0.tpl'}	
{elseif $step==1}
	{include file='cart_rotatebox/cart1.tpl'}
{elseif $step==2}
	{include file='cart_rotatebox/cart2.tpl'}
{elseif $step==3}
	{include file='cart_rotatebox/cart3.tpl'}
{elseif $step==4} 
	{include file='cart_rotatebox/cart4.tpl'}
{elseif $step==5} 
	{include file='cart5.tpl'}
{/if}

</div>