$(function() {
    var monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
    var dayNames = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
        'Saturday', 'Sunday'];

    String.prototype.lpad = function(padString, length) {
        var str = this;
        while (str.length < length)
            str = padString + str;
        return str;
    }

    function _insertOptions(el, from, to, by, tpl, nopad) {
        tpl = tpl || '<option value="$1">$1</option>';
        by = by | 1
        el.children().remove();
        while (from <= to) {

            var pv = from;
            if (!nopad)
                pv = pv.toString().lpad('0', 2);

            el.append(typeof tpl == 'function' ? tpl(pv) : tpl.replace(/\$1/g, pv));
            from += by;
        }
    }

    $('#btn_addServer').click(function(e) {
        e.preventDefault();
        var self = $(this),
            edit = $('#addServer').clone(true);

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

        $('#freqTabs a', edit).click(function(e) {
            e.preventDefault();
            var self = $(this),
                target = $(self.attr('href'), edit);

            target.show().addClass('active').siblings().hide().removeClass('active');
            self.parent().addClass('active').siblings().removeClass('active');
        }).eq(0).click();

        $('.schedule', edit).each(function() {
            var tab = $(this),
                freq = $('#frequency', tab),
                prefix = tab.attr('id').replace('#','');

            freq.change(function() {
                var select = $(this);
                $('.frequency', tab).hide()
                    .find('input, select').prop('disabled', true).end()
                    .filter('.frequency-' + select.val()).show()
                    .find('input, select').prop('disabled', false);
            }).change();

            $('input, select, textarea', tab).each(function() {
                $(this).attr('name', prefix + $(this).attr('name').replace(/^([^\[]+)/,'[$1]'));
            })

            _insertOptions($('#everyMinute', tab), 5, 60, 1, false, true);
            _insertOptions($('#startingMinute', tab), 0, 59, 1);
            _insertOptions($('#startingHour', tab), 0, 23, 1);
            _insertOptions($('#dayOfMonth', tab), 1, 31, 1);

            _insertOptions($('#hoursOfDay', tab), 0, 23, 1, function(x) {
                return '<label><input type="checkbox" value="' + x + '" name="' + prefix + '[hoursOfDay][]" /> ' + (x % 12 + 1) + (x / 11 < 1 || x == 23 ? "AM" : "PM") + '</label> ';
            }, true);
            _insertOptions($('#daysOfWeek', tab), 0, 6, 1, function(x) {
                return '<label><input type="checkbox" value="' + x + '" name="' + prefix + '[daysOfWeek][]" /> ' + dayNames[x] + '</label> ';
            }, true);
            _insertOptions($('#daysOfMonth', tab), 1, 31, 1, function(x) {
                return '<label><input type="checkbox" value="' + x + '" name="' + prefix + '[daysOfMonth][]" /> ' + x + '</label> ';
            }, true);
            _insertOptions($('#monthsOfYear', tab), 0, 11, 1, function(x) {
                return '<label><input type="checkbox" value="' + x + '" name="' + prefix + '[monthsOfYear][]" /> ' + monthNames[x] + '</label> ';
            }, true);
        });

        edit.modal({
            show: true,
        })
    })
})