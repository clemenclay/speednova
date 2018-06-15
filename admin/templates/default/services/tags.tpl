<div id="tagsCont">
    {foreach from=$product.tags item=tag}
        <span class="tag"> <a>{$tag}</a> |<a class="cls">x</a></span>
    {/foreach}
    <label style="position:relative" for="tagsin">
        <em style="position:absolute">{$lang.tags}</em>
        <input id="tagsin">
        <ul></ul>
    </label>
    <div class="clear"></div>
</div>
{literal}
    <script type="text/javascript">
        $(function () {

            HBTags.bindTagsActions('#tagsCont', 10,
                    function (tag) {
                        $.post('?cmd=tags&action=addtag&rel_type=Product', {tag: tag, id: $('#product_id').val()}, function (data) {
                        });
                    },
                    function (tag) {
                        $.post('?cmd=tags&action=removetag&rel_type=Product', {tag: tag, id: $('#product_id').val()}, function (data) {

                        });
                    });
        });

    </script>
{/literal}