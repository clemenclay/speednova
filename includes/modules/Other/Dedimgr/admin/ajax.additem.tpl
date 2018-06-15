<div id="formcontainer">
    <div id="formloader" style="background:#fff;padding:10px;"> <form action="" method="post" id="addform">

            <input type="hidden" name="position" value="{$position}" />
            <input type="hidden" name="location" value="{$location}" id="location"/>
            <input type="hidden" name="rack_id" value="{$rack_id}" />
            <input type="hidden" name="item_id" value="new" />

            <h3 style="margin:0px;">Create new device to rack</h3>

            <div class="form clearfix" style="margin:10px 0px">
                <label class="nodescr">New item category:</label>
                <select name="category_id"  onchange="loadSubitems(this)" class="w250">>
                    <option value="0">Select category to add item from</option>
                    {foreach from=$categories item=c}
                        <option value="{$c.id}">{$c.name}</option>
                    {/foreach}
                </select>
                <div id="updater1"></div>
            </div>
        </form>
    </div>

    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span id="savechanges" style="display:none">
                <span class="bcontainer " ><a class="new_control greenbtn" href="#" onclick="createRackEntry();
                            return false"><span><b>Add new device</b></span></a></span>
                <span >{$lang.Or}</span>
            </span>
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                            return false;"><span>{$lang.Close}</span></a></span>
        </div>
        <div class="clear"></div>
    </div>

</div>
{literal}
    <script>
        function createRackEntry() {

            $('.spinner').show();
            $.post('index.php?cmd=module&module=dedimgr&do=itemeditor&x=' + Math.random(), $('#addform').serializeObject(), function(data){
                data = parse_response(data)
                if(data.length)
                    $('#formcontainer').html(data);
                else
                    $(document).trigger('close.facebox');
            })
            return false;

        }

        function loadSubitems(el) {
            $('#savechanges').hide();
            var v = $(el).val();
            if (v == '0')
                return false;
            $('#updater1').addLoader();
            ajax_update('?cmd=module&do=inventory&subdo=category', {module: $('#module_id').val(), category_id: v, location: $('#location').val()}, '#updater1');
            return false;
        }
        
        function loadItemEditor(el) {
            $('#savechanges').hide();
            var v = $(el).val();
            if (v == '0')
                return false;

            $('#savechanges').show();
            return false;
        }
    </script>
{/literal}