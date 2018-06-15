{if $do=='st'}

{else}

 {if $fields.active}
        <table width="100%" cellspacing="0" cellpadding="3" class="whitetable">
		<tbody><tr>
			<th>Field name</th>
			<th>Department</th>
			<th>Post action</th>
			<th width="20"></th>
			<th width="20"></th>
		</tr>

                {foreach from=$fields.active item=field  name=fr}
		<tr class="{if $smarty.foreach.fr.index%2==0}even{/if} havecontrols">
			<td style="padding-left: 10px;">{$field.name}</td>
			<td>{foreach from=$depts item=dept}{if $field.depts[$dept.id]}{$dept.name}, {/if}{/foreach}</td>
			<td>{if $field.action=='ticket'}Store in ticket{else}Store in Client Profile{/if}</td>
			<td><a onclick="{literal}$.facebox({ ajax: $(this).attr('href')}); return false;{/literal}" class="editbtn" href="?cmd=module&module={$moduleid}&do=field&fid={$field.id}">Edit</a></td>
			<td class="lastitm"><a onclick="return confirm('Are you sure you want to remove this field?');" class="delbtn" href="?cmd=module&module={$moduleid}&do=deletefield&fid={$field.id}">Delete</a></td>
		</tr>
                {/foreach}

                <tr>
			<th colspan="5">
                            <a  onclick="{literal}$.facebox({ ajax: $(this).attr('href')}); return false;{/literal}"
                            class="editbtn" href="?cmd=module&module={$moduleid}&do=newfield" class="editbtn">Create new field</a>
                            {if $fields.predefined}&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="editbtn" onclick="$('#addnewgroup_btn').toggle();return false">Use predefined field</a>{/if}
                        </th>
		</tr>
                </tbody>
        </table>
    {/if}

{if $fields.predefined || !$fields.active}
    <div class="blank_state blank_news" id="addnewgroup_btn" {if $fields.active}style="display:none"{/if}>
			<div class="blank_info">
				<h1>Predefined support fields</h1>
                                Activate predefined support field, a great way to gather additional information when new ticket is created. 
				<div class="clear"></div>

                                {foreach from=$fields.predefined item=field}
			 <a class="new_add new_menu" onclick="{literal}$.facebox({ ajax: $(this).attr('href')}); return false;{/literal}"
                            class="editbtn" href="?cmd=module&module={$moduleid}&do=field&fid={$field.id}"   style="margin-top:10px">
			<span>{$field.name}</span></a>
                                {/foreach}
                                <div class="clear" ></div><div style="margin-top:10px;">Or</div><div class="clear"></div>

                                 <a class="new_add new_menu" onclick="{literal}$.facebox({ ajax: $(this).attr('href')}); return false;{/literal}"
                            class="editbtn" href="?cmd=module&module={$moduleid}&do=newfield"   style="margin-top:10px">
			<span>Create new field</span></a>
		<div class="clear"></div>

		</div>
	</div>

{/if}
<script type="text/javascript" src="{$template_dir}js/facebox/facebox.js"></script>
<link rel="stylesheet" href="{$template_dir}js/facebox/facebox.css" type="text/css" />
{/if}