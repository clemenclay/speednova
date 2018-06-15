// -------------------------------------------------- MESSAGE BOX
/**
 * add a message to the message box. context and type can be omitted.
 */
function add_msg(msg, context, type) {
    context = typeof context !== 'undefined' ? context : 'Info';
    type = typeof type !== 'undefined' ? type : 'alert-info';

    $('div#msgbox').prepend(
        $('<div />').addClass('alert').addClass(type).append(
        '<a class="close" data-dismiss="alert">&times;</a>',
        '<strong>' + context + ':</strong> ' + msg
        )
        );
}

// -------------------------------------------------- BROWSE
/**
 * set breadcrumb according to PATH.
 */
function set_breadcrumb(path) {
    // clear
    var breadcrumb = $('ol#breadcrumb'),
        simplepath = 'data/',
        html = '',
        link = '';

    breadcrumb.html('<li><a href="">data</a><span class="divider">/</span></li>');

    // add parts
    for (var i = 0; i < path.length; i++) {
        if (i != path.length - 1) {
            link = path[i].id;
            html += '<li><a href="' + link + '">' + path[i].name + '</a><span class="divider">/</span></li>';
        } else {
            html += '<li class="active">' + path[i].name + '</li>';
        }
        simplepath += path[i].name + '/';
    }

    breadcrumb.append(html);
    breadcrumb.data('path', path);
    breadcrumb.data('simplepath', simplepath);

    // register click event
    $('a', breadcrumb).click(function(e) {
        e.preventDefault();
        browse($(e.target).attr('href'));
    });
}

/**
 * do the ajax request for the new path.
 */
function browse(path) {
    $.ajax({
        url: window.location.href + '&p=' + path,
        cache: false,
        dataType: 'json',
        success: function(result) {
            $('#preloader').remove()
            if (result.status) {
                PATH = path;
                show_content(result.path, result.entries);
            } else
                add_msg(result.msg, 'PHP', 'alert-danger');
        },
        error: function(jqXHR, status) {
            $('#preloader').remove()
            add_msg(status, 'AJAX', 'alert-danger');
        }
    });
}

/**
 * ajax success callback, set path and add content to table.
 */
function show_content(path, files) {

    set_breadcrumb(path);

    $('table#filemanager').empty();
    if (files.length)
        $('.filevewport .no-files').hide();
    else
        $('.filevewport .no-files').show();

    for (var i = 0; i < files.length; i++) {
        var f = $.extend({}, files[i]);

        if (f.type == 'folder') {
            f.icon = 'icon-folder-close';
            f.name = $('<a />').attr('href', f.id).text(f.name).click(function(e) {
                e.preventDefault();
                browse($(e.target).attr('href'), f.name);
            }).data('entry', files[i]);
            f.edit = '';
        } else {
            f.icon = 'icon-file';
            f.edit = '';
            if (f.name.match(/.txt$/))
                f.edit = $('<a />').attr('href', f.id).html('<i class="icon-pencil"></i>').click(modal_edit).data('entry', files[i]);

            f.name = '<a href="' + window.location.href + '&act=file&id=' + f.id + '">' + f.name + '</a>';
        }

        // move action
        f.move = $('<a />').attr('href', f.id).html('<i class="icon-arrow-right"></i>').click(modal_move).data('entry', files[i]);

        // remove action
        f.remove = $('<a />').attr('href', f.id).html('<i class="icon-remove"></i>').click(modal_remove).data('entry', files[i]);

        $('table#filemanager').append(
            $('<tr />').append(
            $('<td />').append('<i class="' + f.icon + '"></i> ', f.name),
            $('<td />').text(f.size),
            $('<td />').text(f.date),
            $('<td />').text(f.perm),
            $('<td style="text-align:right">').append(f.edit, ' ', f.move, ' ', f.remove)
            )
            );
    }
}

// -------------------------------------------------- PROGRESS BAR
/**
 * callback function for progress bar.
 */

function progress_bar(e) {
    var done = e.position || e.loaded;
    var total = e.totalSize || e.total;
    var per = (Math.floor(done / total * 1000) / 10);
    per = per < 10 ? 10 : per;
    $('div#progress > div.bar').css('width', per + '%').attr('progres',per + ' %');
}

// -------------------------------------------------- MODAL SUBMIT

function modal_remove(e) {
    e.preventDefault();
    var self = $(this);

    $('div#remove input#remove-path').val($('ol#breadcrumb').data('simplepath') + self.data('entry').name);

    var clone = $('div#remove').clone(true);
    clone.modal('show');
    clone.on('hidden', function() {
        clone.remove();
    });
    $('a.submit', clone).click(function(e) {
        $('#filemanager').addLoader()
        $.ajax({
            url: window.location.href + '&act=delete&path=' + self.attr('href'),
            cache: false,
            dataType: 'json',
            type: 'DELETE',
            success: function(result) {
                add_msg(result.msg, 'DELETE', result.status ? 'alert-success' : 'alert-danger');
                browse(PATH);
            },
            error: function(jqXHR, status) {
                $('#preloader').remove()
                add_msg(status, 'AJAX', 'alert-danger');
            }
        });
    });
}

function modal_edit(e) {

    e.preventDefault();
    var clone = $('div#editor').clone(true),
        self = $(this);

    clone.modal('show');
    clone.on('hidden', function() {
        clone.remove();
    });
    clone.on('shown', function() {
        clone.find('.modal-body').addLoader();
    });
    
    $.ajax({
        url: window.location.href + '&act=file&id=' + self.attr('href'),
        cache: false,
        dataType: 'text',
        success: function(result) {
            $('#preloader').remove()
            $('textarea', clone).val(result);
            $('input#editor-target', clone).val(self.attr('href'));
        },
        error: function(jqXHR, status) {
            $('#preloader').remove()
            add_msg(status, 'AJAX', 'alert-danger');
        }
    });

    $('a.submit', clone).click(function(e) {
        $('#filemanager').addLoader()
        $.ajax({
            url: window.location.href,
            cache: false,
            dataType: 'json',
            data: {
                act: 'edit',
                path: self.attr('href'),
                content: $('textarea', clone).val(),
            },
            type: 'POST',
            success: function(result) {
                add_msg(result.msg, 'EDIT', result.status ? 'alert-success' : 'alert-danger');
                browse(PATH);
            },
            error: function(jqXHR, status) {
                $('#preloader').remove()
                add_msg(status, 'AJAX', 'alert-danger');
            }
        });
    });
}

function modal_move(e) {

    e.preventDefault();

    var clone = $('div#move').clone(true),
        self = $(this);

    clone.modal('show');
    clone.on('hidden', function() {
        clone.remove();
    });
    clone.on('shown', function() {
        $('#filemovewbrowser', clone).addLoader();
    });

    var dest = $('input#move-dst', clone),
        simplepath = $('ol#breadcrumb').data('simplepath') + self.data('entry').name;
    dest.val(simplepath);
    $('input#move-src', clone).val(simplepath);


    var DIRPATH = PATH;
    console.log(DIRPATH);
    var dirbrowse = function(path) {
        
        $.ajax({
            url: window.location.href + '&p=' + path,
            cache: false,
            dataType: 'json',
            success: function(result) {
                $('#preloader').remove()
                if (result.status) {

                    DIRPATH = path;
                    if (result.path.length)
                        result.entries.splice(0, 0, {
                            id: result.path[result.path.length - 1].parent,
                            name: '..',
                            type: 'folder'
                        })
                    var simplepath = 'data/';
                    for (var i = 0; i < result.path.length; i++) {
                        simplepath += result.path[i].name + '/';
                    }
                    dest.data('simplepath', simplepath).change();
                    dir_content(result.path, result.entries);
                } else
                    add_msg(result.msg, 'PHP', 'alert-danger');
            },
            error: function(jqXHR, status) {
                $('#preloader').remove()
                add_msg(status, 'AJAX', 'alert-danger');
            }
        });
    };
    var dir_content = function(path, files) {
        var table = $('table#filemovewbrowser', clone);
        table.empty();

        for (var i = 0; i < files.length; i++) {
            var f = $.extend({}, files[i]);
            if (f.type == 'folder') {
                f.icon = 'icon-folder-close';
                f.name = $('<a />').attr('href', f.id).text(f.name).click(function(e) {
                    e.preventDefault();
                    dirbrowse($(e.target).attr('href'), f.name);
                });
                f.edit = '';

                table.append(
                    $('<tr />').append(
                    $('<td />').append('<i class="' + f.icon + '"></i> ', f.name),
                    $('<td />').text(f.size),
                    $('<td />').text(f.date),
                    $('<td />').text(f.perm)
                    )
                    );
            }
        }
    };
    dest.bind('keyup change input', function() {
        var self = $(this),
            path = self.data('simplepath') || 'data/',
            val = self.val();

        if (val == path || val == path.substr(0, path.length - 1)) {
            self.val(path);
        } else {
            val = val.replace(/[\\/]$/, '').split(/[\\/]/).pop();
            self.val(path + val);
        }

    });
    dirbrowse(DIRPATH);


    $('a.submit', clone).click(function(e) {
        $('#filemanager').addLoader()
        $.ajax({
            url: window.location.href,
            cache: false,
            dataType: 'json',
            data: {
                act: 'move',
                src: self.attr('href'),
                dst: DIRPATH,
                name: dest.val().split(/[\\/]/).pop()
            },
            type: 'POST',
            success: function(result) {
                add_msg(result.msg, 'MOVE', result.status ? 'alert-success' : 'alert-danger');
                browse(PATH);
            },
            error: function(jqXHR, status) {
                $('#preloader').remove()
                add_msg(status, 'AJAX', 'alert-danger');
            }
        });
    });

}




// -------------------------------------------------- TOOLBOX BUTTONS
$('div#tools a#upload-button').click(function(e) {
    e.preventDefault();
    $('div#upload input#upload-path').val(PATH);
    var clone = $('div#upload').clone(true);
    clone.modal('show');
    clone.on('hidden', function() {
        clone.remove();
    });
    $('a.submit', clone).click(function(e) {
        $('#filemanager').addLoader()
        $.ajax({
            url: window.location.href,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            data: new FormData($('form', clone)[0]),
            type: 'POST',
            success: function(result) {
                $('div#progress > div.bar').attr('progres','100%').animate({width: '100%'}, {complete: function() {
                        $('div#progress').fadeOut();
                    }});
                if (result.success)
                    for (var i = 0; i < result.success.length; i++)
                        add_msg(result.success[i], 'Upload', 'alert-success');
                if (result.errors)
                    for (var i = 0; i < result.errors.length; i++)
                        add_msg(result.errors[i], 'Upload', 'alert-danger');
                browse(PATH);
            },
            error: function(jqXHR, status) {
                $('div#progress').hide();
                add_msg(status, 'AJAX', 'alert-danger');
            },
            xhr: function() {
                var x = $.ajaxSettings.xhr();
                if (x.upload)
                    x.upload.addEventListener('progress', progress_bar, false);
                return x;
            }
        });
        $('#filemanager').addLoader()
        $('div#progress div.bar').css('width', 0);
        $('div#progress').show();
        $('div#progress').fadeIn(function() {
            $('div#progress div.bar').css('width', '10%').attr('progres','10%');
        });
    });
});

var dropzone = new Dropzone("div.filevewport", {
    url: window.location.href,
    addRemoveLinks: false,
    createImageThumbnails: false,
    uploadMultiple: true,
    paramName: 'files',
    previewsContainer: '#dropzonehide'
})
dropzone.on('sendingmultiple', function(file, xhr, data) {
    $('#filemanager').addLoader()
    data.append('act', 'upload');
    data.append('path', PATH);
    var bar = $('div#progress div.bar');
    bar.css('width', 0).attr('progres','0%');
    $('div#progress').fadeIn(function() {
        if(bar.attr('progres') == '0%')
            bar.css('width', '10%').attr('progres','10%');
    });

});
dropzone.on('success', function(file, result) {
    $('div#progress > div.bar').attr('progres','100%').animate({width: '100%'}, {complete: function() {
            $('div#progress').fadeOut();
        }});
    result = JSON.parse(result);
    if (result.success)
        for (var i = 0; i < result.success.length; i++)
            add_msg(result.success[i], 'Upload', 'alert-success');
    if (result.errors)
        for (var i = 0; i < result.errors.length; i++)
            add_msg(result.errors[i], 'Upload', 'alert-danger');
    browse(PATH);
});
dropzone.on('error', function(file, status, xhr) {
    $('#preloader').remove()
    $('div#progress').hide();
    add_msg(status, 'AJAX', 'alert-danger');
});
dropzone.on('uploadprogress', function(file, progress, bytesSent) {
    progress = progress < 10 ? 10 : Math.round(progress);
    $('div#progress > div.bar').css('width', progress + '%').attr('progres',progress + ' %');
});
dropzone.on('dragstart', function(e) {
    console.log('dragstart');
    $('.filevewport').addClass('drop-zone');
});
dropzone.on('dragend', function(e) {
    console.log('dragend');
    $('.filevewport').removeClass('drop-zone');
});

$('div#tools a#new-file-button, div#tools a#new-folder-button').click(function(e) {
    e.preventDefault();
    var type = $(this).is('#new-file-button') ? 'touch' : 'mkdir';
    $('div#new input#new-type').val(type);
    $('div#new input#new-path').val(PATH);

    var clone = $('div#new').clone(true);
    clone.modal('show');
    clone.on('hidden', function() {
        clone.remove();
    });
    $('a.submit', clone).click(function(e) {
        $('#filemanager').addLoader()
        $.ajax({
            url: window.location.href,
            cache: false,
            dataType: 'json',
            data: {
                name: $('input#new-name', clone).val(),
                path: $('input#new-path', clone).val(),
                act: type
            },
            type: 'POST',
            success: function(result) {
                add_msg(result.msg, 'NEW', result.status ? 'alert-success' : 'alert-danger');
                browse(PATH);
            },
            error: function(jqXHR, status) {
                $('#preloader').remove()
                add_msg(status, 'AJAX', 'alert-danger');
            }
        });
    });
});


$('div#tools a#refresh-button').click(function(e) {
    browse(PATH);
});

$('div#tools a#clear-msgbox-button').click(function(e) {
    $('div#msgbox').empty();
});
