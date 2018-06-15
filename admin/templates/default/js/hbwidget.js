var HBWidget = {
    init: function(){
        HBWidget.bindSorting();
        HBWidget.scanForNewWidgets();
    },
    saveChangesWidget: function() {
        $('.spinner').show();
        ajax_update('index.php?cmd=productwidgets&x=' + Math.random(), $('#saveform').serializeObject(), '.content');
        HBWidget.refreshWidgetView();
    },
    createWidget: function() {
        //jakis preloader;
        ajax_update('index.php?x=' + Math.random(), $('#addform').serializeObject(), '#formcontainer');
        HBWidget.refreshWidgetView();

        return false;
    },
    addCustomWidgetForm: function() {
        $.getJSON("?cmd=productwidgets&action=addcustomwidget&product_id=" + HBWidget.product_id, function(data) {
            if (data.wid) {
                HBWidget.editWidgetForm(data.wid);
                HBWidget.refreshWidgetView();
            }
        });
        return false;
    },
    enableAllWidgets: function() {
        $('#widgeteditor_content').addLoader();
        $.get("?cmd=productwidgets&action=enableall&product_id=" + HBWidget.product_id, function(data) {
            HBWidget.refreshWidgetView(data);
        });
        return false;
    },
    disableAllWidgets: function() {
        $('#widgeteditor_content').addLoader();
        $.get("?cmd=productwidgets&action=disableall&product_id=" + HBWidget.product_id, function(data) {
            HBWidget.refreshWidgetView(data);
        });
        return false;
    },
    editWidgetForm: function(wid) {
        $.facebox({ajax: "?cmd=productwidgets&action=editwidget&wid=" + wid + "&product_id=" + HBWidget.product_id, width: 900, nofooter: true, opacity: 0.5, addclass: 'modernfacebox'});
        return false;
    },
    disableWidget: function(wid, widget_id) {
        var target = $('.product-widget.unique.w' + widget_id + ', #widget-' + wid);
        target.addClass('loading');

        $.post('?cmd=productwidgets', {action: 'disable', wid: wid, product_id: HBWidget.product_id}, function(data) {
            HBWidget.refreshWidgetView(data, target);
            if (!target.is('.unique'))
                target.remove();
        });

        return false;
    },
    enableWidget: function(wid, widget_id) {
        var target = $('.product-widget.unique.w' + widget_id + ', .product-widget.disabled.w' + widget_id);
        target.addClass('loading');

        $.post('?cmd=productwidgets', {action: 'enable', widget_id: wid, product_id: HBWidget.product_id}, function(data) {
            HBWidget.refreshWidgetView(data, target);
        });

        return false;
    },
    bindSorting: function() {
        function saveOrder3() {
            var sorts = $('#grab-sorter2 input.ser').serialize();
            ajax_update('?cmd=productwidgets&action=changeorder&' + sorts, {});
        }

        function latebindme3() {
            $("#grab-sorter2").unbind('mousedown');
            $("#grab-sorter2").dragsort({dragSelector: "a.sorter-ha", dragBetween: false, dragEnd: saveOrder3, placeHolderTemplate: "<li class='placeHolder product-widget active'><div></div></li>"});
        }
        
        if (typeof $("#grab-sorter2").dragsort == 'function') {
            latebindme3();
        }
    },
    refreshWidgetView: function(data, target) {

        function setData(data) {
            data = $(parse_response(data));
            if (!target || !target.length) {
                $('#widgeteditor_content').html(data.html());
            } else {
                if (target.is('.unique')) {
                    var serch = '.' + target.attr('class').replace(/(disabled|active|loading)/g, '')
                        .replace(/^\s+|\s+$/g, '').replace(/\s+/g, '.');
                    target.replaceWith(data.find(serch));
                } else {
                    serch += '.active:last';
                    target.removeClass('loading')
                    var widgets = $('.product-widget', '#widgeteditor_content');

                    $('.product-widget', data).each(function() {
                        var self = $(this);

                        if (!widgets.filter('#' + self.attr('id')).length) {
                            target.before(self);
                            return false;
                        }
                    })
                }
            }
            HBWidget.bindSorting()
        }

        if (!data || !data.replace(/<!--.*?-->/, '').replace(/^\s+|\s+$/g, '').length)
            $.post("?cmd=productwidgets", {action: "loadproduct", product_id: HBWidget.product_id}, setData)
        else
            setData(data)

        return false;
    },
    scanForNewWidgets: function() {
        var mid = [];
        $('.modulepicker').each(function(n) {
            mid[n] = $(this).val()
        });
        //check if new widgets were installed - if they were, refresh list
        $.getJSON('?cmd=productwidgets&action=scanfornew', {module_id: mid, ptype: $('input[name=type]').val()}, function(data) {
            if (data.newwidgets) {
                HBWidget.refreshWidgetView();
            }
        });
    }
};
