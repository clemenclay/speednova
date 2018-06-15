{include file='navigation.tpl'}

<div class="blank_state blank_news" id="addnewgroup_btn" {if $steps}style="display:none"{/if}>
			<div class="blank_info">
				<h1>Form steps</h1>
                               Each form consist of number of steps you can define.
				<div class="clear"></div>
                               <a class="new_add new_menu"  class="editbtn" href="?cmd=supportfields&action=newstep&scenario_id={$scenario.id}"   style="margin-top:10px">
			<span>Create new step</span></a>
		<div class="clear"></div>

		</div>
</div>
                        
{if $steps}
    
    <div style="padding:10px;">
    <h3>Current steps:</h3>
   <form id="serializeit">
        <ul id="grab-sorter" style="border:solid 1px #ddd;border-bottom:none;">
            {foreach from=$steps item=field name=fff}<li style="background:#ffffff">
                    <div style="border-bottom:solid 1px #ddd;">
                        <table  cellpadding="0" cellspacing="0"  width="100%" >
                            <tbody> <tr class="havecontrols">
                                        <td width="90" >
                                            <div style="padding:10px 5px;">
                                                <a class="sorter-ha menuitm menuf" style="width:14px;margin-left:4px;" onclick="return false" href="#"><span title="move" class="movesth">&nbsp;</span></a><!--
                                                --><a class="menuitm menuc" style="width:14px;" href="?cmd=supportfields&action=editstep&id={$field.id}"  title="edit"  ><span class="editsth"></span></a><!--
                                                --><a class="menuitm menul" title="delete" href="?cmd=supportfields&action=deletestep&id={$field.id}&security_token={$security_token}" onclick="return confirm('Are you sure you wish to delete this flavor?');"><span class="delsth"></span></a>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="hidden" name="sort[]" value="{$field.id}" />
                                            <a href="?cmd=supportfields&action=step&id={$field.id}"><b>{$field.name}</b></a>
                                        </td>
                                        <td align='right'>   </td>
                                        <td width='100'>   </td>
                                </tr></tbody>
                        </table>
                    </div>
                </li>	{/foreach}
            </ul>
            {securitytoken}
        </form>
     <br/><br/>
        <b><a href="?cmd=supportfields&action=newstep&scenario_id={$scenario.id}">Add new step</a></b>
</div>
            <script type="text/javascript" src="{$template_dir}js/jquery.dragsort-0.3.10.min.js"></script>

{literal}
<script>
    $(document).ready(function(){
         $("#grab-sorter").dragsort({ dragSelector: "a.sorter-ha", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
     
    });
         
  function saveOrder() {
		var sorts = $('#serializeit').serialize();
		ajax_update('?cmd=supportfields&action=sortsteps&scenario_id={/literal}{$scenario.id}{literal}&'+sorts,{});
		};
    </script>
{/literal}                
{/if}
    