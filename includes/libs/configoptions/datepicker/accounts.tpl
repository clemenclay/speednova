{foreach from=$c.items item=cit}<input name="custom[{$kk}][{$cit.id}]"  value="{if !$c.data[$cit.id]}{else}{$c.data[$cit.id]|dateformat:$date_format}{/if}" class="haspicker"/> {$cit.name}  {/foreach}