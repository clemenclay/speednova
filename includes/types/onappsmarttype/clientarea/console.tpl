<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.Console}</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {if $newconsole}
    {$newconsole}
    {* If you want to customize applet size, remove {$newconsole} and replace it with template below.
    {*
    <applet archive="{$console.archive}" codebase="{$console.archive}" code="VncViewer.class" height="560" width="700">
        <param name="PORT" value="{$console.port}" />
        <param name="REMOTEKEY" value="{$console.remote_key}" />
        <param name="REMOTE KEY" value="{$console.remote_key}" />
        <param name="REMOTE_KEY" value="{$console.remote_key}" />
        <param name="PASSWORD" value="{$console.password}" />
        <param name="Scaling factor" VALUE=87 />
    </applet>
    *}
    {else}
    <center><br><br><br><b>{$lang.consoleunavailable}</b><br><br><br><br></center>
    {/if}
</div>