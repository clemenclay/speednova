var theme = {
    timeout: null,
    toggleMainMenu: function(instant) {
        var that = $('aside.left-menu');
        if (!theme.uiState.sidemode) {
            if (theme.uiState.sidemenu && !instant) {
                $('aside.left-menu nav').slideDown('fast', 'swing');
                $(document).bind('click.overlayswitch', function(e) {
                    var tg = $(e.target);
                    if (!tg.is('nav').length && !tg.parents('nav').length) {
                        $('.topbar button').click();
                        $(document).unbind('.overlayswitch')
                    }
                });
                theme.uiState.sidemenu = 0;
            } else {
                theme.uiState.sidemenu = 1;
                $('aside nav').slideUp('fast', 'swing');
                $(document).unbind('.overlayswitch');
            }
        } else {
            if ((theme.uiState.sidemenu && !instant) || (instant && !theme.uiState.sidemenu)) {
                if (instant) {
                    that.addClass('hidden-txt');
                } else {
                    that.animate({'width': 60, }, 'fast', 'swing', function() {
                        that.addClass('hidden-txt');
                        __adjustHeights();
                    });
                }
                theme.uiState.sidemenu = 0;
            } else {
                that.animate({'width': 206}, 'fast', 'swing').removeClass('hidden-txt');
                $('aside.left-menu > nav > li').each(function(x) {
                    if ($(this).children('a.small-active').length || (theme.uiState[x] != undefined && theme.uiState[x])) {
                        $(this).children('.nav-submenu').show();
                    } else {
                        $(this).children('.nav-submenu').hide();
                    }
                });
                theme.uiState.sidemenu = 1;
                __adjustHeights();
            }
            
            $.cookie('ui', theme.uiState, {path: '/'});
        }
    },
    mouseEvents: function(e) {
        var that = $(this);
        if (theme.uiState.sidemenu) {
            var target = $(e.target);
            if (e.type == 'click' && !target.parents('.nav-submenu').length && that.children('.nav-submenu').length) {
                if (theme.uiState[that.index()]) {
                    that.children('.nav-submenu').hide();
                    theme.uiState[that.index()] = 0;
                } else {
                    that.children('.nav-submenu').show();
                    theme.uiState[that.index()] = 1;
                }
                $.cookie('ui', theme.uiState, {path: '/'});
                __adjustHeights()
                return false;
            }
        } else {
            if (e.type == 'click' && (target.parents('.nav-submenu').length || !that.children('.nav-submenu').length)) {
                return true;
            } else if (e.type == 'mouseleave') {
                clearTimeout(theme.timeout);
                theme.timeout = setTimeout(function() {
                    that.children('.nav-submenu').hide();
                }, 100);
            } else {
                clearTimeout(theme.timeout);
                $('aside.left-menu .nav-submenu').hide()
                that.children('.nav-submenu').show();
                return false;
            }
        }
        
    },
    uiState: {
        sidemenu: true,
        sidemode: true
    }
};
$.cookie.json = true;
$(window).load(function(e) {

});

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$(function() {

    var menustate = $.cookie('ui');
    if (menustate !== undefined)
        theme.uiState = menustate;
    theme.uiState.sidemode = !$('aside.left-menu.hidden-txt').length;
    theme.toggleMainMenu(true);
    $('.left-menu .header i').toggle(
            function() {
                theme.toggleMainMenu()
            },
            function() {
                theme.toggleMainMenu()
            }
    );
    ca_search_baseurl = $('#ca_search').attr('action');
    $('.search-box .dropdown-menu a').click(function(e){
        e.preventDefault();
        var that = $(this),
        inp = that.parents('.dropdown-menu').prev('input'),
        itg = inp.parents('.btn-group').prev('input');
        inp.val(that.attr('href').substr(1));
        itg.attr('placeholder',that.text()).val('');
        itg.click();
        return false;
    });
    
    $('#ca_search').submit(function(){
        var that = $(this),
        type = that.find('.btn-group input').val();
        switch(type){
            case 'knowledgebase':
                that.attr('action', ca_search_baseurl+'knowledgebase/search/');
                that.find('input[type=hidden]').remove();
                break;
            case 'tickets':
                var query = that.find('input[name=query]').val(),
                inp = $('<input type="hidden" name="filter[subject]">').val(query).appendTo(that);
                that.attr('action', ca_search_baseurl+'tickets/');
                break;
            default: //doomains
                var name = that.find('input[name=query]').val(),
                parts = name.split('.',2),
                inp = $('<input type="hidden">');
                inp.clone().attr('name', 'sld').val(parts[0]).appendTo(that);
                inp.clone().attr('name', 'tld').val('.'+parts[1]).appendTo(that);
                inp.clone().attr('name', 'action').val('checkdomain').appendTo(that);
                inp.attr('name', 'singlecheck').val(1).appendTo(that);
                that.attr('action', ca_search_baseurl+'checkdomain/');
        }
    });
    $('aside.left-menu > nav > li').bind('click mouseenter mouseleave', theme.mouseEvents);

    $('.page-link').click(function(e) {
        e.preventDefault();
        var that = $(this),
                parent = that.parents('.page-contener'),
                direct = that.parent().is(':last-child'),
                pages = parent.find('.page', parent),
                current = pages.filter(':visible'),
                index = pages.index(current),
                target = direct ? pages.eq(index + 1 >= pages.length ? 0 : index + 1) : pages.eq(index - 1 < 0 ? pages.length - 1 : index - 1);
        if (!target.length || target.is(current))
            return false;

        var theight = target.height(),
                pheight = current.height(),
                pos = current.css("position", "relative").position(),
                width = parent.width(),
                offleft = direct ? +width : -width,
                animoffleft = direct ? '-=' + width : '+=' + width;
        //parent.css({position:'relative', overflow:'hidden'});
        target.css({position: "absolute", top: pos.top, left: pos.left + offleft}).show();
        $().add(target).add(current).animate({left: animoffleft, height: theight + 'px'}, 400, 'swing', function() {
            current.css({position: 'static', height: '', left: ''}).hide();
            target.css({position: 'static', height: '', top: '', left: ''}).show();
            //parent.css({position:'', overflow:''});
        });

        return false;
    });

    $('.service-tabs a[data-target]').click(function(e) {
        e.preventDefault();
        if(!__service_all)
            __service_all = $('#all .page tr').detach();
        var tgattr = $(this).attr('data-target'),
            targ = __service_all.filter(tgattr);
        if(targ.length){
            var visible = __service_all.filter(tgattr),
            hidden = __service_all.not(visible),
            vl = visible.length,
            page = $('#all table.page:first-child').show();
            $('#all .page tr').remove();
            for (var i = 0; i<vl; i+=5){
                if(i%5 == 0 && i>0){
                    page = page.next('table.page').hide();
                    if(!page.length){
                        page = $('<table class="table services-table align-middle page"></table>').hide();
                        if($('#all .pagination').length)
                            page.insertBefore('#all .pagination');
                        else
                            page.appendTo('#all');
                    }
                }
                $(visible.splice(0,5)).appendTo(page);
            }
            page.nextAll('table').remove();
            //$('<table></table>').hide().insertAfter(page).append(hidden);
            $(this).parent().siblings().removeClass('active').end().addClass('active');
        }
    })
    __adjustHeights();
});
function __adjustHeights(){
    var nav = $('aside').eq(0),
        body = $('.wrapper').eq(0),
        both = $().add(nav).add(body);
    both.css('min-height','');
    var nheight = nav.height(), 
        bheight = body.height(),
        top = nheight > bheight ? nheight: bheight,
        wheight = $(window).height();
        top = top > wheight ? top: wheight;
    console.log(nheight, bheight, top);
    both.css('min-height', top + 'px');
    
    var kb = $('.knowledgebase'),
        wb = $('.white-container.white-bg'),
        pair = $().add(kb).add(wb);
    pair.css('min-height','');
    var kbheight = kb.height(), 
        wbheight = wb.height();
    pair.css('min-height', (kbheight > wbheight ? kbheight : wbheight) + 'px');
}
var __service_all = null;