<article class="affiliates-container">
    <h2>{$lang.affiliate}</h2>
    <p>{$lang.affiliate_description}</p>





    <div class="flat-ui-tab">
        {include file='menus/affiliates.sub.tpl'}
        <div class="tab-content p-10">
            <div class="tab-pane active">

                <h4 class="mt-10 mb-15">{$lang.Statistics}</h3>


                    <table class="table table-striped table-aff-center" style="width: 100%">
                        <tr>
                            <td class="w20">{$lang.Commissions}:</td>
                            <td>{$stats.monthly_commision}</strong> / <strong>{$stats.total_commision}</strong> ({$lang.thismonth} / {$lang.total})</td>
                        </tr>
                        <tr>
                            <td class="w20">{$lang.referred} </td>
                            <td>{$stats.monthly_visits} / {$stats.total_visits} ({$lang.thismonth} / {$lang.total})</td>
                        </tr>
                        <tr>
                            <td class="w20">{$lang.singupreferred}</td>
                            <td>{$stats.monthly_singups} / {$stats.total_singups} ({$lang.thismonth} / {$lang.total})</td>
                        </tr>
                        <tr>
                            <td class="w20"><strong>{$lang.curbalance}</strong></td>
                            <td>{$affiliate.balance|price:$affiliate.currency_id}</td>
                        </tr>
                        <tr >
                            <td class="w20">{$lang.reflink}</td>
                            <td ><a style="font-weight:bold" href="{$system_url}?affid={$affiliate.id}">{$system_url}?affid={$affiliate.id}</a></td>
                        </tr>

                        {if $payout}
                            <tr>
                                <td>{$lang.withdrawinfo}</td>
                                <td><a href="{$ca_url}tickets/new/" class="btn btn-flat-primary btn-small"><i class="icon-ok-sign icon-white"></i> {$lang.payout}</a></td>
                            </tr>
                        {/if}
                    </table>
                    <h4 class="mt-10 mb-15">{$lang.options}</h4>
                    <table width="100%" border=0 class="table table-striped fullscreen form-horizontal options" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="right">{$lang.emailoncemonth}:</td>
                                <td >
                                    <input type="radio" value="1" name="sendreport" {if $affiliate.sendreport}checked="checked"{/if}/> {$lang.enable} &nbsp; &nbsp;
                                    <input type="radio" value="0" name="sendreport" {if !$affiliate.sendreport}checked="checked"{/if}/> {$lang.disable}
                                </td>
                            </tr>
                            {if $autopay}
                                <tr >
                                    <td align="right">{$lang.receivecommissionsauto}</td>
                                    <td >
                                        <select name="withdraw_method">
                                            <option {if $affiliate.withdraw_method==0}selected="selected"{/if} value="0">{$lang.disable}</option>
                                            {foreach from=$autopay item=value key=name}
                                                <option {if $affiliate.withdraw_method==$value}selected="selected"{/if} value="{$value}">{$lang[$name]}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                            {/if}
                            {if $landingpage}
                            <tr>
                                <td>{$lang.landingpage}<a href="#" class="vtip_description" title="{$lang.landurldescr}" ></a></td>
                                <td><a href="{$landingpage}" data-toggle="modal" data-target="#landinglink" data-remote="false" style="font-weight:bold">{$landingpage}</a></td>
                            </tr>
                            {/if}
                        </tbody>
                    </table>

                    {if $integration_code!=''}
                        <div class="row">
                            <div class="span6">
                                <h3>{$lang.intcodes}</h3>
                                <pre class="prettyprint linenums">{$integration_code|escape}</pre>
                            </div>
                            <div class="span6">


                                <h3>{$lang.preview}</h3>
                                {$integration_code}
                            </div>
                            <div class="clear"></div>
                        </div>
                    {/if}

            </div>
        </div>
    </div>
</article>

<form method="POST" action="{$ca_url}affiliates/" class="form-horizontal">
    <div id="landinglink" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="refModal" aria-hidden="true">

        <div class="modal-header">
            <h3 id="refModal">{$lang.landingpage}</h3>
        </div>
        <div class="modal-body">
            <label class="control-group">
                <p>{$lang.enternewlandingurl}</p>
                <input type="text" name="landingurl" placeholder="{$landingpage}" class="span5" id="lpi">
            </label>
        </div>
        <div class="modal-footer">
            <button class="btn btn-flat-warning" data-dismiss="modal" aria-hidden="true">{$lang.close}</button>
            <button class="btn btn-flat-primary" id="lpi_s">{$lang.savechanges}</button>
        </div>

        {literal}
            <script type="text/javascript">
                $('#lpi').bind('keyup change input', function () {
                    var t = $(this),
                        v = t.val(),
                        b = $('#lpi_s');
                    if (v.length && !v.match(new RegExp("^https?://" + window.location.hostname.replace(/\./g, '\\.') + "/", 'i'))) {
                        t.parent().addClass('error');
                        b.prop('disabled', true);
                    } else {
                        t.parent().removeClass('error');
                        b.prop('disabled', false);
                    }
                });
                $('.options').on('change', 'input, select, textarea', function () {
                    var self = $(this),
                        inp = self.parents('tr').eq(0).find('input, select, textarea');
                    inp.prop('disabled', true)
                    $.post(window.location.href, {
                        make: 'options',
                        name: self.attr('name'),
                        value: self.val()
                    }, function (data) {
                        parse_response(data);
                        inp.prop('disabled', false)
                    })
                })
            </script>
        {/literal}
    </div>
</form>