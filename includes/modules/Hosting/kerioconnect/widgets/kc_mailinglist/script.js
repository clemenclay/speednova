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
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function addMember(email, edit) {
        if (!email.length || !validateEmail(email))
            return false;

        var members = $('#memberlist', edit),
            limit = parseInt($('#memberlimit', edit).val());

        if (members.find('[value="' + email + '"]').length)
            return true;

        if (!isNaN(limit) && limit >= 0 && members.children().length >= limit) {
            alert("List members limit reached");
            return false;
        }
        members.append('<option value="' + email + '">' + email + '</option>');
        return true;
    }
    function formSubmit(e) {
        var form = $(this),
            members = $('#memberlist', form);

        members.children().each(function() {
            var self = $(this);
            form.append('<input name="members[]" value="' + self.val() + '" type="hidden" />');
        });
    }
    function bindEditForm(edit) {
        $('#addmember', edit).click(function() {
            var inp = $('#acinput', edit),
                control = inp.parents('.control-group').eq(0);
            control.removeClass('error');
            if (!addMember(inp.val(), edit)) {
                control.addClass('error');
            }else
                inp.val('');
            return false;
        })
        $('#delmember', edit).click(function() {
            var members = $('#memberlist', edit),
                self = $(this);

            members.children(':selected').each(function() {
                var self = $(this);
                self.remove();
            });
            return false;
        })
        $('#dlistform', edit).submit(formSubmit);
    }

    var modal = {
        newAccount: function(edit) {
            $('#domain_id', edit).val($('#keirodomain').val());
            bindEditForm(edit);
        },
        editAccount: function(edit) {
            var tr = this.parents('tr').eq(0),
                data = tr.data(),
                list = $('#memberlist', edit);

            $('#wdo', edit).val('editaccount');
            $('#domain_id', edit).val(data.domainid);
            $('#account_id', edit).val(data.id);
            $('#inputDescription', edit).val(data.description);
            $('#inputFirst', edit).val(data.name).prop('disabled', true);
            bindEditForm(edit);

            list.parent().parent().addClass('ajaxLoading');

            $.post(window.location.href, {
                wdo: 'members',
                domain_id: data.domainid,
                list_id: data.id
            }, function(html) {
                list.parent().parent().removeClass('ajaxLoading');
                list.html(parse_response(html));
            })
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
            modal[self.data('action')].call(self, edit);

        edit.modal({
            show: true,
        })
    })
})