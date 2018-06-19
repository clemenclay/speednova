<?php /* Smarty version 2.6.26, created on 2018-06-18 16:21:14
         compiled from C:%5Cxampp%5Chtdocs%5Cspeednova%5Cincludes/modules/Other/hbextras/admin/ajax.widget.tpl */ ?>
<div id="hb_extras_content"></div>
<?php echo '
<script>
    function bindHBExtras(){
        ajax_update("?cmd=module&module=hbextras&do=getrss",{},"#hb_extras_content");
    }
    appendLoader("bindHBExtras");
</script>

'; ?>