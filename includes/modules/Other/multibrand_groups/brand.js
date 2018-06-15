$(function () {
    var hooks = {
        invoices: function () {
            var status = $('#invoice_status')
            if (!status.is('.Draft'))
                return;

            var anchor = $('#detailsform');
            if (anchor.length) {
                var brand = $('<div><strong>Brand:</strong> <select name="brand"></select></div>');
                anchor.prepend(brand);

                var select = brand.find('select');
                select.data('client', $('input[name="invoice[client_id]"]').val());
                return brand;
            }
        },
        orders: function () {
            var client = $('select[name=client_id]'),
                anchor = $('.ordertable').next();

            if (anchor.length && client.length) {
                var brand = $('<span style="line-height: 30px;">\
                    <strong>Brand:</strong>\
                    <select name="brand" class="inp"></select>\
                    </span>');
                anchor.append(brand)

                var select = brand.find('select');
                select.data('client', client.attr('default'));

                client.on('change', function () {
                    select.data('client', client.val());
                    select.trigger('reset');
                })

                select.on('change', function () {
                    anchor.find('a[href]').each(function () {
                        var a = $(this),
                            href = a.attr('href'),
                            val = select.val();

                        a.attr('href', href.replace(/[?&]?brand=[^&#]/g, '') + (val ? '&brand=' + val : ''))
                    })
                })

                return brand;
            }
        },
        tickets: function () {
            var anchor = $('#client_picker');
            if (anchor.length) {
                var tr = anchor.parents('tr:first')
                var brand = $('<tr><td>Brand</td><td><select name="brand" class="inp"></select></td></tr>');
                brand.insertAfter(tr);

                var select = brand.find('select');
                select.data('client', anchor.val());

                anchor.on('change', function () {
                    select.data('client', anchor.val());
                    select.trigger('reset');
                })

                return brand;
            }
        }
    };

    function brand(action) {
        var elem = $('select[name=brand]');
        if (elem.length) {
            return;
        }
        if (!hooks[action]) {
            return;
        }
        elem = hooks[action]();
        if (!elem) {
            return setTimeout(function () {
                brand(action);
            }, 100);
        }

        var select = elem.find('select');
        select.html('<option value="">Client singup brand</option><option value="">Loading..</option>')
        select.on('reset', function () {
            options(select.data('client')).then(function (html) {
                select.html(html).trigger('change');
            })
        }).trigger('reset')

    }

    var opts_cache = [];
    function options(client_id) {
        client_id = client_id || 0;
        var deffered = $.Deferred();

        function html(opts) {
            var html = '';
            for (var i = 0, l = opts.length; i < l; i++) {
                var o = opts[i];
                html += '<option value="' + o.id + '">' + o.name + '</option>';
            }
            return html;
        }

        if (opts_cache[client_id]) {
            deffered.resolve(html(opts_cache[client_id]))
        } else {
            $.post('?cmd=multibrand_groups', {
                client_id: client_id
            }, function (data) {
                opts_cache[client_id] = data;
                deffered.resolve(html(opts_cache[client_id]))
            })
        }
        return deffered;
    }

    var action = window.location.href.match(/cmd=([^&#]+)/);
    if (action) {
        action = action[1];

        $(document).ajaxComplete(function () {
            setTimeout(function () {
                brand(action);
            }, 100);
        });
        brand(action)
    }
    MultiBrandGroup.show();
});


(function ($, window) {
    var brand, ready;
    function Brand(b) {
        brand = b;
        if (ready)
            BrandShow();
    }

    function throttle(fn, time) {
        var t = 0;
        return function () {
            var args = arguments,
                ctx = this;

            clearTimeout(t);

            t = setTimeout(function () {
                fn.apply(ctx, args);
            }, time);
        };
    }

    function BrandShow() {
        if (brand) {
            var blus = $('#bodycont > form > .blu, #bodycont > .blu');
            blus.find('.label-brand').remove();
            blus.prepend('<div class="label-brand label label-info pull-right" style="font-size: 12px;">' + brand.name + '</div>');
        }
        ready = true;
    }

    function ajax(b) {
        brand = b;
        var bc = $('#bodycont');
        bc.on("DOMSubtreeModified.MultiBrandGroup", throttle(function () {
            console.log(b, brand)
            bc.off("DOMSubtreeModified.MultiBrandGroup");
            BrandShow();
        }, 50));
    }

    Brand.ajax = ajax;
    Brand.show = BrandShow;
    window.MultiBrandGroup = Brand;
})(jQuery, window)