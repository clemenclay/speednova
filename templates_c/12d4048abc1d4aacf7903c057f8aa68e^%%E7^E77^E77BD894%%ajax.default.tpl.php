<?php /* Smarty version 2.6.26, created on 2018-06-18 16:21:15
         compiled from C:%5Cxampp%5Chtdocs%5Cspeednova%5Cincludes%5Cmodules%5COther%5Cautoupgrade%5Ctemplates%5Cajax.default.tpl */ ?>
<iframe src="https://hostbillapp.com/latest/" frameborder="0" border="0" style="width:650px;height:500px" />
<script type="text/javascript">
    <?php echo '

    $(\'#facebox .footer\').append(
            \'<div class="left"><input type="checkbox" id="dontshowmeagain" name="dontshowmeagain"> <label for="dontshowmeagain">Dont show this message again</label></div>\'
    );
    $(document).bind(\'close.facebox\',function(){
        if ($("#dontshowmeagain").is(":checked")) {
            ajax_update(\'?cmd=autoupgrade&action=dismiss\');
        }
    });
    '; ?>

</script>