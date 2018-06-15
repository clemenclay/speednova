$(function() {
    $('#keirodomain').change(function() {
        var self = $(this);
        $('#newacc').data('domainid', self.val()).data('domain', self.children(':selected').text().trim());
        $('#accountlist').addLoader();
        $.post(window.location.url, {wdo: 'list', domain_id: self.val()}, function(data) {
            data = parse_response(data);
            $('#accountlist').html(data);
            $('#accountlist [data-toggle="tooltip"]').tooltip();
        });
    });

    var modal = {
        newAccount: function(edit) {
            $('#domain_id', edit).val($('#keirodomain').val());
            console.log($('#domain_id', edit).val())
        },
        editAccount: function(edit) {
            var tr = this.parents('tr').eq(0),
                data = tr.data();

            $('#wdo', edit).val('editaccount');
            $('#domain_id', edit).val(data.domainid);
            $('#account_id', edit).val(data.id);
            $('#inputFirst', edit).val(data.fullname.split(' ').slice(0, 1).join(' '));
            $('#inputLast', edit).val(data.fullname.split(' ').slice(1).join(' '));
            $('#inputEmail', edit).val(data.loginname).prop('disabled', true);
        },
        resizeAccount: function(edit, e) {
            var tr = this.parents('tr').eq(0),
                data = tr.data(),
                val = $('#inputQuota', edit),
                ind = $('#quotaIndicator', edit);

            $('#wdo', edit).val('quota');
            $('.domain_id', edit).val(data.domainid);
            $('.account_id', edit).val(data.id);

            var s = $('#slider', edit),
                left = parseInt($('.quota_left', edit).val()) || 0,
                current = parseInt(data.quota) || 0,
                added = parseInt(data.addedquota) || 0,
                min = current - added,
                max = left + min,
                opt = {
                    min: min,
                    max: max,
                    value: current,
                    step: 1,
                    range: "min",
                    animate: true,
                    stop: function(e, ui) {
                        val.val(ui.value).trigger('change');
                        ind.text(ui.value);
                    },
                    slide: function(e, ui) {
                        ind.text(ui.value);
                    }
                };
                console.log(opt);

            s.slider(opt);
            s.slider('option', 'stop').call(s, e, {
                value: s.slider('value')
            });
        }
    };

    $('[data-action]').click(function(e) {
        e.preventDefault();
        var self = $(this),
            edit = $('.modal.action-' + self.data('action')).clone(true);

        edit.find('.hide-modal').click(function() {
            edit.modal('hide');
        });
        edit.on('hidden', function() {
            edit.remove();
        });
        edit.find(".vtip_description").data('tooltip', '');

        edit.on('shown', function() {
            edit.find(".vtip_description").tooltip();
        });

        if (typeof modal[self.data('action')] == 'function')
            modal[self.data('action')].call(self, edit, e);

        edit.modal({
            show: true,
        })
    })
})