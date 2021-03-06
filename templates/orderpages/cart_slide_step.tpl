{*
@@author:: HostBill team
@@name:: Step Slider - wizard theme
@@description:: Customizable slider template - each product is slider block to choose from.
Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.
@@thumb:: slide_step/preview_t.png
@@img:: slide_step/preview.png
*}
<script type="text/javascript" src="{$orderpage_dir}common/cart.js?step={$step}"></script>
{include file='cart.progress.tpl'}

{if $step==0}
{include file='slide_step/cart0.tpl'}
	
{elseif $step==1}
	{include file='cart1.tpl'}
{elseif $step==2}
	{include file='cart2.tpl'}
{elseif $step==3}
	{include file='cart3.tpl'}
{elseif $step==4} 
	{include file='cart4.tpl'}
{elseif $step==5} 
	{include file='cart5.tpl'}
{/if}

