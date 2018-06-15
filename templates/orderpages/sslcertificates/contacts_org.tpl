<table class="checker org-info" width="100%" cellpadding="6" cellspacing="0">
    <tr>
        <td class="first-td"><strong>{$lang.en_orgname}</strong></td>
        <td><input name="organization[name]" class="styled tipsing span3" value="{$customdata.organization.name}" title="{$lang.en_tip1}"/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.en_orgunit}</strong></td>
        <td><input name="organization[unit]" class="styled tipsing span3" value="{$customdata.organization.unit}" title="{$lang.en_tip2}"/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.address}</strong></td>
        <td><input name="organization[address1]" class="styled tipsing span3" value="{$customdata.organization.address1}" title="{$lang.en_tip3}"/></td>
    </tr>
    <tr>
        <td class="first-td">{$lang.address2}</td>
        <td><input name="organization[address2]" class="styled tipsing span3" value="{$customdata.organization.address2}" title="{$lang.en_optional}"/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.city}</strong></td>
        <td><input name="organization[locality]" class="styled tipsing span3" value="{$customdata.organization.locality}" title="{$lang.en_tip4}"/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.state}</strong></td>
        <td><input name="organization[state]" class="styled tipsing span3" value="{$customdata.organization.state}" title="{$lang.en_tip5}"/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.postcode}</strong></td>
        <td><input name="organization[postalcode]" class="styled tipsing span3" value="{$customdata.organization.postalcode}" title="{$lang.en_tip6} "/></td>
    </tr>
    <tr>
        <td class="first-td"><strong>{$lang.country}</strong></td>
        <td><select name="organization[country]" class="tipsing span3" title="{$lang.en_tip6} ">
                {foreach from=$countries key=k item=v}
                    <option value="{$k}" {if $customdata.organization.country==$k} selected="selected"{/if}>{$v}</option>
                {/foreach}
            </select>
        </td>
    </tr>
</table>