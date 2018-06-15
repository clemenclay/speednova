$(function () {
    $('#landingurl_disable').on('click change', function () {
        var self = $(this);
        self.prevAll('input').prop('disabled', self.is(':checked'));
    }).trigger('change');

    $('.commission-val').change(function () {
        var self = $(this),
            data = self.data(),
            accept = self.parents('tr').eq(0).find('.acceptref');

        accept.attr('href', accept.attr('href').replace(/&amount=[^&]*/, '')
            + '&amount=' + self.val());

        if (!data.save) {
            data.save = $('<a style="color:red" href="#">Save</a>');
            self.parent().append(data.save);
            data.save.click(function () {
                var va = self.val();
                data.save.remove();
                data.save = false;
                self.prop('disabled', true);
                $.post(window.location.href, {
                    editorder: 1,
                    order_id: data.ref,
                    value: va
                },
                    function (data) {
                        parse_response(data);
                        self.prop('disabled', false);
                    });
            });
        }
    });

    $('#assign-client').each(function () {
        var self = $(this),
            select = $('select', self),
            help = select.next();
            
        select.chosensearch();
        select.on('change', function () {
            help.empty();
            $('.client-assign', self).addClass('diabled').prop('disabled', true)
            select.parent().removeClass('has-error');
            
            $.post('?cmd=affiliates&action=checkassign', {
                id: $('#affiliate_id').val(),
                client_id: select.val()
            }, function (data) {
                if (data.length == 0) {
                    $('.client-assign', self).removeClass('diabled').prop('disabled', false)
                } else {
                    for (var l in data) {
                        help.append('<div>' + data[l] + '</div>');
                    }
                    select.parent().addClass('has-error');
                }
            })
        });
    })
});