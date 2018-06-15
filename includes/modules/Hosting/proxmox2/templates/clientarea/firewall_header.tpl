{literal}
    <style>
        #firewall-form .r_edit{display: none;}
        #firewall-form td{line-height: 28px;;}
    </style>
{/literal}
<ul class="nav nav-tabs">
    <li {if $vpsdo==firewall}class="active"{/if}>
        <a href="{$service_url}&vpsdo=firewall&vpsid={$vpsid}">Rules</a>
    </li>
    <li {if $vpsdo==firewalloptions}class="active"{/if}>
        <a href="{$service_url}&vpsdo=firewalloptions&vpsid={$vpsid}">Options</a>
    </li>
    <li {if $vpsdo==firewalllogs}class="active"{/if}>
        <a href="{$service_url}&vpsdo=firewalllogs&vpsid={$vpsid}">Logs</a>
    </li>
</ul>