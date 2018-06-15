{*

This file is rendered on main HostBill screen when browsed by user

*}







<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('{$template_dir}img/slider/1.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('{$template_dir}img/slider/2.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('{$template_dir}img/slider/3.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>




<!--


<h3>{$lang.welcome}</h3>
<div class="row box-feature-divider">
    <div class="span4">
        <div class="box-feature"><a href="{$ca_url}cart/"><span style="" class="iconfont-bag iconfont-size5 silver"></span></a>
               <h1>{$lang.placeorder|capitalize}</h1>
                <p>{$lang.placeorder_desc}</p>

        </div>
    </div>
    <div class="span4">

        <div class="box-feature">
            <a href="{$ca_url}clientarea/"><span style="" class="iconfont-gear iconfont-size5 silver"></span></a>
                <h1>{$lang.clientarea|capitalize}</h1>
                <p>{$lang.clientarea_desc}</p>
        </div>
    </div>

    <div class="span4">
        <div class="box-feature">

            <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/"><span style="" class="iconfont-question-round iconfont-size5 silver"></span></a>
                <h1>{$lang.support|capitalize}</h1>
                <p>{$lang.support_desc}</p>
        </div>
    </div>
</div>






{if $enableFeatures.news!='off' && $annoucements}
<div id="announcements">
	{foreach from=$annoucements item=annoucement}

<h3><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
<span class="annoucement_date"><i class="icon-time"></i> {$lang.published} {$annoucement.date|dateformat:$date_format}</span>
<p >{$annoucement.content}


</p><div class="right">
    <div  class="btn-group">
          <a href="{$ca_url}news/" class="btn btn-small">{$lang.newsarchive}</a>
          <a  href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="btn btn-small">{$lang.readall}</a>
        </div> </div>
<div class="clear"></div>
	{/foreach}
</div>
{/if}
-->
<script>
$( "div.container" ).removeClass( "container" )
$("main").css("padding-top","0");
</script>