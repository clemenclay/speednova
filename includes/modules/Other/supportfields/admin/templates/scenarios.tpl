{include file='navigation.tpl'}
<div class="blank_state blank_news" id="addnewgroup_btn" {if $scenarios}style="display:none"{/if}>
			<div class="blank_info">
				<h1>Support Forms</h1>
                  When creating form you can assign it to support department, and have your customer answer additional questions before submitting new ticket.
				<div class="clear"></div>
             <a class="new_add new_menu"  class="editbtn" href="?cmd=supportfields&action=newscenario"   style="margin-top:10px">
			<span>Create new form</span></a>
		<div class="clear"></div>

		</div>
</div>

{if $scenarios}
    <div style="padding:10px;">
    <h3>Available forms:</h3>

      <form id="serializeit">
        <ul id="grab-sorter" style="border:solid 1px #ddd;border-bottom:none;">
            {foreach from=$scenarios item=field name=fff}<li style="background:#ffffff">
                    <div style="border-bottom:solid 1px #ddd;">
                        <table  cellpadding="0" cellspacing="0"  width="100%" >
                            <tbody> <tr class="havecontrols">
                                        <td width="90" >
                                            <div style="padding:10px 5px;">
                                                <a class="menuitm menuf" style="width:14px;" href="?cmd=supportfields&action=editscenario&id={$field.id}"  title="edit"  ><span class="editsth"></span></a><!--
                                                --><a class="menuitm menul" title="delete" href="?cmd=supportfields&action=deletescenario&id={$field.id}&security_token={$security_token}" onclick="return confirm('Are you sure you wish to delete this?');"><span class="delsth"></span></a>
                                            </div>
                                        </td>
                                        <td   >
                                            <input type="hidden" name="sort[]" value="{$field.id}" />
                                            <a href="?cmd=supportfields&action=scenario&id={$field.id}"><strong>{$field.name}</strong></a>
                                            </td>
                                        <td align='right'>  Department:  {$field.deptname}</td>
                                        <td width='100'>   </td>
                                </tr></tbody>
                        </table>
                    </div>
                </li>	{/foreach}
            </ul>
            {securitytoken}
        </form>
        
        <br/><br/>
        <b><a href="?cmd=supportfields&action=newscenario">Add new form</a></b>
            </div>
{/if}