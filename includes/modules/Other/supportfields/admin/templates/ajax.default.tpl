
{if $do=='fconfig'}

{$configform}
 <table width="100%" cellspacing="0" cellpadding="3" border="0">
     <tr>
                <td width="160"><b>Default value</b></td>
                <td>
                    <input id="expression" type="text" name="f[defaultval]" id="expression" value="{$field.configuration.defaultval}"  style="margin-bottom:2px;width:300px;" />
                </td>
            </tr>
            <tr>
            <td width="160"><b>Required</b></td>
                <td>
                    <input type="checkbox" name="f[required]" value="1" {if $field.configuration.required}checked="checked"{/if}/>
                </td>
            </tr>
             <tr>
                <td width="160"><b>Validation pattern</b><br><small>RegEx to validate this field with</small></td>
                <td>
                    <input id="expression" type="text" name="f[expression]" id="expression" value="{$field.configuration.expression}"  style="margin-bottom:2px;width:300px;" />
                                <div class="clear"></div>
                                <span class="left">
                                    <a href="#" class="editbtn" onclick="$(this).hide();$('#premade_pattern').show();return false;">Premade patterns</a>
                                </span><div class="clear"></div>
                                <select name="premade_pattern" id="premade_pattern" onchange="$('#expression').val($(this).val());" class="w250" style="display:none">
                                    <option value="">---select---</option>
                                    <option value="{literal}/^\d{1,3}$/{/literal}">Number 1-3 digits in length</option>
                                    <option value="{literal}/^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/](19|20)\d\d$/{/literal}">Date in mm/dd/yyyy</option>
                                    <option value="{literal}/^(19|20)\d\d[\/](0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])$/{/literal}">Date in yyyy/mm/dd</option>
                                    <option value="{literal}/^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/](19|20)\d\d$/{/literal}">Date in dd/mm/yyyy</option>
                                    <option value="{literal}/^((\(\d{3}\) ?)|(\d{3}[-\s]))?\d{3}[-\s]\d{4}$/{/literal}">US Phone number</option>
                                    <option value="{literal}/^\d{5}([\-]\d{4}){0,1}$/{/literal}">US Zip Code</option>
                                </select>
                </td>
            </tr>
        </table>
{elseif $do=='newfield' || $do=='field'}
<div class="nicerblu">

<form action="" method="post">
{if $do=='field'}
    <input type="hidden" name="make" value="edit"/>
    <input type="hidden" name="fid" value="{$field.id}"/>
{else}
    <input type="hidden" name="make" value="addnew"/>
{/if}
    <div id="ftype" {if $do=='field'}style="display:none"{/if}>
        {if $do=='field'}<h1>Edit field {$field.name}</h1>{else}<h1>Add new field 1/4</h1>{/if}
    <table border=0 cellspacing=0 cellpadding=3 width="100%">
    <tr>
        <td width="160"><strong>Pick your field type:</strong></td>
        <td >{foreach from=$types item=type key=k}
    <input type="radio" name="type" value="{$k}" onclick="loadfconf('{$k}');"/> {$type}<br />
    {/foreach}</td>
    </tr>
    <tr><td colspan="2" align="center"><a class=" menuitm disabled" href="#" onclick="return loadfconf();">
                <span><b>Continue</b></span>
            </a>
        </td></tr>
    
</table>
    </div>
    <div id="configform"  {if $do!='field'}style="display:none"{/if}>
{if $do=='field'}<h1>Edit field {$field.name} 1/3</h1>{else}<h1>Add new field 2/4</h1>{/if}
<table border=0 cellspacing=0 cellpadding=3  width="100%">
    <tr>
        <td width="160"><b>Name</b></td>
        <td ><input name="name" value="{$field.name}" class="inp" onkeyup="return loadept(this);"/></td>
    </tr>
    <tr>
        <td width="160" valign="top"><b>Description</b></td>
        <td ><textarea name="description" cols=60 rows=3 class="inp">{$field.description}</textarea></td>
    </tr>
</table>
    <div id="fconfiguration">
        {if $do=='field' }
        {$field.configform}
        {/if}
        <table width="100%" cellspacing="0" cellpadding="3" border="0">
               <tr>
                <td width="160"><b>Default value</b></td>
                <td>
                    <input id="expression" type="text" name="f[defaultval]" id="expression" value="{$field.configuration.defaultval}"  style="margin-bottom:2px;width:300px;" />
                </td>
            </tr>
            <tr>
            <td width="160"><b>Required</b></td>
                <td>
                    <input type="checkbox" name="f[required]" value="1" {if $field.configuration.required}checked="checked"{/if}/>
                </td>
            </tr>
            <tr>
                <td width="160"><b>Validation pattern</b><br><small>RegEx to validate this field with</small></td>
                <td>
                    <input id="expression" type="text" name="f[expression]" id="expression" value="{$field.configuration.expression}"  style="margin-bottom:2px;width:300px;" />
                                <div class="clear"></div>
                                <span class="left">
                                    <a href="#" class="editbtn" onclick="$(this).hide();$('#premade_pattern').show();return false;">Premade patterns</a>
                                </span><div class="clear"></div>
                                <select name="premade_pattern" id="premade_pattern" onchange="$('#expression').val($(this).val());" class="w250" style="display:none">
                                    <option value="">---select---</option>
                                    <option value="{literal}/^\d{1,3}$/{/literal}">Number 1-3 digits in length</option>
                                    <option value="{literal}/^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/](19|20)\d\d$/{/literal}">Date in mm/dd/yyyy</option>
                                    <option value="{literal}/^(19|20)\d\d[\/](0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])$/{/literal}">Date in yyyy/mm/dd</option>
                                    <option value="{literal}/^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/](19|20)\d\d$/{/literal}">Date in dd/mm/yyyy</option>
                                    <option value="{literal}/^((\(\d{3}\) ?)|(\d{3}[-\s]))?\d{3}[-\s]\d{4}$/{/literal}">US Phone number</option>
                                    <option value="{literal}/^\d{5}([\-]\d{4}){0,1}$/{/literal}">US Zip Code</option>
                                </select>
                </td>
            </tr>
        </table>
    </div>
      <center><br/><a class=" {if $do=='field'}new_control greenbtn{else}menuitm disabled{/if}" href="#" onclick="if($(this).hasClass('disabled'))return false;$('#configform').slideUp();$('#fdepts').slideDown();return false;">
                <span><b>Continue</b></span>
            </a>  </center>
    </div>
    <div id="fdepts" style="display:none">
        {if $do=='field'}<h1>Edit field {$field.name} 2/3</h1>{else}<h1>Add new field 3/4</h1>{/if}
<table border=0 cellspacing=0 cellpadding=3  width="100%">
    <tr>
        <td width="160"><b>Department</b></td>
        <td >
            {foreach from=$depts item=dept}
            <input type="checkbox" value="0" id="dept_{$dept.id}" name="dept[{$dept.id}][0]" onclick="shh(this)" class="deptsin" {if $field.depts[$dept.id]}checked="checked"{/if}> {$dept.name}<br/>
            <div class="fs11" style="padding:5px 0px 5px 20px;{if !$field.depts[$dept.id]}display:none{/if}">
               <input type="checkbox" value="1"  name="dept[{$dept.id}][1]" class="deptsin2"  onclick="shh(this)" {if $field.depts[$dept.id] && ($field.depts[$dept.id] |1)}checked="checked"{/if}> New Ticket <br/>
               <input type="checkbox" value="2"  name="dept[{$dept.id}][2]"  class="deptsin2" onclick="shh(this)" {if $field.depts[$dept.id] && ($field.depts[$dept.id] |2)}checked="checked"{/if}> Answered Ticket
            </div>
            {/foreach}
        </td>
    </tr>

</table>
         <center><br/>
             <a class="{if $do!='field' } menuitm disabled{else}new_control greenbtn{/if}" href="#" onclick="if($(this).hasClass('disabled'))return false;$('#fdepts').slideUp();$('#fpostaction').slideDown();return false;">
                <span><b>Continue</b></span>
            </a>  </center>
    </div>
     <div id="fpostaction" style="display:none">
         {if $do=='field'}<h1>Edit field {$field.name} 3/3</h1>{else}<h1>Add new field 4/4</h1>{/if}
<table border=0 cellspacing=0 cellpadding=3  width="100%">
    <tr>
        <td width="160"><b>Post action</b></td>
        <td >
         
            <input type="radio" value="ticket" name="action" checked="checked" {if !$field || $field.action=='ticket'}checked="checked"{/if}> Store in ticket<br />
            <input type="radio" value="client" name="action" {if $field.action=='client'}checked="checked"{/if}> Store in client profile<br />
            
          
        </td>
    </tr>

</table>
         <center>
            <input type="submit" class="submitme" style="font-weight:bold" value="{if $do=='field'}{$lang.savechanges}{else}Add new field{/if}"/>
         </center>
    </div>
</form>
</div>
<script type="text/javascript">
{literal}
    function shh(el) {
        if($(el).is(':checked') && $(el).attr('id')) {
            $(el).next().next('div').show().find('input').attr('checked','checked');
        } else {
            $(el).next().next('div').hide().find('input').removeAttr('checked');
         }

        if($('#fdepts .deptsin2:checked').length) {
            $('#fdepts .menuitm').attr('class',"new_control greenbtn");
        } else {
           $('#fdepts .new_control').attr('class',"menuitm disabled");
        }

    }
    function loadept(el) {
        if($(el).val()!='')
          $('#configform .menuitm').attr('class',"new_control greenbtn");
        else {
          $('#configform .new_control').attr('class',"menuitm disabled");
        }
    }
  function loadfconf(field) {
      if(field) {
        $('#ftype .menuitm').attr('class',"new_control greenbtn");
    } else {
        var f=$('#ftype input:checked');
        if(f.length<1)
            return false;

$('#ftype').slideUp();
      $('#configform').slideDown();
    ajax_update("?cmd=module&module={/literal}{$moduleid}{literal}&do=fconfig",{type:f.val()},"#fconfiguration");

    }
return false;
    }
{/literal}
</script>
{elseif $do=='getjs' && $fields}{literal}
(function ($) {
    var wrapper = $("<div></div>").attr('id','asker_fields').css({
        padding:5,
        margin:10,
        width:'98%',
        background:'#FFF890'
    });
{/literal}
    {if $place=='client'}
    {foreach from=$fields item=field}
        wrapper.append({$field.html});
    {/foreach}
{literal}

    $('#AdmNotes').after(wrapper);
{/literal}
    {elseif $place=='newadminticket'}
        wrapper.append({$field.html}).css("width","95%");
        
    {foreach from=$fields item=field}
        wrapper.append({$field.html});
    {/foreach}
        $('#replyarea').parents('td').eq(0).append(wrapper);
        
        
    {elseif $place=='ticket'}
    {foreach from=$fields item=field}
        wrapper.append({$field.html});
    {/foreach}
{literal}
   wrapper.before('<div style="clear:both"></div>');
   wrapper.css('clear','both');
   $('#client_tab').after(wrapper);
{/literal}

    {/if}
{literal}
wrapper.after("<div class='clear'></div>");
})(jQuery);
{/literal}{/if}