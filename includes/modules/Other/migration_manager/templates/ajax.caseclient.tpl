<h3>Related client/service</h3>


<label class="nodescr">Related client</label>
<select name="related_client_id" onchange="changeClient($(this).val())">
    <option value="0">None</option>
    {foreach from=$clients item=d key=k}
        <option value="{$d.id}" {if $d.id==$case.related_client_id}selected="selected"{/if}>#{$d.id} {$d.firstname} {$d.lastname}</option>
        {/foreach}
</select>
<div class="clear"></div>

<div id="clientcontainer" {if !$case.related_client_id}style="display:none"{/if}>
{include file='ajax.clientservices.tpl'}
</div>

{literal}
<script>
    function changeClient(id) {
        if(!id) {
            $('#clientcontainer').hide();
            return;
         }
            
            $('#clientcontainer').html('').show(); 
                ajax_update('?cmd=migration_manager&action=listservices&related_client_id='+id,'','#clientcontainer');
    }
    </script>
    {/literal}