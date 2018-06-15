$(function(){
    /*$('#updater').on('click','tr',function(){
        if($(this).hasClass('active-row'))
            return true;
        $('#updater tr').removeClass('active-row');
        $(this).addClass('active-row');
        var target = $('#ticketview'),
            next = target.next();
        if(target.find('.ticket-box').length)
            target.find('.ticket-box').addLoader();
        $.get($(this).find('a').attr('href'), function(data){
            data = parse_response(data);
            if(target.find('.ticket-replies').length){
                target.html(data);
            }else{
                target.hide();
                target.css({position:'relative', left:'50%'}).html(data).show().animate({left:'0'}, 400, 'swing', function(){
                    target.css({position:'', left:''});
                });
                next.css({position:'relative', width:'100%', top: -($('#ticketview .ticket-box').height() - 38) + "px" }).animate({width:'50%'}, 400, 'swing', function(){
                    next.css({position:'', width:'', height:'', top:''});
                });
            }
        });
        return false;
    })*/
    $('#ticketview').on('submit','form', function(e){
       e.preventDefault();
       var that = $(this),
           href = that.attr('action');
       $.post(href, $(this).serializeObject(), function(data){
           data = parse_response(data);
            setTimeout(function(){
                $.get(href, function(data){
                    data = parse_response(data);
                    $('#ticketview').html(data);
                });
            }, 300);
       });
       return false;
    });
});