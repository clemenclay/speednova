function onapp_showloader() {
    $('.onapptab:visible').find('.onapp-preloader').slideDown();
}
function onapp_hideloader() {
    $('.onapptab:visible').find('.onapp-preloader').slideUp();

}
function lookforsliders() {
    var pid = $('#product_id').val();
    $('.formchecker').click(function () {
        var tr = $(this).parents('tr').eq(0);
        var rel = $(this).attr('rel').replace(/[^a-z_]/g, '');
        if (!$(this).is(':checked')) {
            if (!confirm('Are you sure you want to remove related Form element? ')) {
                return false;
            }
            if ($('#configvar_' + rel).length) {
                ajax_update('?cmd=configfields&make=delete', {
                    id: $('#configvar_' + rel).val(),
                    product_id: pid
                }, '#configeditor_content');
            }
            //remove related form element
            tr.find('.tofetch').removeClass('fetched').removeClass('disabled');
            tr.find('input[id], select[id]').eq(0)
                .removeAttr('disabled', 'disabled').show()
                .parents('.f-hide:first').show();

            load_onapp_section($(this).parents('div.onapptab').eq(0).attr('id').replace('_tab', ''));
            $(this).parents('span').eq(0).find('a.editbtn').remove();
        } else {
            //add related form element
            var el = $(this);
            var rel = $(this).attr('rel');
            tr.find('input[id], select[id]').eq(0)
                .attr('disabled', 'disabled').hide()
                .parents('.f-hide:first').hide();

            onapp_showloader();
            $.post('?cmd=proxmox2&action=productdetails', {
                make: 'importformel',
                variableid: rel,
                cat_id: $('#category_id').val(),
                other: $('input, select', '#onapptabcontainer').serialize(),
                id: pid,
                server_id: $('#serv_picker input[type=checkbox][name]:checked:eq(0)').val()
            }, function (data) {
                var r = parse_response(data);
                if (r) {
                    el.parents('span').eq(0).append(r);
                    onapp_hideloader();
                    ajax_update('?cmd=configfields', {product_id: pid, action: 'loadproduct'}, '#configeditor_content');
                }
            });
        }
    }).each(function () {
        var rel = $(this).attr('rel').replace(/[^a-z_]/g, '');
        if ($('#configvar_' + rel).length < 1)
            return 1;
        var fid = $('#configvar_' + rel).val();
        var tr = $(this).attr('checked', 'checked').parents('tr').eq(0);
        tr.find('input[id], select[id]').eq(0)
            .attr('disabled', 'disabled').hide()
            .parents('.f-hide:first').hide();

        tr.find('.tofetch').addClass('disabled');
        $(this).parents('span').eq(0).append(' <a href="#" onclick="return editCustomFieldForm(' + fid + ',' + pid + ')" class="editbtn orspace">Edit related form element</a>');
    }).filter('.osloader').each(function () {
        if ($('#configvar_os').length < 1)
            return 0;
        var fid = $('#configvar_os').val();
        $(this).parents('span').eq(0).append(' <a href="#" onclick="return updateOSList(' + fid + ')" class="editbtn orspace">Update template list from Proxmox</a>');
    });
}
function updateOSList(fid) {
    onapp_showloader();
    $.post('?cmd=proxmox2&action=productdetails&make=updateostemplates', {
        id: $('#product_id').val(),
        cat_id: $('#category_id').val(),
        other: $('input, select', '#onapptabcontainer').serialize(),
        server_id: $('#serv_picker input[type=checkbox][name]:checked:eq(0)').val(),
        fid: fid
    }, function (data) {
        parse_response(data);
        editCustomFieldForm(fid, $('#product_id').val());
    });
    return false;
}
function load_onapp_section(section) {
    if (!$('#serv_picker input[type=checkbox][name]:checked:eq(0)').val()) {
        alert('Please configure & select server first');
        return;
    }


    var tab = $('#' + section + '_tab');
    if (!tab.length)
        return false;
    var elements = tab.find('.tofetch').not('.fetched').not('.disabled');
    if (!elements.length)
        return false;
    tab.find('.onapp-preloader').show();
    elements.each(function (e) {
        var el = $(this);
        var inp = el.find('input[id], select[id]').eq(0);
        if (inp.is(':disabled')) {
            if ((e + 1) == elements.length) {
                tab.find('.onapp-preloader').slideUp();
            }
            return 1; //continue;

        }
        var vlx = inp.val();
        var vl = inp.attr('id') + "=" + vlx;
        if (vlx != null && vlx.constructor == Array) {
            vl = inp.serialize();
        }
        $.post('?cmd=proxmox2&action=productdetails&' + vl,
            {
                make: 'getonappval',
                id: $('#product_id').val(),
                cat_id: $('#category_id').val(),
                other: $('input, select', '#onapptabcontainer').serialize(),
                opt: inp.attr('id'),
                server_id: $('#serv_picker input[type=checkbox][name]:checked:eq(0)').val()
            }, function (data) {
            var r = parse_response(data);
            if (typeof (r) == 'string') {
                $(el).addClass('fetched');
                el.html(r);
            }

        });

    });
    return false;
}
function singlemulti() {
    $('#step-1').show();
    if ($('#single_vm').is(':checked')) {
        $('tr.odesc_single_vm').find('.tofetch').removeClass('disabled');
        $('tr.odesc_cloud_vm td').find('.tofetch').addClass('disabled');
        $('#option14').val(1);
        $('#option19').val('No');
    } else {
        $('tr.odesc_cloud_vm').find('.tofetch').removeClass('disabled');
        $('tr.odesc_single_vm').find('.tofetch').addClass('disabled');
    }
}
function bindsteps() {
    $('a.next-step').click(function () {
        $('.breadcrumb-nav a.active').removeClass('active').parent().next().find('a').click();
        return false;
    });
    $('a.prev-step').click(function () {
        $('.breadcrumb-nav a.active').removeClass('active').parent().prev().find('a').click();
        return false;
    });
    $('#serv_picker input[type=checkbox]').click(function () {
        if ($('#serv_picker input[type=checkbox][name]:checked:eq(0)').val())
            $('#onappconfig_ .breadcrumb-nav a').removeClass('disabled');
        else
            $('#onappconfig_ .breadcrumb-nav a').addClass('disabled');

    });
}

function append_onapp() {
    $('#onappconfig_').TabbedMenu({elem: '.onapptab', picker: '.breadcrumb-nav a', aclass: 'active', picker_id: 'nan1'});
    $('.onapp_opt input[type=radio]').click(function (e) {
        $('.onapp_opt').removeClass('onapp_active');
        var id = $(this).attr('id');
        $('.odesc_').hide();
        $('.odesc_' + id).show();
        $(this).parents('div').eq(0).addClass('onapp_active');
        singlemulti();
    });
    $('.onapp_opt input[type=radio]:checked').click();
    lookforsliders();
    $(document).ajaxStop(function () {
        $('.onapp-preloader').hide();
    });
    bindsteps();

    $('#vlancheck').each(function () {
        var self = $(this),
            select = self.nextAll('select');

        self.on('change', function () {
            if (self.is(':checked'))
                select.prop('disabled', false)
            else
                select.prop('disabled', true)
        });
        self.trigger('change')
    });
    if ($('#serv_picker input[type=checkbox][name]:checked:eq(0)').val())
        $('#onappconfig_ .breadcrumb-nav a').removeClass('disabled');
}

$(function () {
    var conf = $('#onappconfig_');
    
    $('#limitbandwidth', conf).on('click update', function () {
        var self = $(this),
            enabled = self.is(':checked');
        $('.bandwidth_opt', conf).toggleClass('disabled', !enabled)
            .find('input').prop('readonly', !enabled);
    }).trigger('update');
    
    append_onapp();
})