<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>Clients</span></a>
            </li>
            <li class="{if $action == 'invoices'}active{/if}">
                <a {if $action != 'invoices'}href="?cmd={$modulename}&action=invoices"{/if}><span>Invoices</span></a>
            </li>
            <li class="{if $action == 'transactions'}active{/if} last">
                <a {if $action != 'transactions'}href="?cmd={$modulename}&action=transactions"{/if}><span>Transactions</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1 haveitems">
            <ul>
                <li class=""><a href="#export" class="exporter" href="#" queue="push" name="export"><span>Export selected</span></a></li>
                <li>
                    <form action="" method="POST">
                        From: 
                        <div id="datefilter" style="display:inline-block; vertical-align: middle">
                            <input type="text" class="haspicker" 
                                   name="filter[from]"  
                                   value="{$currentfilter.from}"/>
                        </div>
                        To
                        <div id="datefilter" style="display:inline-block; vertical-align: middle">
                            <input type="text" class="haspicker" 
                                   name="filter[to]"  
                                   value="{$currentfilter.to}"/>
                        </div>
                        <button type="submit" class="btn btn-success btn-sm">Filter</button>
                    </form>
                </li>
                <li>
                    <a href="?cmd=quickbooksonline&action={$action}&resetfilter=1" style="{if $currentfilter}display:inline; color: red{else}display:none{/if}"  class="freseter">{$lang.filterisactive}</a>
                </li>
            </ul>
        </div>
    </div>
</div>
{literal}
    <script type="text/javascript" >
        var initload = 0;
        function stack_refresh(resp) {
            if (resp.match('"STACK":0')) {
                $.get(window.location.href, function (resp) {
                    var resp = parse_response(resp);
                    $('#updater').html(resp);
                })
            }
        }

        function pops() {
            $('#taskMGR').taskQuickLoadShow();
            $.post(window.location.href, {
                stack: 'pop'
            }, function (resp) {

                $('#taskMGR').taskQuickLoadHide();
                if (initload) {
                    stack_refresh(resp);
                }
                initload = 1;
                var resp = parse_response(resp);
            });
            setTimeout(function () {
                if (initload == 0) {
                    $('#taskMGR').taskMgrProgress(1);
                }
            }, 400);
        }

        $(function () {
            var checkall = $('#checkall');

            checkall.on('click', function () {
                $('#updater input').prop('checked', checkall.is(':checked'));
            })
            $('#updater').on('click update', 'input[name="selected[]"]', function () {
                var checked = true;
                $('#updater input[name="selected[]"]').each(function () {
                    if (!$(this).is(':checked')) {
                        checked = false;
                        return false;
                    }
                })
                checkall.prop('checked', checked);
            })

            $('.exporter').click(function () {
                $('#updater').addLoader();
                $('#checkall').attr('checked', false);

                var pushs = '';
                if ($(this).attr('queue') == 'push')
                    pushs = 'push';

                var post = $('#updater input[name="selected[]"]:checked').serializeObject();
                post.stack = pushs;

                $.post(window.location.href, post, function (data) {
                    stack_refresh(data);

                    var resp = parse_response(data);
                    if (resp.lengh > 10)
                        $('#updater').html(resp);
                });

                return false;
            });
            var list = $('#currentlist');
            list.data('base', list.attr('href'));

            if ($('.searchon').length) {
                $('#content_tb').addClass('searchon');
            }
        })

    </script>
{/literal}
<div >
    <div class="right" style="padding: 5px;">
        <div class="pagination"></div> 
    </div>
    <a href="?cmd=quickbooksonline&action={$action}" id="currentlist" style="display:none"></a>
    <table class="glike hover" width="100%" cellspacing=0>
        <thead>
            <tr>
                <th><input type="checkbox" id="checkall"></th>
                    {if $action == 'invoices'}
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=id|ASC" class="sortorder">Invoice #</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=lastname|ASC" class="sortorder">Client Name</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=date|ASC" class="sortorder">Invoice Date</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=duedate|ASC" class="sortorder">Due Date</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=total|ASC" class="sortorder">Total</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=status|ASC" class="sortorder">Status</a></th>
                    {elseif $action == 'transactions'}
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=id|ASC" class="sortorder">Transaction #</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=lastname|ASC" class="sortorder">Client Name</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=date|ASC" class="sortorder">Date</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=module|ASC" class="sortorder">Gateway</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=in|ASC" class="sortorder">In</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=out|ASC" class="sortorder">Out</a></th>
                    {else}
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=id|ASC" class="sortorder">Client #</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=firstname|ASC" class="sortorder">First Name</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=lastname|ASC" class="sortorder">Last Name</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=email|ASC" class="sortorder">Email</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=company|ASC" class="sortorder">Company Name</a></th>
                    <th><a href="?cmd=quickbooksonline&action={$action}&orderby=datecreated|ASC" class="sortorder">Created</a></th>
                    {/if}

                <th style="width: 60px"></th>
            </tr>
        </thead>
        <tbody id="updater">
            {include file="ajax.default.tpl"}
        </tbody>
    </table>
    <div class="right" style="padding: 5px;">
        <div class="pagination"></div> 
    </div>
</div>
