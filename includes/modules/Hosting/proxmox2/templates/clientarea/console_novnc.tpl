

<!DOCTYPE html>
<html>
    <head>
        <title>noVNC - {$vpsdetails.hostname}</title>
        <meta charset="utf-8">
    </head>
    <body style="margin:0px;padding:0px;overflow:hidden">
        <iframe src="https://{$server}:8006/novnc/vncconsole.html?vmid={$vpsdetails.id}{*}
                {*}&port={$console.port}&username={$console.user}&host={$server}{*}
                {*}&console={if $virtualization=='qemu'}kvm{else}{$virtualization}{/if}{*}
                {*}&vmname={$vpsdetails.hostname}&node={$vpsdetails.node}{*}
                {*}&ticket={$pve_token}&csrf={$pve_csrf}" 
                name="vncconsole-frame" 
                style="overflow:hidden;height:100%;width:100%;position:absolute;top:0px;left:0px;right:0px;bottom:0px"
                height="100%" width="100%"
                frameborder="0" allowfullscreen="true" ></iframe>
    </body>
</html>

