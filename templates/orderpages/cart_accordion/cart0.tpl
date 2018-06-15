<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}cart_accordion/css/main.css" />

<div id="container">
    {include file='cart_accordion/categories.tpl'}
    {include file='cart_accordion/header.tpl'}

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
	
	<div id="box-wrapper">
		<ul class="accordion horizontal hovered">
			{foreach from=$products item=i name=loop key=k}
            {if $smarty.foreach.loop.index > 3}{break}{/if}
			
		    <li class="{if $smarty.foreach.loop.index == $opconfig.highlighted}active{/if} tab-{if $smarty.foreach.loop.index == 0}blue{elseif $smarty.foreach.loop.index == 1}violet{elseif $smarty.foreach.loop.index == 2}orange{elseif $smarty.foreach.loop.index == 3}yellow{/if}">
				<div class="box-tab">
					<span>{$i.name}</span>
				</div>
				<div class="box-description">
					<div class="about">
					<h3>About <span>{$i.name}</span>:</h3>
					<p>{if $prod.features} 
							{$prod.features|strip_tags}
                            {/if}
							</p>
					</div>
					<div class="include">
					<h3><span>What’s included:</span></h3>
					<div class="clearfix"></div>
					
						{specs var="awords" string=$i.description}
                        {foreach from=$awords item=prod name=lla key=k}
                            {if $prod.specs} 
                            {foreach from=$prod.specs item=feat name=ll key=ka}
								<div class="desc {if $smarty.foreach.ll.index == 0}first{/if}">
									<strong>{$feat[1]}</strong><br />
									{$feat[0]}
								</div>
								{if not $smarty.foreach.ll.last}<div class="div"></div>{/if}
                            {/foreach}
                            {/if}
                        {/foreach}
                        {assign var=awords value=false}

					</div>
					<div class="price">
					<div class="total">
						{$lang.yourtotalprice}:
					</div>
					<div class="sum">
						<span><sup>{$currency.sign}</sup>{include file='common/price.tpl' product=$i hideall=true} <span class="currency">{$currency.iso}</span></span>
					</div>
					<div class="button">
						<form method="post" action="" class="parentform">
                            <input type="hidden" name="action" value="add" />
                            <input type="hidden" name="id" value="{$i.id}" />
							<a class="btn-green" onclick="$(this).parent().submit();
                                        return false;">{$lang.ordernow}</a>
						</form>
					</div>
					</div>
				</div>
		    </li>
			
			{/foreach}
		</ul>
	</div>
	
	<div class="clearfix"></div>

	<div id="pagination">
		<div class="btn-prev">Previous plan</div>
		<div class="btn-next">Next plan</div>
	</div>

	<div class="clearfix"></div>

	<div id="footer">
		<h2>{$opconfig.footheader}<span>{$opconfig.footsubheader}</span></h2>

		<div class="clearfix"></div>

		<div class="blue-dot box">
			<h3>{$opconfig.footer1head}</h3>
			<p>{$opconfig.footer1text}</p>
		</div>
		<div class="orange-dot box margin">
			<h3>{$opconfig.footer2head}</h3>
			<p>{$opconfig.footer2text}</p>
		</div>
		<div class="yellow-dot box">
			<h3>{$opconfig.footer3head}</h3>
			<p>{$opconfig.footer3text}</p>
		</div>
	    </div>

</div>

<script type="text/javascript">
{literal}
	    $(function() {
		$("#box-wrapper li").mouseenter(function() {
		    $("#box-wrapper li").removeClass('active');
		    $(this).addClass('active');
		});
		
		$('.btn-next').click(function() {
		    if ($('#box-wrapper li.active').next('li').length > 0)
			$('#box-wrapper li.active').removeClass('active').next('li').addClass('active');
		});
		
		$('.btn-prev').click(function() {
		    if ($('#box-wrapper li.active').prev('li').length > 0)
			$('#box-wrapper li.active').removeClass('active').prev('li').addClass('active');
		});
	    });
{/literal}
	</script>


