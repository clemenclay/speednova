<div class="wbox">
    <div class="wbox_header">

    </div>
    <div class="wbox_content"> {if $cwidget.template}
            {include file=$cwidget.template}
        {elseif $cwidget.html}
            {$cwidget.html}
        {/if}</div>
</div>