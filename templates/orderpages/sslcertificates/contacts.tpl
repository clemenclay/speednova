<table class="checker" border="0" cellpadding="3" cellspacing="0" width="100%">
    <tr>
        <td><strong>{$lang.en_jobtitle}</strong></td>
        <td><input name="{$type}[JobTitle]"   class="styled span3" value="{if $customdata[$type].JobTitle}{$customdata[$type].JobTitle}{/if}"/></td>
    </tr>
    <tr>
        <td><strong>{$lang.firstname}</strong></td>
        <td><input name="{$type}[FName]"  value="{if $customdata[$type].FName}{$customdata[$type].FName}{else}{$clientdata.firstname}{/if}" class="styled span3"/></td>
    </tr>
    <tr>
        <td><strong>{$lang.lastname}</strong></td>
        <td><input name="{$type}[LName]"  value="{if $customdata[$type].LName}{$customdata[$type].LName}{else}{$clientdata.lastname}{/if}" class="styled span3"/></td>
    </tr>
    <tr>
        <td><strong>{$lang.address}</strong></td>
        <td><input name="{$type}[Address1]" value="{if $customdata[$type].Address1}{$customdata[$type].Address1}{else}{$clientdata.address1}{/if}" class="styled span3"/></td>
    </tr>
    <tr>
        <td>{$lang.address2}</td>
        <td><input name="{$type}[Address2]"  value="{if $customdata[$type].Address2}{$customdata[$type].Address2}{else}{$clientdata.address2}{/if}" class="styled span3"/></td>
    </tr>
    <tr>
        <td><strong>{$lang.city}</strong></td>
        <td><input name="{$type}[City]" value="{if $customdata[$type].City}{$customdata[$type].City}{else}{$clientdata.city}{/if}" class="styled span3"/></td>
    </tr>
    <tr>
        <td><strong>{$lang.state} / {$lang.postcode}</strong></td>
        <td>
            <div class="form-inline">
                <input class="styled span2" name="admin[State]"  
                       value="{if $customdata[$type].State}{$customdata[$type].State}{else}{$clientdata.state}{/if}" /> 
                / 
                <input class="styled span1" name="admin[PostalCode]"  
                       value="{if $customdata[$type].PostalCode}{$customdata[$type].PostalCode}{else}{$clientdata.postcode}{/if}" size="6"/>
                <input type="hidden" name="admin[StateProvinceChoice]" value="S" />
            </div>
        </td>
    </tr>
    <tr>
        <td><strong>{$lang.country}</strong></td>
        <td>
            <select name="{$type}[Country]" class="span3">
                {foreach from=$countries key=k item=v}
                    <option value="{$k}" {if $customdata[$type].Country && $customdata[$type].Country==$k}selected="selected"{elseif !$customdata[$type].Country && $clientdata.country==$k}selected="selected"{/if}>
                        {$v}
                    </option>
                {/foreach}
            </select>
        </td>
    </tr>
    <tr>
        <td><strong>{$lang.email}</strong></td>
        <td>
            <input  name="{$type}[EmailAddress]" class="styled span3" 
                    value="{if $customdata[$type].EmailAddress}{$customdata[$type].EmailAddress}{else}{$clientdata.email}{/if}"/>
        </td>
    </tr>
    <tr>
        <td><strong>{$lang.phone}</strong></td>
        <td class="form-inline">
            <input size="2" name="{$type}[PreFix]" class="styled span1" 
                   value="{if $customdata[$type].PreFix}{$customdata[$type].PreFix}{/if}"/>
            . 
            <input name="admin[Phone]"  
                   value="{if $customdata[$type].Phone}{$customdata[$type].Phone}{else}{$clientdata.phonenumber}{/if}" class="styled span2"/>
        </td>
    </tr>
    <tr>
        <td>Fax</td>
        <td class="form-inline">
            <input size="2" name="{$type}[FPreFix]" class="styled span1" 
                   value="{if $customdata[$type].FPreFix}{$customdata[$type].FPreFix}{/if}" />
            . 
            <input name="admin[Fax]"  
                   value="{if $customdata[$type].Fax}{$customdata[$type].Fax}{/if}" class="styled span2"/>
        </td>
    </tr>
</table>