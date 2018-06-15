<div class="blu"><span style="width: 80px; float:left; font-weight: bold">{$lang.Service}:</span><select name="services" onchange="getCriterias(this, 'services')">
        <option value="all">{$lang.allservices}</option>
        <option value="select">{$lang.selectservice}</option>
        <option value="none">None</option>
    </select></div>
<div id="show_services" class="blu" style="display: none;"></div>

<div class="blu" style="margin-top: 5px !important"><span style="width: 80px; float:left; font-weight: bold">{$lang.Server}:</span><select name="servers" onchange="getCriterias(this, 'servers')">
        <option value="all">{$lang.allservers}</option>
        <option value="select">{$lang.selectserver}</option>
        <option value="none">None</option>
    </select></div>
<div id="show_servers" class="blu" style="display: none"></div>

<div class="blu" style="margin-top: 5px !important"><span style="width: 80px; float:left; font-weight: bold">{$lang.Countries}:</span><select name="countries" onchange="getCriterias(this, 'countries')">
        <option value="all">{$lang.allcountries}</option>
        <option value="select">{$lang.selectcountries}</option>
    </select></div>
<div id="show_countries" class="blu" style="display: none"></div>

{literal}
<script>

    function checkAllItems(item, type) {
        var item_class = '.check_' + type;
        if ($(item).attr('checked')) {
            $(item_class).attr('checked', true);
            $(item_class).parent().parent().addClass('checkedRow');
        } else {
            $(item_class).attr('checked', false);
            $(item_class).parent().parent().removeClass('checkedRow');
        }
    }
    function getCriterias(item, type) {
        var show = $(item).val();
        var item_id = '#show_' + type;
        if (show == 'select') {
            $(item_id).show();
            if (!$(item_id).hasClass('shown')) {
                ajax_update('?cmd=clients&action=sendmailcriterias', {type: type}, item_id, false);
                $(item_id).addClass('shown');
            }
        }
        else
            $(item_id).hide();
    }</script>{/literal}