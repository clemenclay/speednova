<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.Console} output</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $newconsole}
        <div class="well"><pre>{$newconsole}</pre></div>
    {else}
    <center><br><br><br><b>{$lang.consoleunavailable}</b><br><br><br><br></center>

    {/if}
</div>