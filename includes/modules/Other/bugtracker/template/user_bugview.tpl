<div class="bordered-section article text-block clear clearfix">
    <h2 class="h-width">{$bug.subject} <a href="?cmd=bugtracker"  class="btn btn-mini right"><i class="icon-chevron-left"></i> {$lang.back}</a></h2>  
    <div class="ribbon form-horizontal">
<div class="control-group">
<label for="appendedPrependedInput" class="control-label left" style="width:auto">
<span class="label  label-info">{$bug.version}</span>
    {if $bug.category_name || $category.name}<span class="label">{$bug.category_name}{$category.name}</span>{/if}
    Severity: <span class="label  {if $bug.votes>0}label-important{elseif $bug.votes<0}label-inverse{else}label-warning{/if}">{$bug.votes}</span>           
       
</label>
<div class="right">{if $bug.status=='Open'}
    <a href="?cmd=bugtracker&action=bug&id={$bug.id}&make=vote&security_token={$security_token}&vote=1" class="btn btn-success btn-large"><i class="icon-ok icon-white"></i> It bugs me too!</a>
    <a href="?cmd=bugtracker&action=bug&id={$bug.id}&make=vote&security_token={$security_token}&vote=-1" class="btn btn-inverse btn-large"><i class="icon-remove icon-white"></i> Its not important</a>
{else}
    <div style="padding-top:10px">
    <span class="label">{$bug.status}</span>
   {if $bug.resolved_version}Fixed in:  <span class="label  label-success">{$bug.resolved_version}</span>{/if}
    </div>{/if}</div>
</div>
</div><div class="ribbon-shadow-l"></div><div class="ribbon-shadow-r"></div>
    
    <div class="p19">
          {if $bug.admin_comment}
          <div class="well"><strong>Staff comment:</strong><br/>{$bug.admin_comment}</div>
          {/if}
        <p >{$bug.description|nl2br}</p>
         <span class="annoucement_date right fs11" style="line-height:13px">
             <img src="http://www.gravatar.com/avatar/{$bug.gravatar}?s=30" class="left" style="margin:0px 10px"/> Added {$bug.date_created|dateformat:$date_format} <br/> by <b>{$bug.firstname}</b></span>
         <div class="clear"></div>
         
       
    </div>
</div>