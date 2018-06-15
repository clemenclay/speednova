<tr>
    <td>
        <label><b>Groups</b></label>
    </td>
    <td>
        <div id="tagsInput" class="left ticketsTags">
            {foreach from=$entry.config.BrandGroups item=group}
                <span class="tag"><a>{$group}</a> <a class="cls">x</a></span>
                    {/foreach}
            <label style="position:relative" for="tagsin" class="input">
                <em style="position:absolute">Groups</em>
                <input id="tagsin" autocomplete="off" style="width: 80px">
                <ul style="overflow-y:scroll; max-height: 100px; bottom: 23px; left: -7px"></ul>
            </label>
        </div>
        <small id="taginpdesc">Type your group name and press "enter" key to add it.</small>
        <div id="tags" style="display: none">
            {foreach from=$entry.config.BrandGroups item=group}
                <input type="hidden" name="config[BrandGroups][]" value="{$group}" />
            {/foreach}
        </div>
        {literal}
            <style>
                #taginpdesc{
                    display: block;
                    color: #888;
                    clear: both;
                }
                #tagsInput{
                    position:relative; 
                    width:400px; 
                    min-height: 22px;
                    line-height: 16px;
                    padding: 2px 0 1px 2px; 
                    border: 1px solid #ddd; 
                    background: #fff; 
                    margin-right: 3px; 
                    overflow: visible
                }
                .ticketsTags span {
                    font-size: 11px;
                }
                .ticketsTags span a.cls {
                    display: inline-block;
                    font-family: monospace;
                    background: #354A5F;
                    padding: 2px 4px 2px;
                    border-radius: 0 3px 3px 0;
                    margin: -1px -3px -2px 2px;
                }
            </style>
            <script type="text/javascript">
                $(function () {

                    function insertTags(to, tags, special, preserve, wraperclass) {
                        if (wraperclass === undefined)
                            wraperclass = 'tag';
                        var cls = '.' + wraperclass;
                        var old = {};
                        if (typeof preserve == 'undefined') {
                            $('span' + cls + ':not(:has(a:first-child[class]))', to).remove();
                            $('span' + cls, to).each(function () {
                                old[$(this).find('a:first-child').text()] = $(this).detach()
                            });
                        }
                        $.each(tags, function (i) {
                            if (typeof old[tags[i]] == 'object') {
                                if ($('span' + cls + ' a:first-child[class]', to).length)
                                    $('span' + cls + ':has(a:first-child[class]):last', to).after(old[tags[i]]);
                                else
                                    $(to).prepend(old[tags[i]]);
                                return;
                            }
                            var clas = '';
                            if (typeof special != 'undefined' && typeof special[tags[i]] != 'undefined') {
                                clas = 'class="' + special[tags[i]] + '"'
                            }
                            $('label', to).before('<span class="' + wraperclass + '"><a ' + clas + '>' + tags[i] + '</a> <a class="cls">x</a></span>');
                        });
                    }

                    function bindTagsActions(root, tip, oninsert, onremove) {

                        $(root + ' input').bind('focus click', function () {
                            $(this).css({
                                filter: 'alpha(opacity=100)',
                                opacity: '1'
                            });
                        }).blur(function () {
                            if (this.value.length == 0)
                                $(this).css({
                                    filter: 'alpha(opacity=80)',
                                    opacity: '0.8'
                                });
                        });

                        $(root).undelegate('input', 'keydown').delegate('input', 'keydown', function (event) {
                            if (event.keyCode == 13) {
                                event.preventDefault();
                                return false;
                            }
                        }).undelegate('input', 'keyup').delegate('input', 'keyup', function (e) {
                            if (this.value.length == 0)
                                return;
                            if (e.which == 13) {
                                e.preventDefault();
                                var tag = $.trim(this.value).replace(/[#$%^&*(){}~`\[\]:;"'?|+\/><,]/g, '');
                                if (tag.length == 0)
                                    return;
                                if ($(root + ' span a:first-child').filter(function () {
                                    return this.innerHTML == tag
                                }).length > 0)
                                    return;
                                tag = $('<i/>').text(tag).html();
                                insertTags(root, [tag], [], true);

                                if (typeof oninsert == 'function')
                                    oninsert(tag);
                                this.value = '';
                            }
                            return false;
                        });
                        $(root + ' ul').undelegate('li', 'click').delegate('li', 'click', function () {
                            var ev = jQuery.Event("keyup");
                            ev.which = 13;
                            $(root + ' input').val(this.innerHTML).trigger(ev);

                        });
                        $(root).undelegate('span a:last-child', 'click').delegate('span a:last-child', 'click', function () {
                            $(this).parent().remove();
                            if (typeof onremove == 'function')
                                onremove($(this).siblings().text());
                        });
                        $(document).undelegate(root, 'click').delegate(root, 'click', function (e) {
                            if ($(e.target).is(root))
                                $('label input', this).focus();
                        });
                    }

                    bindTagsActions('#tagsInput', 0,
                        function (tag) {
                            $('#tags').append('<input type="hidden" name="config[BrandGroups][]" value="' + tag + '" />');
                            repozition('#tagsInput');
                        },
                        function (tag) {
                            repozition('#tagsInput');
                            $('#tags input[value="' + tag + '"]').remove();
                        }
                    );

                    function repozition(el) {
                        var self = $(el);
                        $(el + ' ul').each(function () {
                            var ul = $(this),
                                label = $(el + ' label');
                            if (label.length) 
                                ul.css({
                                    left: -label.position().left - 2,
                                    bottom: self.height() + 2
                                });
                        })
                    }
                    repozition();
                });
            </script>
        {/literal}
    </td>
</tr>