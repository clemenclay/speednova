 {foreach from=$cst.items item=cit}{if $cit.name}{$cit.name}{/if}
{if $service.showbilling}{if $cit.price>0}( {$cit.price|price:$currency:1:1} ){/if}{/if}<br/>{/foreach}
{if $service.status=='Active' && (($cst.options & 16) || ($cst.options & 32))}
    <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/{if $vpsdo}&vpsdo=upgrade{if $vpsid}&vpsid={$vpsid}{/if}{else}&make=upgrades&upgradetarget=config{/if}" class="lmore">{$lang.UpgradeDowngrade}</a>
{/if}