$(function() {
    /*
     * FIREWALL UI
     */
    $('#firewall-rule-type').change(function() {
        $('.rule-type').hide()
            .find('input, select').prop('disabled', true).attr('disabled', 'disabled').end()
            .filter('.rule-type-' + $(this).val()).show()
            .find('input, select').prop('disabled', false).removeAttr('disabled');
    }).change();
    
    $('#firewall-form').on('click', 'a.r_line, a.r_edit', function(e){
        e.preventDefault();
        var self = $(this),
            pos = self.attr('href').replace(/[^\d]/g),
            range = self.parents('tr').eq(0);
            
        if(self.is('.r_edit')){
            $('#firewall-form').addLoader();
            var data = $('input, select', range).serializeArray();
            $.post(window.location.href + '&do=update', data, function(resp){
                $('#preloader').remove();
                $('#firewall-rules').html(parse_response(resp));
            })
        } else if(self.is('.small_delete')){
            $('#firewall-form').addLoader();
            var data = $('input, select', range).serializeArray();
            $.get(self.attr('href'), function(resp){
                $('#preloader').remove();
                $('#firewall-rules').html(parse_response(resp));
            })
        }
        else{
            $('.r_edit', range).show();
            $('.r_line', range).hide();
        }
        return false;
    });
})