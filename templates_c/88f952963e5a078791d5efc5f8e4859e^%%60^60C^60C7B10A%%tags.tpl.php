<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from services/tags.tpl */ ?>
<div id="tagsCont">
    <?php $_from = $this->_tpl_vars['product']['tags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tag']):
?>
        <span class="tag"> <a><?php echo $this->_tpl_vars['tag']; ?>
</a> |<a class="cls">x</a></span>
    <?php endforeach; endif; unset($_from); ?>
    <label style="position:relative" for="tagsin">
        <em style="position:absolute"><?php echo $this->_tpl_vars['lang']['tags']; ?>
</em>
        <input id="tagsin">
        <ul></ul>
    </label>
    <div class="clear"></div>
</div>
<?php echo '
    <script type="text/javascript">
        $(function () {

            HBTags.bindTagsActions(\'#tagsCont\', 10,
                    function (tag) {
                        $.post(\'?cmd=tags&action=addtag&rel_type=Product\', {tag: tag, id: $(\'#product_id\').val()}, function (data) {
                        });
                    },
                    function (tag) {
                        $.post(\'?cmd=tags&action=removetag&rel_type=Product\', {tag: tag, id: $(\'#product_id\').val()}, function (data) {

                        });
                    });
        });

    </script>
'; ?>