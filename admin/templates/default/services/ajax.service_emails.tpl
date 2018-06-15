{if !$custom_automation}
    {foreach from=$supported_emails item=em key=event name=llp}
        <tr {if $smarty.foreach.llp.index%2==0}class="odd"{/if}>
            <td width="200" align="right">
                <strong>
                    {if $lang.$event}{$lang.$event}
                    {elseif $em.name}{$em.name}
                    {else}{$event}
                    {/if}
                </strong>
                {if $em.description}
                    <a class="vtip_description" title="{$em.description}"></a>
                {/if}
            </td>
            <td>
                <div class="editor-container" id="{$event}_msg">
                    <div class="no org-content " >
                        <span class=" iseditable">
                            <em>
                                {if $product.emails.$event =='0' || !$product.emails.$event }
                                    {$lang.none}
                                {else}
                                    {foreach from=$emails.All item=emailtpl}
                                        {if $product.emails.$event==$emailtpl.id}{$emailtpl.tplname}
                                        {/if}
                                    {/foreach}
                                {/if}
                            </em>
                            <a href="#" class="editbtn  ">{$lang.Change}</a>
                        </span>
                        {if $product.emails.$event}
                            <a href="?cmd=emailtemplates&action=edit&id={$product.emails.$event}" 
                               target="blank" class="editbtn directlink editgray orspace">{$lang.Edit}</a>
                            <a href="?cmd=emailtemplates&action=preview&template_id={$product.emails.$event}" 
                               target="blank" class="editbtn directlink editgray orspace">{$lang.Preview}</a>
                        {/if}
                    </div>
                    <div class="ex editor" style="display:none">
                        <select name="emails[{$event}]" class="inp">
                            <option value="0">{$lang.none}</option> 
                            {foreach from=$emails.All item=emailtpl} 
                                <option value="{$emailtpl.id}" {if $product.emails.$event ==$emailtpl.id}selected="selected" {/if}>
                                    {$emailtpl.tplname}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </td>
        </tr>
    {/foreach}
{else}
    <tr >
        <td colspan="2">
            {include file=$custom_automation}
        </td>
    </tr>
{/if}