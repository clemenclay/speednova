var zero_value = '{/literal}{0|price:$currency:false:false}{literal}';

function bindMe() {

    $('#newsetup1').click(function () {
        $(this).hide();
        $('#newsetup').show();
        return false;
    });

    $('#Regular_b .controls .editbtn').click(function () {
        var e = $(this).parent().parent().parent();
        e.find('.e1').hide();
        e.find('.e2').show();
        return false;
    });

    $('#Regular_b .controls .delbtn').click(function () {
        var e = $(this).parent().parent().parent();
        e.find('.e2').hide();
        e.find('.e1').show();
        e.find('input').val(zero_value);
        e.hide();
        var id = e.attr('id').substr(0, 1);
        if ($('#tbpricing select option:visible').length < 1) {
            $('#addpricing').show();
        }

        $('#tbpricing select option[value=' + id + ']').show();
        return false;
    });

    $('#newshelfnav').TabbedMenu({
        elem: '.sectioncontent',
        picker: '.list-1 li',
        aclass: 'active',
        picked: picked.main || 0
    });

    $('#newshelfnav').TabbedMenu({
        elem: '.subm1',
        picker: '.list-1 li',
        picked: picked.main || 0
    });

    $('#components_menu').TabbedMenu({
        elem: '.components_content',
        picker_id: "picked_subtab",
        picker: '.list-3 li',
        picked: picked.sub || 0
    });

    if (typeof latebindme == 'function') {
        latebindme();
    }

    $(document).on('click', '#module_tab_switcher .module_tab_pick', function () {
        var index = $('#module_tab_switcher .module_tab_pick').removeClass('picked').index(this);
        $(this).addClass('picked');

        var tabs = $('#module_config_container .module_config_tab'),
            selected = tabs.eq(index);

        tabs.hide();
        selected.show();

        $('[data-id]', selected).each(function () {
            var self = $(this);
            self.attr('id', self.data('id')).removeAttr('data-id');
        })

        var idConfllicts = $.makeArray(selected.find('[id]').map(function () {
            return $(this).attr('id');
        }));

        tabs.each(function () {
            if (selected.is(this))
                return;
            $('[id]', this).each(function () {
                var self = $(this),
                    id = self.attr('id');
                if (idConfllicts.indexOf(id) >= 0) {
                    //console.log(id)
                    self.attr('data-id', id).removeAttr('id');
                }
            })
        })

        return false;
    });
}

appendLoader('bindMe');

function connectMoreApps(el) {
    var a = '<a class="module_tab_pick" href="">Additional App</a>';
    var current = [];
    $('.modulepicker').each(function (n) {
        current[n] = $(this).val();
    });
    $('#module_tab_switcher').show();
    //ajax request for table
    var length = $('#module_tab_pick_container .module_tab_pick').length;
    $.get('?cmd=services&action=loadextramodule', {k: length, c: current}, function (data) {
        $('#module_config_container').append(data);
        $('#module_tab_pick_container').append(a).find('.module_tab_pick:last').click();
    });
    return false;
}

function addopt() {

    var e = $('#' + $('#tbpricing select').val() + 'pricing');
    e.find('.inp').eq(0).val($('#newprice').val());
    e.find('.inp').eq(1).val($('#newsetup').val());
    e.find('.pricer_setup').html($('#newsetup').val());
    if ($('#newsetup').val() != zero_value)
        e.find('.pricer_setup').parent().parent().show();
    e.find('.pricer').html($('#newprice').val());
    e.show();
    $('#tbpricing select option:selected').hide();
    if ($('#tbpricing select option:visible').length < 1) {

    } else {
        $('#tbpricing select option:visible').eq(0).attr('selected', 'selected');
        $('#addpricing').show();
    }
    $('#tbpricing').hide();
    $('#newprice').val(zero_value);
    $('#newsetup').val(zero_value).hide();
    $('#newsetup1').show();
    return false;
}

function toggle_free1(el) {
    if ($(el).is(':checked')) {
        $('#freedomopt1').show().find('input').removeAttr('checked');
        $('#notldsyet').show();
    } else {
        $('#freedomopt').hide();
        $('#freedomopt1').hide();
        $('#notldsyet').hide();
    }
}

function toggle_free2(el) {
    $('#freedomopt').toggle();
}

function selectalladdons() {
    if ($('#listAlreadyU').length) {
        for (var i = 0; i < $('#listAlreadyU')[0].options.length; i++) {
            $('#listAlreadyU')[0].options[i].selected = true;
        }
    }
}

function addItem(it) {
    var av = it == 'addon' ? '#listAvail' : '#listAvailU';
    var al = it == 'addon' ? '#listAlready' : '#listAlreadyU';
    var selIndex = $(av)[0].selectedIndex;
    if (selIndex < 0)
        return;
    for (var i = $(av)[0].options.length - 1; i >= 0; i--) {
        if ($(av)[0].options[i].selected) {
            $(al)[0].appendChild($(av)[0].options[i]);
        }
    }

    $(av)[0].selectedIndex = -1;
    $(al)[0].selectedIndex = -1;
}

function delItem(it) {
    var av = it == 'addon' ? '#listAvail' : '#listAvailU';
    var al = it == 'addon' ? '#listAlready' : '#listAlreadyU';
    var selIndex = $(al)[0].selectedIndex;
    if (selIndex < 0)
        return;
    for (var i = $(al)[0].options.length - 1; i >= 0; i--) {
        if ($(al)[0].options[i].selected) {
            $(av)[0].appendChild($(al)[0].options[i]);
        }
    }

    $(av)[0].selectedIndex = -1;
    $(al)[0].selectedIndex = -1;
}

function sh(element, showhide) {
    if ($(element).val() != 'text' && $(element).val() != 'checkbox') {
        $('#' + showhide).show();
    } else {
        $('#' + showhide).hide();
    }
}

function removeadd(which) {
    ajax_update('?cmd=services&action=addonseditor', {
        addon_id: which,
        product_id: $('#product_id').val(),
        module: $('#modulepicker').val(),
        make: 'removeconf'
    }, '#addonsditor_content');
    return false;
}
function addadd() {

    var data = $('#addnew_addons select').serialize();
    ajax_update('?cmd=services&action=addonseditor&' + data, {
        product_id: $('#product_id').val(),
        module: $('#modulepicker').val(),
        make: 'addconfig'
    }, '#addonsditor_content');
    return false;
}

function saveProductFull() {
    var confirm = $('.onsave-confirm');
    if (confirm.length) {
        bootbox.confirm(confirm.html(), function (result) {
            if (result)
                $('#productedit').submit();
            return true;
        });
        return false;
    }

    $('#productedit').submit();
    return false;
}

function check_i(element) {
    var td = $(element).parent();
    if ($(element).is(':checked'))
        $(td).find('.config_val').removeAttr('disabled');
    else
        $(td).find('.config_val').attr('disabled', 'disabled');
}

function add_message(gr, id, msg) {
    var sel = $('#' + gr + '_msg select');
    sel.find('option:selected').removeAttr('selected');
    sel.prepend('<option value="' + id + '">' + msg + '</option>').find('option').eq(0).attr('selected', 'selected');
    return false;
}

function check_scat(el, id) {
    if ($(el).is(':checked')) {
        $(el).parent().parent().find('.cc_' + id).attr('checked', 'checked');
    } else {
        $(el).parent().parent().find('.cc_' + id).removeAttr('checked');
    }
}

function uncheck_scat(el, id) {
    if ($(el).is(':checked')) {
    } else {
        $(el).parent().parent().find('.ccc_' + id).removeAttr('checked');
    }
}

function closeCpicker(el) {
    $(el).parent().hide().prev().show();
    var paren = $(el).parents('.serv_picker').eq(0);
    var pick = paren.find('.ui-ddown-default').html();
    if (paren.find('input.elcc:checked').length) {
        pick = '';
        paren.find('input.elcc:checked').each(function (e) {
            pick = pick + $(this).parent().find('span').html() + ', ';
        });
    }

    paren.find('.ui-ddown-default').html(pick);
    return false;
}

if (typeof (getFieldValues) != 'function') {
//function getFieldValues(//http://stackoverflow.com/questions/10069204/function-declarations-inside-if-else-statements
    window.getFieldValues = function (prod_id, el, addserver) {
        var index = $('.module_tab_pick', '#module_tab_pick_container').index($('.module_tab_pick.picked', '#module_tab_pick_container'));
        var fields = $('form#productedit').serialize();
        var add = '';
        if (addserver === true) {
            add = '&saveserver=true';
        } else {
            add = '&getvalues=' + $('.module_config_tab:eq(' + index + ') input.elcc', '#module_config_container').serialize();
        }
        ajax_update('index.php?cmd=services&action=showmodule&id=' + prod_id
            + '' + add
            + '&module=' + $('.module_config_tab:eq(' + index + ') .modulepicker', '#module_config_container').val()
            + '&' + $('.module_config_tab:eq(' + index + ') input.elcc', '#module_config_container').serialize(),
            {fields: fields, k: index}, '#loadable');
        $('.module_config_tab:eq(' + index + ') #getvaluesloader', '#module_config_container').html('<center><img src="ajax-loading2.gif" /></center>');
        return false;
    }
}

function addmultifield(elem, name) {
    $(elem).parent().find('span').append('<input name="options[' + name + '][]" value="" /><br />');
}

function loadMod(el) {
    var self = $(el),
        moduleId = self.val(),
        productId = $('#product_id').val();

    if (moduleId == 'new') {
        self.val(0);
        window.location = '?cmd=managemodules&action=hosting&do=inactive';
        return false;
    }

    var index = $('.modulepicker').index(el);
    var param = {
        action: 'showmodule',
        module: moduleId,
        server_values: {},
        k: index
    };

    var serverForm = $('input, select, textarea', '#prod_serverform');
    param.server_values = serverForm.serializeObject();
    serverForm.prop('disabled', true);

    var target = $('.loadable:eq(' + index + ')', '#module_config_container');
    target.html('<tr><td colspan=2><div style="text-align:center"><img src="ajax-loading.gif" /></div></td></tr>');

    var url = window.location.href.replace(/[&?]?action=[^&]*/, '')

    $.post(url, param, function (data) {
        data = parse_response(data)
        target.html(data.length ? data : '');
    });

    $.post(url, {
        action: 'serviceemails',
        module: moduleId,
        k: index
    }, function (data) {
        $('#service-emails').html(parse_response(data));
    });
}

function switch_t2(el, id) {
    $('#priceoptions .billopt').removeClass('checked');
    $(el).addClass('checked');
    $('input[name=paytype]').removeAttr('checked').prop('checked', false);
    $('input#' + id).attr('checked', 'checked').prop('checked', true);
    if (id == 'recurx')
        $('input#recur').attr('checked', 'checked').prop('checked', true);
    $('.boption').hide();
    $('#recurx_b').hide();
    $('#' + id + '_b').show();
    $('#hidepricingadd').click();
    return false;
}

function saveOrder() {
    var sorts = $('div#serializeit input.ser').serialize();
    ajax_update('?cmd=configfields&action=changecatorder&' + sorts, {});
}
