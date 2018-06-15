$(function() {
    $('.category-link').click(function() {
        var that = $(this),
            rel = that.attr('rel') || 0,
            parent = that.parents('div[id^=category]'),
            target = $('#' + rel);

        if (!target.length)
            return false;
        var theight = target.height(),
            pheight = parent.height(),
            pos = parent.css("position", "relative").position(),
            direct = target.index() > parent.index(),
            offleft = direct ? +292 : -292,
            animoffleft = direct ? '-=293' : '+=293';
        target.css({position: "absolute", top: pos.top, left: pos.left + offleft}).show();
        $().add(target).add(parent).animate({left: animoffleft, height: theight + 'px'}, 400, 'swing', function() {
            parent.css({position: 'static', height: '', left: ''}).hide();
            target.css({position: 'static', height: '', top: '', left: ''}).show();
        });

        return false;
    });


    $('.page a').click(function() {
        $('.main-container .white-container').addLoader();
        $('.page li').removeClass('active');
        $(this).parent().addClass('active');
        $.ajax($(this).attr('href'), {
            headers: {'X-Requested-With': '0'},
            success: function(data) {
                $('.main-container').html($(data).find('.main-container').html());
                var matches = data.match(/<title>(.*?)<\/title>/);
                document.title = matches[1];
            }
        });
        return false;
    });
});