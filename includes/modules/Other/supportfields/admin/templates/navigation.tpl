<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li >
                <a  href="?cmd=supportfields"><span>Forms</span></a>
            </li>
            {if $scenario}
                 <li >
                <a  href="?cmd=supportfields&action=scenario&id={$scenario.id}"><span>&raquo; {$scenario.name}</span></a>
            </li>
           {/if}
            {if $step}
                <li >
                    <a  href="?cmd=supportfields&action=step&id={$step.id}"><span>&raquo; {$step.name}</span></a>
                </li>
            {/if}
        </ul>
    </div>
</div>
                {literal}
                    <style>
                        a.menuitm {
                            padding:4px 4px;
                        }
                        </style>
                {/literal}