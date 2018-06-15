<div id="boxcomfolder">
    <div class="well-sm" id="tools">
        <a class="btn btn-default" id="upload-button"><i class="icon-upload"></i> Upload</a>
        <a class="btn btn-default" id="new-file-button"><i class="icon-file"></i> New File</a>
        <a class="btn btn-default" id="new-folder-button"><i class="icon-folder-close"></i> New folder</a>
        <a class="btn btn-default" id="refresh-button"><i class="icon-refresh"></i> Refresh</a>
        <a class="btn btn-default" id="clear-msgbox-button"><i class="icon-remove-circle"></i> Clear Messages</a>
    </div>

    <!-- breadcrumb -->
    <ol class="breadcrumb" id="breadcrumb"></ol>

    <!-- file manager view -->
    <div class="filevewport">
        <table class="table table-hover table-condensed" id="filemanager"></table>
        <div class="no-files well">
            <i class="cloud-upload"></i>
            <p>There are no files in this directory</p>
        </div>
    </div>

    <!-- footnote -->
    <ul id="footnote" class="list-inline">
        <li><i class="icon-pencil"></i> Edit</li>
        <li><i class="icon-arrow-right"></i> Move / Rename</li>
        <li><i class="icon-remove"></i> Remove</li>
    </ul>

    <!-- progress bar -->
    <div id="progress" class="progress progress-striped active hide">
        <div class="bar">
        </div>
    </div>

    <!-- message box -->
    <div id="msgbox"></div>


</div>
<!-- new modal -->
<div id="new" class="modal fade">
    <div class="modal-header">
        <h3>New</h3>
    </div>
    <div class="modal-body">
        <input type="hidden" id="new-type" />
        <input type="hidden" id="new-path" />
        <label for="new-path">Entry new file / folder name</label>
        <input type="text" class="form-control" id="new-name" />
    </div>
    <div class="modal-footer">
        <a class="submit btn btn-primary" data-dismiss="modal"><i class="icon-ok icon-white"></i></a>
        <a class="btn btn-default" data-dismiss="modal"><i class="icon-remove"></i></a>
    </div>
</div>

<!-- remove modal -->
<div id="remove" class="modal fade">
    <div class="modal-header">
        <h3>Remove</h3>
    </div>
    <div class="modal-body">
        <label for="remove-path">Remove this file / folder</label>
        <input type="text" class="form-control" id="remove-path" readonly />
    </div>
    <div class="modal-footer">
        <a class="submit btn btn-danger" data-dismiss="modal"><i class="icon-ok icon-white"></i></a>
        <a class="btn btn-default" data-dismiss="modal"><i class="icon-remove"></i></a>
    </div>
</div>
<!-- upload modal -->
<div id="upload" class="modal fade">
    <div class="modal-header">
        <h3>Upload</h3>
    </div>
    <div class="modal-body">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="act" value="upload" />
            <input type="hidden" name="path" id="upload-path" />
            <input type="file" name="files[]" multiple />
            <p class="help-block">You can select multiple files.</p>
        </form>
    </div>
    <div class="modal-footer">
        <a class="submit btn btn-primary" data-dismiss="modal"><i class="icon-ok icon-white"></i></a>
        <a class="btn btn-default" data-dismiss="modal"><i class="icon-remove"></i></a>
    </div>
</div>

<!-- move modal -->
<div id="move" class="modal fade">
    <div class="modal-header">
        <h3>Move / Rename</h3>
    </div>
    <div class="modal-body">
        <label for="move-src">From</label>
        <input type="text" class="form-control span5" id="move-src" readonly/>
        <label for="move-dst">To</label>
        <input type="text" class="form-control span5" id="move-dst"/>
        <table class="table table-hover table-condensed" id="filemovewbrowser"></table>
    </div>
    <div class="modal-footer">
        <a class="submit btn btn-primary" data-dismiss="modal"><i class="icon-ok icon-white"></i></a>
        <a class="btn btn-default" data-dismiss="modal"><i class="icon-remove"></i></a>
    </div>
</div>

<!-- Edit modal -->
<div id="editor" class="modal fade">
    <div class="modal-header">
        <h3>Edit</h3>
    </div>
    <div class="modal-body">
        <textarea id="content"></textarea>
    </div>
    <div class="modal-footer">
        <a class="submit btn btn-primary" data-dismiss="modal"><i class="icon-ok icon-white"></i></a>
        <a class="btn btn-default" data-dismiss="modal"><i class="icon-remove"></i></a>
    </div>
</div>
<div id="dropzonehide" style="display: none;"></div>
<link href="{$widgetdir_url}style.css" rel="stylesheet" type="text/css"/>
<script src="{$widgetdir_url}dropzone.js" type="text/javascript"></script>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>
<script type="text/javascript">
    var PATH = {$dir_id};
    show_content({$path}, {$entries});
</script>

