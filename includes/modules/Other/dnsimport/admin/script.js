$(function () {
    $(".chosen").chosen({
        disable_search_threshold: 5,
        allow_single_deselect: true
    });
    var table = $('#dnsitems'),
        selects = $('select'),
        zones = selects.eq(0),
        clients = selects.eq(1),
        products = selects.eq(2);

    $('#add').click(function () {
        var data = selects.serializeObject(),
            index = data.product+'_'+data.client,
            html = '<tr data-index="' + index + '"><td>';

        if (!data.zones)
            return false;

        if (typeof data.zones == 'string')
            data.zones = [data.zones];

        var names = [];
        for (var i = 0, l = data.zones.length; i < l; i++) {
            var zone = data.zones[i];
            if (!zone.length)
                continue;

            var opt = zones.children('[value="' + zone + '"]');
            if (!opt.length)
                continue;
            var name = opt.text();
            names.push(name);
            opt.prop('disabled', true).attr('dsabled', 'disabled');

            html += '<input type="hidden" name="import[' + index + '][zone][' + name + ']" value="' + zone + '" />';
        }

        html += '<input type="hidden" name="import[' + index + '][client]" value="' + data.client + '" />';
        html += '<input type="hidden" name="import[' + index + '][product]" value="' + data.product + '" />';

        html += '<code>' + names.join('</code>, <code>') + '</code>';
        html += '</td><td>' + (clients.children('[value="' + data.client + '"]').text() || data.client)
        html += '</td><td>' + (products.children('[value="' + data.product + '"]').text() || data.product)
        html += '</td><td><a id="rem" class="dns-btn" href="#rem" >Remove</a></td></tr>'

        selects.val('').trigger('liszt:updated');
        table.prepend(html);

        return false;
    })

    table.on('click', '#rem', function () {
        var self = $(this),
            tr = self.parents('tr:first'),
            zonein = tr.find('input[name*=zone]');

        zonein.each(function () {
            var value = $(this).val();
            zones.children('[value="' + value + '"]').prop('disabled', false).removeAttr('dsabled');
        })

        tr.remove();
        zones.trigger('liszt:updated');
        return false;
    })
})

