if ($('#slides .pull-left').length > 3) {
    //divide slides to groups of 3
    var i = 0;
    for (i = 0; i < $('#slides .pull-left').length / 3; i++) {
        $('#slides .pull-left').slice(i * 3, (i * 3) + 3).wrapAll('<div class="slide"></div>').parent().append('<div class="clear"></div>');
    }
    $('#slides').slides({
        generatePagination: true,
        generateNextPrev: false,
        container: 'suggested-products',
        paginationClass: 'slides_pagination',
        start: 1
    });
}