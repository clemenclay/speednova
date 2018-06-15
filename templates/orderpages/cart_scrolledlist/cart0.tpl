<link href='http://fonts.googleapis.com/css?family=Lato:400,700,700italic,400italic' rel='stylesheet' type='text/css'>
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}cart_scrolledlist/css/main.css" />
<script src="{$orderpage_dir}cart_scrolledlist/js/jquery.tinyscrollbar.min.js"></script>
<script src="{$orderpage_dir}cart_scrolledlist/js/jquery.scrollTo-min.js"></script>

<div id="container">
    {include file='cart_scrolledlist/categories.tpl'}
    {include file='cart_scrolledlist/header.tpl'}

    {if count($currencies)>1}
    <form action="" method="post" id="currform">
        <p align="right" style="margin-right:15px">
            <input name="action" type="hidden" value="changecurr">
            {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                {foreach from=$currencies item=crx}
                <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                {/foreach}
            </select>
        </p>
    </form>
    {/if}

    <div class="clearfix"></div>

    <div id="box-wrapper">
	<div class="bundle-title">
	    Your choosen bundle
	</div>
	<div class="highlight"></div>
	<div id="product-box">
	    {foreach from=$products item=i name=loop key=k}
	    
	    {if $smarty.foreach.loop.index == 0 && $smarty.foreach.loop.index == $opconfig.highlighted}
		{literal}
		<script>
		    $(function() {
			$('.highlight').fadeIn(300);
		    });
		</script>
		{/literal}
	    {/if}
	    
	    <div class="product" id="product-{$i.id}">
		<h3 class="title">Professional Server</h3>

		{specs var="awords" string=$i.description}
		{foreach from=$awords item=prod name=lla key=k}

		{if $prod.features} 
		<p>
		    {$prod.features|strip_tags:false:'<b><br>'}
		</p>
		{/if}

		{/foreach}
		{assign var=awords value=false}
		
		<div class="line">
		    <div class="line-left-short"></div>
		    <div class="line-right-short"></div>
		</div>
		<h3 class="options">What's included</h3>

		{assign var=specs value="<br>"|explode:$i.description} 
		{if $specs}
		{foreach from=$specs item=spec}
		{if $spec|strstr:"<ul>"}
		    {break}
		    {/if}
		    {assign var=key_val value=":"|explode:$spec}
		    <div class="pill">
			<div class="name"><div>{$key_val[0]}</div></div>
			<div class="value"><div>{$key_val[1]}</div></div>
		    </div>
		    {assign var=key_val value=false}
		    {/foreach}
		    {/if}

	    </div>
	    {/foreach}
	</div>
	<div id="product-list">
	    <div class="header">
		Our predefined
		<strong>Special Bundles</strong>
	    </div>
	    <div class="list">
		<div class="first first-list-item">
		    <div class="first-list">
			<div class="left">Server name</div>
			<div class="right">Price</div>
		    </div>
		</div>
		<div id="scrollable-area">
		    <div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
		    <div class="hidden-area">
			<div class="viewport">
			    <div class="overview">
				{foreach from=$products item=i name=loop key=k}
				<div class="list-item {if $smarty.foreach.loop.index == 0} active {/if}" 
				     data-price="{include file='common/price.tpl' product=$i hideall=true}" 
				     data-id="{$i.id}" {if $smarty.foreach.loop.index == $opconfig.highlighted} 
				     data-highlight="true" {/if}>
				     <div class="indicator"></div>
				    <div class="inner">
					<div class="left">{$i.name}</div>
					<div class="right">{$currency.sign}{include file='common/price.tpl' product=$i hideall=true} {$currency.iso}</div>
				    </div>
				</div>
				{/foreach}
			    </div>
			</div>
		    </div>
		</div>
	    </div>
	    <div id="pricing">
		<div class="price">
		    Total price today
		    <div class="prx">
			<sup>$</sup><span id="prod_price">45,99</span> USD
		    </div>
		</div>
		<div class="buy">
		    <form method="post" action="" class="parentform">
			<input type="hidden" name="action" value="add" />
			<input type="hidden" id="prod_id" name="id" value="" />
			<a class="btn-buy" href="#" onclick="$(this).parent().submit();
		    return false;">{$lang.ordernow}</a>
		    </form>
		</div>
	    </div>
	</div>
    </div>

    <div class="line">
	<div class="line-left-half"></div>
	<div class="line-right-half"></div>
    </div>

    <div id="footer">
	<p class="title">{$opconfig.footheader}</p>
	<h2>{$opconfig.footsubheader}</h2>

	<div class="clearfix"></div>

	<div class="box">
	    <h3>{$opconfig.footer1head}</h3>
            {$opconfig.footer1text}

	</div>
	<div class="box margin">
	    <h3>{$opconfig.footer2head}</h3>
            {$opconfig.footer2text}
	</div>
	<div class="box">
	    <h3>{$opconfig.footer3head}</h3>
            {$opconfig.footer3text}
	</div>
    </div>

</div>

{literal}
<script type="text/javascript">

		$(function() {
		    $('#scrollable-area').tinyscrollbar(
			    {
				size: 270,
				wheel: 20
			    }
		    );

		    $start = $('#product-list .list-item.active');

		    $('#prod_id').val($start.data('id'));
		    $('#prod_price').text($start.attr("data-price"));

		    var $paneTarget = $('#product-box');
		    $('.list-item').click(function() {
			$this = $(this);
			
			$("#product-list .list-item").removeClass('active');
			$this.addClass('active');

			var id = $this.data('id');
			var highlight = $this.data('highlight');
			
			$('#prod_id').val(id);
			$('#prod_price').text($this.attr("data-price"));

			if (highlight === true) {
			    $("#box-wrapper .highlight").fadeIn(400);
			} else {
			    $("#box-wrapper .highlight").fadeOut(200);
			}

			var target = $("#product-" + id);
			$paneTarget.stop().scrollTo(target, 600);
		    });
		});

</script>
{/literal}

