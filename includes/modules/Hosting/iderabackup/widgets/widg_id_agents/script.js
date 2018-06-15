$(function() {

    $('#btn_addServer').click(function(e) {
        e.preventDefault();
        var self = $(this),
            edit = $('#addServer').clone(true);

        edit.find('.hide-modal').click(function() {
            edit.modal('hide');
        });
        edit.on('hidden', function() {
            edit.remove();
        });
        edit.find(".vtip_description").data('tooltip','');

        edit.on('shown', function() {
            edit.find(".vtip_description").tooltip();
        });
        edit.modal({
            show: true,
        })
    })
})