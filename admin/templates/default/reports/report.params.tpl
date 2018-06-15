<strong>Parameters:</strong>
<div class="p5"> {if $report.params}
        <table border="0" cellspacing="0" cellpadding="5" width="100%">
            {foreach from=$report.params item=pr key=kr}
                <tr>
                    <td width="160"><b>{if $defaults.$kr.name}{$defaults.$kr.name}{else}{$kr}{/if}</b>
                        {if $kr==':date_bottom' || $kr==':date_top'}
                            <a class="vtip_description" title="You can use regular date in <b>YYYY-mm-dd</b> format, or variables:
                                             <br/><b>current-month-start</b> - first day of current month
                                             <br/><b>current-month-end</b> - last day of current month
                                             <br/><b>previous-month-start</b> - first day of previous month
                                             <br/><b>previous-month-end</b> - last day of current month
                                             <br/><b>current-year-start</b> - first day of current year
                                             <br/><b>current-year-end</b> - last day of current year
                                             <br/><b>previous-year-start</b> - first day of previous year
                                             <br/><b>previous-year-end</b> - last day of previous year
                                             "></a>
                        {/if}
                    </td>
                    <td>
                        {if $defaults.$kr.type=='date'}
                            <input name="params[{$kr}]" class="haspicker" value="{$defaults.$kr.value}" />
                        {else}
                            <input name="params[{$kr}]"  value="" />

                        {/if}
                    </td>
                </tr>
            {/foreach}
        </table>
        <div class="clear"></div>  {else}<em>none</em>  {/if}

</div>
<strong>Conditions: {if !$report.state.conditions}<a href="#" onclick="$(this).hide();$('#conditions').slideDown();return false;">Click here to add</a>{/if}</strong>
<div class="p5" id="conditions" {if !$report.state.conditions}style="display:none"{/if}>

    <table border="0" cellspacing="0" cellpadding="3" id="trtable">
        <tr>
            <td width="120">Column:</td>
            <td width="70">Operator:</td>
            <td width="120">Value:</td>
            <td width="14"></td>
        </tr>

        {if !$report.state.conditions}
            <tr id="tr0">
                <td ><select name="conditions[0][column]" class="columner inp">
                        <option value="">Select column</option>
                        {foreach from=$report.default_columns item=column}
                            <option value="{$column}">{$column}</option>
                        {/foreach}
                    </select></td>
                <td ><select name="conditions[0][operator]" class="inp">
                        <option value=">">Bigger than &gt;</option>
                        <option value="<">Less than &lt;</option>
                        <option value="=">Equals =</option>
                        <option value="!=">Other than !=</option>
                    </select></td>
                <td ><input type="text" name="conditions[0][constant]" value="" class="inp" /></td>
                <td><a onclick="tr_remove_row(this); return false" class="rembtn" href="#">Remove</a></td>
            </tr>
        {else}
            {foreach from=$report.state.conditions key=k item=c}
                <tr id="tr{$k}">
                    <td ><select name="conditions[{$k}][column]" class="columner inp">
                            <option value="">Select column</option>
                            {foreach from=$report.default_columns item=column}
                                <option value="{$column}" {if $c.column==$column}selected="selected"{/if}>{$column}</option>
                            {/foreach}
                        </select></td>
                    <td ><select name="conditions[{$k}][operator]" class="inp">
                            <option value=">" {if $c.operator==">"}selected="selected"{/if}>Bigger than &gt;</option>
                            <option value="<" {if $c.operator=="<"}selected="selected"{/if}>Less than &lt;</option>
                            <option value="=" {if $c.operator=="="}selected="selected"{/if}>Equals =</option>
                            <option value="!=" {if $c.operator=="!="}selected="selected"{/if}>Other than !=</option>
                        </select></td>
                    <td ><input type="text" name="conditions[{$k}][constant]" value="{$c.constant}" class="inp" /></td>
                    <td><a onclick="tr_remove_row(this); return false" class="rembtn" href="#">Remove</a></td>
                </tr>
            {/foreach}
        {/if}

    </table>
    <a href="#" class="editbtn" onclick="tr_add_row(); return false;">Add new condition</a>

</div>
{literal}
<script>
    function tr_remove_row(el) {
        if ($('#trtable tr').length>2) {
            $(el).parents('tr').eq(0).remove();
        } else {
            $(el).parents('tr').eq(0).find('input, select').val('');
        }

    }
    function tr_add_row() {
        var t = $('#trtable tr:last');
        if(!t.attr('id')) {
            return false;
        }
        var prev = t.attr('id').replace(/[^0-9]/g,'');
        next = parseInt(prev)+1;
        var nw = t.clone();
        nw.attr('id','tr'+next);
        nw.find('input, select').each(function(){
            var n =$(this).attr('name');
            n=n.replace("["+prev+"]","["+next+"]");
            $(this).attr('name',n).val('');
        });

        $('#trtable').append(nw);
        return false;
    }
    $(function() {
        $( "#sortablea" ).sortable({
            connectWith: ['#sortableb'],
            update: sortablestop
        }).disableSelection();
        $( "#sortableb" ).sortable({
            connectWith: ['#sortablea']
        }).disableSelection();


    });
    function sortablestop(event,ui) {
        $('#sortableb input').attr('name','export[]');
        $('#sortablea input').attr('name','columns[]');


        $('#sortablea input').each(function(){
            var v = $(this).val();
            if($('#trtable tr select.columner option:selected[value="'+v+'"]').length) {
                $('#trtable tr select.columner option:selected[value="'+v+'"]').parent().parent().parent().find('a.rembtn').click();
            }
            $('#trtable tr select.columner option[value="'+v+'"]').remove();
        });
        $('#sortableb input').each(function(){
            var v = $(this).val();
            if($('#trtable tr select.columner option[value="'+v+'"]').length<1) {
                $('#trtable tr select.columner').append('<option value="'+v+'">'+v+'</option>');
            }
        });

    }
    function prswitch(el) {
        $('#subwiz_opt span').removeClass('active');
        $(el).parent().addClass('active');
    }

</script>{/literal}