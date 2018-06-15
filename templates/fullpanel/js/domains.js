function bulk_widget() {
    var url = $('#bulk_widget').val();
    var ids = $('.idchecker:checked').serialize();
    if (ids == '' || url == '') {
        return false;
    }

    window.location = url + '&' + ids;
    return false;
}

function c_all(el) {

    var checker = $('.idchecker').not(':disabled'),
            widgets = $('#bulk_widget option[class^=widget]');
    if ($(el).is(':checked')) {
        checker.attr('checked', 'checked').prop('checked', true);

        $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&' + $('.idchecker').serialize(), {}, function(data) {
            widgets.addClass('disabled');
            widgets.filter('.widget_domainrenewal').removeAttr('disabled').prop('disabled', false);
            $.each(data.resp, function(index, i) {
                var widget = widgets.filter('.widget_' + i.widget);
                if (widget.length > 0)
                    widget.removeAttr('disabled').prop('disabled', false);
            });

        });
    } else {
        checker.removeAttr('checked').prop('checked', false);
        widgets.attr('disabled', 'disabled').prop('disabled', true);
    }

}
function c_unc(el) {
    var checker = $('.idchecker:checked').not(':disabled'),
            widgets = $('#bulk_widget option[class^=widget]'),
            ids = checker.serialize();

    if (ids == '') {
        widgets.attr('disabled', 'disabled').prop('disabled', true);
        return;
    }

    $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&' + ids, {}, function(data) {
        widgets.attr('disabled', 'disabled').prop('disabled', true);
        widgets.filter('.widget_domainrenewal').removeAttr('disabled').prop('disabled', false);
        if (data.resp)
            $.each(data.resp, function(index, i) {
                var widget = widgets.filter('.widget_' + i.widget);
                if (widget.length > 0)
                    widget.removeAttr('disabled').prop('disabled', false);
            });
    });
}