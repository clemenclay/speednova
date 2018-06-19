<?php /* Smarty version 2.6.26, created on 2018-06-19 15:28:54
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