$(document).ready(function() {
    $('.management_links a').click(function(e) {
        e.preventDefault();
        var self = $(this),
            hash = self.attr('href').replace(/^.*#/, ''),
            tr = self.parents('tr').eq(0);

        if (hash == 'pwd') {
            tr.next().hide().next().show();
        } else if (hash == 'priv') {
            var next = tr.next();
            next.show().next().hide();
            if (!self.data('userprivs')) {
                var td = next.find('td.management_priv');
                self.data('userprivs', 1);
                privselect(td, self.data('user'));
                td.addLoader();
                $.post(window.location.href, {
                    priv: self.data('user')
                }, function(data) {
                    privselect(td, self.data('user'), data);
                });
            }

        }
        return false;
    });
});

function privselect(e,name,data) {
    var y = 'Yes',
        n = 'No',
        s = 'selected="selected"';

    var html = '';
    for (var i = 0; i < DA_PRIV.length; i++) {
        var p = DA_PRIV[i];
        html += '<div class="span3" style="display:inline-block; margin-bottom: 5px;">'
            + '<span style="display:inline-block; width: 50%; text-align: right;">' + p + '</span>';
        switch (p) {
            case 'Tmp tables':
                p = 'tmp_table';
                break;
            case 'Lock Tables':
                p = 'lock_table';
                break;
            default:
                p = p.toLowerCase();
        }
        html += ' <select name="perms[' + name + '][' + p + ']" class="span1" style="width:60px">'
            + '<option value="Y" ' + (data && data[p] == 'Y' ? s : '') + '>' + y + '</option>'
            + '<option value="N" ' + (data && data[p] == 'N'  ? s : '') + '>' + n + '</option>'
            + '</select></div>'
    }
    html += '<input type="submit" value="Save"/>';
    e.empty().html(html);
}

var DA_PRIV = ['Select', 'Insert', 'Update', 'Delete', 'Create', 'Drop', 'Alter',
    'Index', 'Grant', 'Reference', 'Tmp tables', 'Lock Tables'];
