{foreach from=$widgets item=wig}
    {if $widget.name == $wig.name}
        {assign value=$wig.location var=widgeturl}
    {/if}
{/foreach}
<h3>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h3>


<p>{$widgetopt.wdescription}</p>

<table class="table table-striped accountlist">
    <thead>
        <tr class="form-inline">
            <th colspan="2">
                Domain
                <select name="domain" id="zcsdomain">
                    {foreach from=$domains item=domain}
                        <option value="{$domain.remote_id}" {if $domain_id == $domain.remote_id}selected="selected"{/if}> {$domain.domain} </option>
                    {foreachelse}
                        <option> - </option>
                    {/foreach}
                </select>
            </th>
            <th>Members</th>
            <th style="text-align: right">
                {if $domains && ((!$limits.lists) || ($limits.lists.left > 0))}
                    <a href="#new" id="newacc" class="btn btn-success"  data-domainid="{$domain.remote_id}" data-domain="{$domain.domain}" >
                        <i class="icon icon-plus icon-white"></i> New List
                    </a>
                {else}
                    <a class="btn btn-success disabled" >
                        <i class="icon icon-plus icon-white"></i> New List
                    </a>
                {/if}
            </th>
        </tr>
    </thead>
    <tbody id="accountlist">
        {include file="../../`$widgeturl`ajax.zcs_distlist.tpl"}
    </tbody>
</table>
<p style="text-align: right">
    {if $limits.lists.left > 0}
        You can create {$limits.lists.left} additional distribution list(s)<br/>
    {/if}
</p>

<div class="modal hide fade" id="accoount">
    <div class="modal-header">
        <a href="#close" class="xclose pull-right"><i class="icon icon-remove" aria-hidden="true">&times;</i></a>
        <h3>Account</h3>
    </div>
    <form class="form-horizontal" method="post" action="" style="margin: 0" id="dlistform">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="account" id="wdo">
            <input type="hidden" name="domain_id" class="parent">
            <input type="hidden" name="id" class="parentac">

            <div class="control-group">
                <label class="control-label" for="inputFirst">List Name</label>
                <div class="controls">
                    <input type="text" id="inputFirst" name="displayName" placeholder="List Display Name">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">{$lang.email}</label>
                <div class="controls">
                    <input type="text" id="inputEmail" name="email" placeholder="{$lang.email}" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDescription">{$lang.Description}</label>
                <div class="controls">
                    <textarea id="inputDescription" name="description" placeholder="{$lang.description}"></textarea>
                </div>
            </div>
            <h3>Members</h3>
            {if $limits.members && $limits.members.limit >= 0}
                <p>
                    You can assign {$limits.members.limit} member(s) for this list
                </p>
                <input id="memberlimit" value="{$limits.members.limit}" type="hidden" />
            {else}
                <input id="memberlimit" value="-1" type="hidden" />
            {/if}
            <div class="control-group">

                {*}<select id="acdomainlist" style="height: 28px; width: 100%; display: none">
                {foreach from=$domains item=domain}
                <option value="{$domain.remote_id}" {if $domain_id == $domain.remote_id}selected="selected"{/if}> {$domain.domain} </option>
                {foreachelse}
                <option> - </option>
                {/foreach}
                </select>{*}
                <span class="pull-right">
                    <button class="btn" id="delmember">Remove Selected</button>
                </span>
                
                <select multiple="multiple" id="aclist" style="height: 100px; width: 100%; display: none">
                    {*foreach from=$accounts item=acc}<option value="{$acc.name}">{$acc.name}</option>{/foreach*}
                </select>
                
                <div class="input-append form-horizontal">
                    <input type="text" id="acinput" class="span3"><button class="btn" id="addmember">Add</button>
                </div>

            </div>
            <div class="control-group">
                <select name="members" id="memberlist" style="height: 128px; width:100% " multiple="multiple"  >

                </select>
            </div>

            {securitytoken}

        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="buttonSubmit">Save</button>
        </div>
    </form>
</div>


{literal}
    <link href="includes/modules/Hosting/zimbra/widgets/zcs_distlist/styles.css" rel="stylesheet" type="text/css"/>
    <script src="includes/modules/Hosting/zimbra/widgets/zcs_distlist/jquery.autocomplete.min.js" type="text/javascript"></script>
    <style>
        table.accountlist th, table.accountlist td{
            line-height: 24px;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            var m = $('.modal');
            m.each(function() {
                var self = $(this);
                self.detach().appendTo('body');
                self.find('.xclose').click(function() {
                    self.modal('hide');
                    return false;
                });

                self.find('#inputEmail').on('keyup input', function(e) {
                    if (e.type == 'keyup' && (e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40))
                        return false;

                    var i = $(this),
                        cursor = getInputSelection(i[0]),
                        r = new RegExp('@.*$|' + i.data('domain') + '$|[^a-zA-Z0-9.+-_~]+', 'g'),
                        val = i.val().replace(r, ''),
                        start = cursor.start > val.length ? val.length : cursor.start;

                    i.val(val + '@' + i.data('domain'));

                    setInputSelection(i[0], start, start);
                })
            })

            $("#zcsdomain").change(function() {
                var self = $(this);
                $('#newacc').data('domainid', self.val()).data('domain', self.children(':selected').text().trim());
                $('#accountlist').addLoader();
                $.post(window.location.url, {wdo: 'list', domain_id: self.val()}, function(data) {
                    data = parse_response(data);
                    $('#accountlist').html(data);
                    $('#accountlist [data-toggle="tooltip"]').tooltip();
                });
            });

            $('#acdomainlist').change(function() {
                var self = $(this),
                    members = $('#memberlist');

                self.parent().addLoader();
                $.post(window.location.url, {wdo: 'acclist', domain_id: self.val()}, function(data) {
                    data = parse_response(data);
                    $('#aclist').html(data);
                    $('#preloader').remove();
                });
            })

            $('#dlistform').submit(function() {
                var members = $('#memberlist'),
                    form = $(this);
                members.children().each(function() {
                    var self = $(this);
                    form.append('<input name="members[]" value="' + self.val() + '" type="hidden" />');
                });
            });
            
            var Hints = false;
            function loadHints(){
                if(Hints)
                    return false;
                
                Hints = true;
                $.get(window.location.href + '&wdo=acclist', function(data){
                    if(data.accounts)
                        $('#acinput').autocomplete('setOptions', {lookup: data.accounts});
                })
            }

            function addMember(email) {
                var members = $('#memberlist'),
                    limit = parseInt($('#memberlimit').val());

                if (members.find('[value="' + email + '"]').length)
                    return true;

                if (limit >= 0 && members.children().length >= limit) {
                    alert("List members limit reached");
                    return false;
                }
                members.append('<option value="' + email + '">' + email + '</option>');
                return true;
            }

            var autocomp = $('#acinput').autocomplete({
                lookup: $('#aclist option').map(function(e, el) {
                    return $(el).val()
                }).get(),
                onSelect: function(sugestion) {
                    addMember(sugestion.value);
                    $('#acinput').val('');
                }
            });

            $('#addmember').click(function() {
                //var list = $('#aclist');

                //list.children(':selected').each(function() {
                //    return addMember($(this).val());
                //});
                addMember($('#acinput').val());
                $('#acinput').val('');
                return false;
            })
            $('#delmember').click(function() {
                var members = $('#memberlist'),
                    self = $(this);

                members.children(':selected').each(function() {
                    var self = $(this);
                    self.remove();
                });
                return false;
            })

            $('#newacc').click(function(e) {
                e.preventDefault();
                var acc = $('#accoount'),
                    data = $(this).data(),
                    s = $('#slider');
                //acc.find('input, select').val('');
                acc.find('.parent').val(data.domainid);
                acc.find('.parentac').val('');

                if (acc.find('#wdo').val() != 'account') {
                    acc.find('input,select,textarea').val('');
                }

                acc.find('#wdo').val('account');

                acc.find('#inputEmail').data('domain', data.domain).prop('placeholder', 'example@' + data.domain).prop('readonly', false);
                loadHints();
                acc.modal();
                return false;
            })

            $('#accountlist').on('click', '.edit', function(e) {
                e.preventDefault();
                var acc = $('#accoount'),
                    data = $(this).data(),
                    members = $('#memberlist'),
                    s = $('#slider');

                acc.find('.parent').val(data.domainid);
                acc.find('.parentac').val(data.id);

                acc.find('#inputFirst').val(data.name);
                acc.find('#inputDescription').val(data.description);

                acc.find('#wdo').val('editaccount');

                acc.find('#inputEmail').data('domain', '').val(data.email).prop('readonly', true);
                members.empty();
                $.each(data.members.split(','), function() {
                    if (this.toString().length > 1)
                        members.append('<option value="' + this.toString() + '">' + this.toString() + '</option>');
                })
                loadHints();
                acc.modal();
                return false;
            });


            $('#newacc').data('domainid', $("#zcsdomain").val()).data('domain', $("#zcsdomain").children('[value=' + $("#zcsdomain").val() + ']').text().trim());
            $('[data-toggle="tooltip"]').tooltip();


            function getInputSelection(el) {
                var start = 0, end = 0, normalizedValue, range,
                    textInputRange, len, endRange;

                if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
                    start = el.selectionStart;
                    end = el.selectionEnd;
                } else {
                    range = document.selection.createRange();

                    if (range && range.parentElement() == el) {
                        len = el.value.length;
                        normalizedValue = el.value.replace(/\r\n/g, "\n");

                        textInputRange = el.createTextRange();
                        textInputRange.moveToBookmark(range.getBookmark());

                        endRange = el.createTextRange();
                        endRange.collapse(false);

                        if (textInputRange.compareEndPoints("StartToEnd", endRange) > -1) {
                            start = end = len;
                        } else {
                            start = -textInputRange.moveStart("character", -len);
                            start += normalizedValue.slice(0, start).split("\n").length - 1;

                            if (textInputRange.compareEndPoints("EndToEnd", endRange) > -1) {
                                end = len;
                            } else {
                                end = -textInputRange.moveEnd("character", -len);
                                end += normalizedValue.slice(0, end).split("\n").length - 1;
                            }
                        }
                    }
                }

                return {
                    start: start,
                    end: end
                };
            }

            var timeout = false;
            function updateTitle(elm, title) {
                if (title) {
                    if (timeout)
                        clearTimeout(timeout);
                    timeout = setTimeout(function() {
                        elm.attr('title', title);
                        if (typeof jQuery.fn.tooltip == 'function')
                            elm.tooltip({placement: 'right', animation: false}).tooltip('fixTitle').tooltip('enable');
                        if ($('.tooltip:visible').length) {
                            elm.tooltip('show');
                        }

                    }, 100);
                } else {
                    elm.removeAttr('title');
                    if (typeof jQuery.fn.tooltip == 'function')
                        elm.tooltip('hide').tooltip('disable');
                }
            }

            function offsetToRangeCharacterMove(el, offset) {
                return offset - (el.value.slice(0, offset).split("\r\n").length - 1);
            }

            function setInputSelection(el, startOffset, endOffset) {
                if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
                    el.selectionStart = startOffset;
                    el.selectionEnd = endOffset;
                } else {
                    var range = el.createTextRange();
                    var startCharMove = offsetToRangeCharacterMove(el, startOffset);
                    range.collapse(true);
                    if (startOffset == endOffset) {
                        range.move("character", startCharMove);
                    } else {
                        range.moveEnd("character", offsetToRangeCharacterMove(el, endOffset));
                        range.moveStart("character", startCharMove);
                    }
                    range.select();
                }
            }
        })
    </script>
{/literal}

