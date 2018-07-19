<div class="slider">
    <ul class="slides">
      <li>
        <img src="{$template_dir}img/slider/1.png"> <!-- random image -->
        <div class="caption center-align">
          <h3>This is our big Tagline!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="{$template_dir}img/slider/2.png"> <!-- random image -->
        <div class="caption left-align">
          <h3>Left Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="{$template_dir}img/slider/3.png"> <!-- random image -->
        <div class="caption right-align">
          <h3>Right Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
    </ul>
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

<script>
{literal}

$(function () {
$( "div.container" ).removeClass( "container" );
$("#main").css("margin-top","-52px");
$( ".slider" ).addClass( "calcular-alto-home-slider" );
$( ".slides" ).addClass( "calcular-alto-home-slides" )
});

{/literal}

</script>