$(function () {
    var base = $('#config-row-' + quickbooksonline);
    var taxinput = $('input[name*="TaxCode"]', base);
    var taxes = false;

    function loaded(self) {
        $('#preloader').remove();
        if (taxes.length) {
            var select = '<select name="' + self.attr('name') + '">';
            for (var i = 0, l = taxes.length; i < l; i++) {
                select += '<option>' + taxes[i] + '</option>';
            }
            select += '</select>';
            var $select = $(select).val(self.val());
            self.replaceWith($select);
            self.next('a').remove();
        }
    }

    taxinput.each(function () {
        var self = $(this),
            btn = $('<a class="menuitm">Load From QB</a>');
        self.after(btn).after(' ');

        btn.click(function () {
            self.parent().parent().addLoader()
            if (taxes === false) {
                $.get('?cmd=quickbooksonline&action=taxes', function (data) {
                    if (data.taxes) {
                        taxes = data.taxes;
                    }
                    loaded(self)
                });
            } else {
                loaded(self)
            }

        })
    })
    var taxfree = $('input[name*="TaxCode For tax free items"]', base);
    $('select[name*="Tax Integration"]', base).on('change', function(){
        if($(this).val() == 'Non-US sales tax'){
            taxfree.parents('tr:first').show();
        }else{
            taxfree.parents('tr:first').hide();
        }
    }).trigger('change')
})