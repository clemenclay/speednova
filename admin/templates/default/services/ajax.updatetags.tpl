
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="active picked">
                <a href="#"><span class="ico money">Update tags</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2"><div class="haveitems" style="height: 0px;"></div></div>
</div>
<div class="nicerblu">
    <span class="tag-filter-container"></span>
    <a class="tag-filter-reset none btn btn-xs btn-primary" href="#">Show all</a>
</div>

<form id="serializeit" action="" method="post">
    <input type="hidden" name="make" value="bulk" />
    <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
        <tbody>
        <tr>
            <th width="20"><input type="checkbox" id="product_check"/></th>
            <th >{$lang.Name}</th>
            <th width="130">{$lang.Accounts}</th>
            <th width="30"></th>
            <th width="100">&nbsp;</th>
        </tr>
        </tbody>
    </table>
    <ul id="grab-sorter" style="width:100%">
        {include file='services/ajax.category.tpl' priceup=true}
    </ul>

    <div id="tagsBox" style="display: none;">{foreach from=$alltags item=tag}<span class="tag">{$tag}</span>{/foreach}</div>
    <div class="nicerblu">
        <table width="100%" cellspacing="0" cellpadding="6">
            <tbody class="section">
            <tr>
                <td width="100" align="right"><strong>Add tags</strong></td>
                <td>
                    <div id="tagsInput" class="left ticketsTags" style="position:relative; width:400px;line-height: 14px; padding: 3px 0 0 5px; border: 1px solid #ddd; background: #fff; margin-right: 3px; overflow: visible">

                        <label style="position:relative" for="tagsin" class="input">
                            <em style="position:absolute">{$lang.tags}</em>
                            <input id="tagsin" autocomplete="off" style="width: 80px">
                            <ul style="overflow-y:scroll; max-height: 100px; bottom: 23px; left: -7px"></ul>
                        </label>
                    </div>
                    <div id="tags" style="display: none">

                    </div>

                </td>
            </tr>
            <tr>
                <td align="right"><strong>Remove tags</strong></td>
                <td>
                    <div id="tagsInput2" class="left ticketsTags" style="position:relative; width:400px;line-height: 14px; padding: 3px 0 0 5px; border: 1px solid #ddd; background: #fff; margin-right: 3px; overflow: visible">

                        <label style="position:relative" for="tagsin2" class="input">
                            <em style="position:absolute">{$lang.tags}</em>
                            <input id="tagsin2" autocomplete="off" style="width: 80px">
                            <ul style="overflow-y:scroll; max-height: 100px; bottom: 23px; left: -7px"></ul>
                        </label>
                    </div>
                    <div id="tags2" style="display: none">

                    </div>
                </td>
            </tr>

            </tbody>
        </table>
        <div style="padding: 6px;">
            <a class="new_dsave new_menu" href="#" onclick="return updatePrices();"  >
                <span>Update tags</span>
            </a>
            <div class="clear"></div>
        </div>
    </div>

    {securitytoken}
    {literal}
    <script type="text/javascript">

        HBTags.bindFilter('.entry','.tag-filter-container','.tag-filter-reset');
        HBTags.bindTagsActions('#tagsInput', 0,
                function(tag){$('#tags').append('<input type="hidden" name="tags[]" value="'+tag+'" />'); repozition('#tagsInput');},
                function(tag){repozition('#tagsInput');$('#tags input[value="'+tag+'"]').remove(); }
        );
        HBTags.bindTagsActions('#tagsInput2', 0,
                function(tag){$('#tags2').append('<input type="hidden" name="tags_rem[]" value="'+tag+'" />'); repozition('#tagsInput2');},
                function(tag){repozition('#tagsInput2');$('#tags2 input[value="'+tag+'"]').remove(); }
        );
        function repozition(el){
            $(el+' ul').css({left: - $(el+' label').position().left - 2, bottom:$(el).height()+2});
        }
        function updatePrices() {
            if ($('.product_check:checked').length == 0) {
                alert('You have to select some products to update');
                return false;
            }
            $('#serializeit').append('<input type="hidden" name="action_type" value="' + ($('.list-1 li.active').index() == 0 ? 'update' : 'new') + '" />').submit();
            return false;
        }
        $('#product_check').click(function () {
            if (this.checked) {
                $('.product_check').attr('checked', 'checked').prop('checked', true);
            } else
                $('.product_check').removeAttr('checked').prop('checked', false);
        });
        $('.product_check').click(function () {
            if ($('.product_check:not(:checked)').length == 0) {
                $('#product_check').attr('checked', 'checked').prop('checked', true);
            } else
                $('#product_check').removeAttr('checked').prop('checked', false);
        });

    </script>
    {/literal}
</form>