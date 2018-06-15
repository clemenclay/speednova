<div style="padding:15px">{if !$changelog}
    <h3>No changelog available yet</h3>
 {else}
     {foreach from=$changelog item=c key=k}
     <h3>{$k}:</h3>
     {foreach from=$c item=change}
         {$change}<br/>
         {/foreach}
         
     {/foreach}
     {/if}
         </div>