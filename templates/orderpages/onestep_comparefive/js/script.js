/*
 * Add custom scripts to control products listing etc here
 */
function adjustCartHeight(){
    $('.product-table tr').each(function() {
        var self = $(this);
        self.find('.plan-wrapp').height('');
        var height = Math.max.apply(null, self.find('.plan-wrapp').map(function() {
            return $(this).height()
        }).get());
        self.find('.plan-wrapp').height(height);
    })
}
$(function() {
    $(document).on('click', '[data-product]', function(e) {
        e.preventDefault();
        var self = $(this),
            i = self.parent().parent().index() + 1;

        $('.orderpage .product-table td').removeClass('active')
            .filter(':nth-child(' + i + ')').addClass('active');
        changeProduct(self.data('product'));;

        return false;
    })
    var w =$('.skew-back').width()
    $('.skew-back').css('transform', 'rotate('+Math.tan(-10/w)+'rad) skew('+Math.tan(-10/w)+'rad)');
    $('.skew-top').css('transform', 'rotate('+Math.tan(-5/w)+'rad) skew('+Math.tan(-5/w)+'rad)');
    
    $('#checkbox-tos').click(function(){
        if($(this).is(':checked'))
            $('.checkout-button').removeClass('disabled').removeAttr('disabled');
        else
            $('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
    })

    adjustCartHeight();
})
$(window).on('load', function(){
    adjustCartHeight();
})