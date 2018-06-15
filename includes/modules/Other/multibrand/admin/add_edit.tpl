<script type="text/javascript" src="{$template_dir}js/ace/ace.js?v={$hb_version}"></script>
{literal}
    <script type="text/javascript">
        ;
        $(function () {
            $('#newshelfnav').TabbedMenu({elem: '#tableform > tbody', picker: '.subm1 li', picktab: true});
            $('.available-products').off('click').on('click', 'input', function () {
                var self = $(this),
                    li = self.parents('.li-cat').eq(0);
                if (self.is('.all')) {
                    $('input', li).prop('checked', self.is(':checked'));
                } else {
                    var all = true;
                    $('input.in-prod', li).each(function () {
                        if (!$(this).is(':checked')) {
                            all = false;
                            return false;
                        }
                    })
                    $('input.all', li).prop('checked', all)
                }
            })
            $('#tos').on('click update', function () {
                var self = $(this);
                if (self.is(':checked'))
                    self.next().prop('disabled', false);
                else
                    self.next().prop('disabled', true);
            }).trigger('update');

            $('input[name="config[InvCompanyLogoY]"]').on('click update', function () {
                var self = $(this),
                    upload = $('#logouploaders'),
                    old = $('#logouprev');
                if (self.val() == '1') {
                    upload.show();
                    old.prop('disabled', false)
                } else {
                    upload.hide();
                    old.prop('disabled', true)
                }
            }).filter(':checked').trigger('update')

            $('#brandform').on('submit', function () {
                var gateOveride = $('.gate-conf > input, .alt-conf > input');
                gateOveride.each(function () {
                    var self = $(this),
                        table = self.siblings('table, .row'),
                        conf = table.find('input[type=text], input[type=checkbox]:checked, input[type=radio]:checked, input[type=password], textarea, select');

                    if (self.is(':checked') || self.is('[type=hidden]')) {
                        self.val(conf.serialize())
                    }


                    conf.prop('disabled', true);
                })
            })

            $('.custom_format').each(function () {
                var td = $(this),
                    select = td.children('select'),
                    btn = td.children('a'),
                    custom = td.children('div'),
                    form = custom.find('input'),
                    initval = form.val();

                custom.hide();
                if (select.children('[value="' + initval + '"]').length)
                    select.val(initval)
                else
                    select.val('0');

                function show() {
                    custom.show();
                    select.val('0');
                    return false;
                }

                btn.on('click', show);
                select.on('change', function () {
                    var value = select.val();
                    if (value === '0')
                        return show();
                    if (value === '')
                        custom.hide();
                    form.val(value);
                }).trigger('change')
            })

            $('.disable-opts').each(function () {
                var self = $(this),
                    controll = self.find('input'),
                    output = $('.' + self.data('opts')).find('input, select');


                controll.change(function () {
                    var val = controll.filter(':checked').val()
                    output.prop('disabled', val != 1)
                }).filter(':checked').trigger('change');
            })
        })



        var aceInit = HBInputTranslate.aceOn;
        HBInputTranslate.aceOn = function (el, target) {
            var textarea = $('#' + target);
            aceInit(el, target);

            if (textarea.data('ace') == true) {
                var ace = textarea.data('aceeditor');
                ace.setOptions({
                    minLines: 15,
                    maxLines: 15,
                });
            }
        }


    </script>

{/literal}
<link href="{$moduleurl}style.css" rel="stylesheet" type="text/css"/>
<form enctype="multipart/form-data" method="post" action="?cmd={$modulename}&action={$action}" style="padding: 10px 0;" id="brandform">
    {if $action=="edit"}
        <input type="hidden" name="id" value="{$entry.brand_id}"/>
        <input type="hidden" name="edit" value="1"/>
    {else}
        <input type="hidden" name="add" value="1"/>
    {/if}
    <table id="tableform" cellpadding="5" style="width: 100%">
        <tbody>
            <tr>
                <td >
                    <label><b>Brand Name</b></label>
                    <a class="vtip_description" title="Name for this brand, used only in admin area to identify this entry"></a>
                </td>
                <td><input type="text" value="{$entry.name}" name="name" class="inp" /></td>
            </tr>
            <tr>
                <td>
                    <label><b>Url</b></label>
                    <a class="vtip_description" title="Site address, eg: http://example.com/store"></a>
                </td>
                <td><input type="text" value="{$entry.url}" name="url" class="inp" placeholder="http://example.com/" /></td>
            </tr>
            {foreach from=$mbaddons.options item=tpl}
                {include file=$tpl}
            {/foreach}
            {if $entry.brand_id != 1 || $entry.brand_id == 'new'}
                <tr>
                    <td>
                        <label><b>Enabled</b></label>
                    </td>
                    <td>
                        <input type="hidden" value="0" name="active" />
                        <input type="checkbox" value="1" name="active" {if $entry.active}checked="checked"{/if} class="inp" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: left; padding: 20px 0 0 120px">
                        <h1>General settings</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Company Name</b></label>
                    </td>
                    <td><input type="text" value="{$entry.config.BusinessName}" name="config[BusinessName]" class="inp" placeholder="{$conf.BusinessName}" /></td>
                </tr>

                <tr>
                    <td>
                        <label><b>Initial Client Group</b></label>
                        <a class="vtip_description" title="New clients will be automaticaly assigned to selected client group"></a>
                    </td>
                    <td>
                        <select name="config[ClientGroup]" class="inp">
                            <option value="0">None</option>
                            {foreach from=$groups item=group}
                                <option value="{$group.id}" {if $group.id==$entry.config.ClientGroup}selected{/if}>{$group.name}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label><b>Client Area template</b></label>
                    </td>
                    <td>
                        <select name="config[UserTemplate]" class="inp">
                            <option value="">Default</option>
                            {foreach from=$templates item=tpl}
                                <option  value="{$tpl}" {if $tpl==$entry.config.UserTemplate}selected{/if}>{$tpl}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Default client language</b></label>
                    </td>
                    <td>
                        <select name="config[UserLanguage]" class="inp">
                            <option value="">Default</option>
                            {foreach from=$user_languages item=language}
                                <option  value="{$language}" {if $language==$entry.config.UserLanguage}selected{/if}>{$language}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Default client country</b></label>
                    </td>
                    <td>
                        <select name="config[UserCountry]" class="inp">
                            <option value="">Default</option>
                            {foreach from=$countries item=countr key=code}
                                <option  value="{$code}" {if $code==$entry.config.UserCountry}selected{/if}>{$countr}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
            {/if}
        </tbody>
        {if $entry.brand_id != 1 || $entry.brand_id == 'new'}
            <tbody>
                <tr>
                    <td>
                        <label><b>Terms of service URL</b></label>
                    </td>
                    <td>
                        <input id="tos" type="checkbox" {if $entry.config.ApplyTermsURL}checked="checked"{/if} />
                        <input type="text" value="{$entry.config.ApplyTermsURL}" name="config[ApplyTermsURL]" class="inp" />
                    </td>
                </tr>
                <tr>
                    <td >
                        {if $InvoiceModel=='eu'}
                            <strong>{$lang.ProFormaPrefix}</strong>
                        {else}
                            <strong>{$lang.InvoicePrefix}</strong>
                        {/if}
                    </td>
                    <td >
                        <div class="custom_format">
                            <select class="inp" >
                                <option value="" >Same as Default brand</option>
                                <option value="{literal}{$number}{/literal}" >{$lang.none}</option>
                                <option value="{literal}{$m}{/literal}">MM</option>
                                <option value="{literal}{$y}{/literal}" >YYYY</option>
                                <option value="{literal}{$y}{$m}{/literal}" >YYYYMM</option>
                                <option value="0" >{$lang.other}</option>
                            </select>
                            <a class="editbtn" href="#" >{$lang.customize}</a>
                            <div id="InvoicePrefix_custom" >
                                <input style="width:100px" name="config[InvoicePrefix]" 
                                       value="{$entry.config.InvoicePrefix}" class="inp"/>
                                <small>{$lang.InvoicePrefix_desc}</small>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr {if $InvoiceModel!='eu'}style="display:none"{/if}>
                    <td><strong>{$lang.InvoiceNumerationFormat}</strong></td>
                    <td>
                        <div class="custom_format">
                            <select class="inp" >
                                <option value="" >Same as Default brand</option>
                                <option value="{literal}{$number}{/literal}" >Number</option>
                                <option value="{literal}{$m}/{$number}{/literal}" >MM/number</option>
                                <option value="{literal}{$y}/{$number}{/literal}" >YYYY/number</option>
                                <option value="{literal}{$y}/{$m}/{$number}{/literal}" >YYYY/MM/number</option>
                                <option value="0" >{$lang.other}</option>

                            </select>
                            <a class="editbtn" href="#" >{$lang.customize}</a>
                            <div id="InvoiceNumerationFormat_custom">
                                <input style="width:100px" name="config[InvoiceNumerationFormat]"
                                       value="{$entry.config.InvoiceNumerationFormat}" class="inp"/>
                                <small>{$lang.InvoicePrefix2_desc}</small>
                            </div>
                        </div>
                    </td>
                </tr>                
                <tr {if $InvoiceModel!='eu'}style="display:none"{/if}>
                    <td>
                        <strong>Separate Invoice numeration</strong> 
                        <a class="vtip_description" title="Example IDs for brand A and brand B generated when this option is:<br /> 
                           Enabled - A01, B01, A02, B02<br />
                           Disabled - A01, B02, A03, B04"></a>
                    </td>
                    <td class="disable-opts" data-opts="custom-sequence">
                        <input name="config[BrandInvoiceNumerationPaid]" type="radio" value="0" 
                               {if !$entry.config.BrandInvoiceNumerationPaid}checked="checked"{/if}  class="inp"/> 
                        <strong>{$lang.no}, </strong> use the same number sequence as in default brand<br />
                        <input name="config[BrandInvoiceNumerationPaid]" type="radio" value="1" 
                               {if $entry.config.BrandInvoiceNumerationPaid=='1'}checked="checked"{/if}  class="inp"/>  
                        <strong>{$lang.yes}, </strong>use separate number sequence for invoices in this brand
                    </td>
                </tr>

                <tr {if $InvoiceModel!='eu'}style="display:none"{/if} class="custom-sequence">
                    <td><strong>{$lang.InvoiceNumerationFrom}</strong> </td>
                    <td >
                        <input style="width:100px" name="config[InvoiceNumerationPaid]" 
                               value="{$entry.config.InvoiceNumerationPaid|default:'1'}" class="inp"/>
                    </td>
                </tr>

                <tr  {if $InvoiceModel!='eu'}style="display:none"{/if} class="custom-sequence">
                    <td><strong>{$lang.InvoicePaidAutoReset}</strong></td>
                    <td colspan="3">
                        <input name="config[InvoicePaidAutoReset]" type="radio" value="0" {if !$entry.config.InvoicePaidAutoReset}checked="checked"{/if}  class="inp"/> 
                        <strong>{$lang.no}, </strong> {$lang.InvoicePaidAutoReset_descr}<br />
                        <input name="config[InvoicePaidAutoReset]" type="radio" value="1" {if $entry.config.InvoicePaidAutoReset=='1'}checked="checked"{/if}  class="inp"/>  
                        <strong>{$lang.yes}, </strong>{$lang.InvoicePaidAutoReset1_descr}<br />
                        <input name="config[InvoicePaidAutoReset]" type="radio" value="2" {if $entry.config.InvoicePaidAutoReset=='2'}checked="checked"{/if}  class="inp"/>  
                        <strong>{$lang.yes}, </strong>{$lang.InvoicePaidAutoReset2_descr}

                    </td> 
                </tr>

                <tr>
                    <td>
                        <label><b>Invoice logo</b></label>
                    </td>
                    <td>
                        <input name="config[InvCompanyLogo]" type="hidden" value="" />
                        <input id="logouprev" name="config[InvCompanyLogo]" type="hidden" value="{$entry.config.InvCompanyLogo}" />
                        <input value="0" name="config[InvCompanyLogoY]" {if $entry.config.InvCompanyLogoY!='1'}checked='checked'{/if}
                               type="radio"> <strong>Use company name as logo</strong><br>
                        <input value="1" name="config[InvCompanyLogoY]" {if $entry.config.InvCompanyLogoY=='1'}checked='checked'{/if} 
                               type="radio"> <strong>Upload logo image</strong>


                        <div class="clear"></div>
                        <div class="p6 left" id="logouploaders" style="padding:10px 5px;margin-top:10px;">
                            <table border="0" cellpadding="6" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="border:none; text-align: left" class="fs11" align="center" valign="top" width="200">
                                            Current logo: 
                                            <img src="../templates/{$entry.config.InvCompanyLogo}" alt="{$entry.config.BusinessName}">
                                        </td>
                                        <td style="border:none">
                                            Upload new logo: <input name="file" id="InvCompanyLogo" type="file"><br>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="clear"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Invoice template</b></label>
                    </td>
                    <td>
                        <table  class="invtemplate" cellspacing="0" cellpadding="3">
                            {foreach from=$invtemplates item=tpl}
                                <tr>
                                    <td >
                                        <input type="radio" name="config[InvoiceTemplate]" 
                                               value="{$tpl.id}" {if $entry.config.InvoiceTemplate==$tpl.id}checked="checked"{/if} id="seo_{$tpl.id}" />
                                        <label for="seo_{$tpl.id}" class="w150 left">{$tpl.name}</label>
                                        <div >
                                            <a href="?cmd=entry.config&action=invoicetemplates&make=preview&content_id={$tpl.id}&security_token={$security_token}" class="fs11">Preview</a>

                                        </div>
                                        <div class="clear"></div>
                                    </td>
                                </tr>
                            {/foreach}
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Estimate template</b></label>
                    </td>
                    <td>
                        <table class="invtemplate" cellspacing="0" cellpadding="3">

                            {foreach from=$esttemplates item=tpl}
                                <tr>
                                    <td >
                                        <input type="radio" name="config[EstimateTemplate]" 
                                               value="{$tpl.id}" {if $entry.config.EstimateTemplate==$tpl.id}checked="checked"{/if} id="seo_{$tpl.id}" />
                                        <label for="seo_{$tpl.id}" class="w150 left">{$tpl.name}</label>
                                        <div >
                                            <a href="?cmd=entry.config&action=estimatetemplates&make=preview&content_id={$tpl.id}&security_token={$security_token}" class="fs11">Preview</a>

                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                        </table>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        <label><b>Email address for system emails</b></label>
                    </td>
                    <td><input type="text" value="{$entry.config.SystemMail}" name="config[SystemMail]" class="inp" /></td>
                </tr>
                <tr>
                    <td>
                        <label><b>Message HTML wrapper </b></label>
                    </td>
                    <td>
                        <div>
                            <input type="hidden" value="off" name="config[ForceWraperOnPlaintext]" />
                            <input type="checkbox" value="on" name="config[ForceWraperOnPlaintext]" 
                                   onclick="$(this).parent().next('div').toggle()"
                                   {if $entry.config.ForceWraperOnPlaintext == 'on'}checked{/if} class="inp" /> Wrap plain text emails
                        </div>
                        <div {if $entry.config.ForceWraperOnPlaintext != 'on'}style="display: none"{/if}>
                            <br /><small>You can wrap your messages with HTML code defined here. {literal}{$message}{/literal} variable used in this field will be replaced with email content</small>
                            {hbwysiwyg value=$entry.config.EmailHTMLWrapper style="width:99px;" class="inp" cols="50" rows="6" name="config[EmailHTMLWrapper]"
                            featureset="ace" editortag="HTML" editortype="ace" wrapper='div'}

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Email Signature</b></label>
                    </td>
                    <td>
                        <small>Note: HTML tags will be removed from signatures attached to plain text emails</small>
                        {hbwysiwyg value=$entry.config.EmailSignature style="width:99px;" class="inp" cols="50" rows="6" name="config[EmailSignature]"
                            featureset="ace" editortype="ace" wrapper='div'}

                    </td>
                </tr>
            </tbody>
        {/if}
        <tbody>
            <tr>
                <td>
                    <label><b>Enabled Products</b></label>
                    <a class="vtip_description" title="Select orderpages that will be available for this brand"></a>
                </td>
                <td>
                    <input type="hidden" name="config[EnabledCat][]"  value="-1" />
                    <ul class="opt-list">
                        {foreach from=$products item=category}
                            <li class="li-cat">
                                <input id="cat{$category.id}" type="checkbox" class="all" name="config[EnabledCat][]" value="{$category.id}"
                                       {if in_array($category.id, $entry.config.EnabledCat) || !$entry.config.EnabledCat}checked="checked"{/if}/>

                                <label for="cat{$category.id}"><strong>{$category.name}</strong> ({$category.products|@count} products)</label>
                            </li>
                        {/foreach}
                    </ul>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <label><b>Enabled Payment Gateways</b></label>
                    <p class="small-descr">
                        Select payment gateways that will be available for this brand
                    </p>
                </td>
                <td>
                    <input type="hidden" name="config[EnabledGateways][]"  value="-1" />
                    <ul class="opt-list">
                        {foreach from=$modules item=gate key=modid}
                            <li class="li-cat">
                                <input id="gate{$gate.id}" class="gate-enabled" type="checkbox" name="config[EnabledGateways][]"  value="{$gate.id}"
                                       {if in_array($gate.id, $entry.config.EnabledGateways) || !$entry.config.EnabledGateways}checked="checked"{/if}/>
                                <label for="gate{$gate.id}">
                                    <strong>{$gate.modname}</strong>
                                </label>
                                {if ($entry.brand_id != 1 || $entry.brand_id == 'new') && !empty($gate.config)}
                                    <div class="gate-conf">
                                        <input id="over{$gate.id}" type="checkbox" name="config[OverideModConfig][{$gate.id}]"  value="[]"
                                               {if $entry.config.OverideModConfig[$gate.id]}checked="checked"{/if}/>
                                        <label for="over{$gate.id}">Overwrite default config</label>
                                        <div class="row">
                                            <div class="col-md-4">{include file="moduleconfig.tpl" b=$gate}</div>
                                            <div class="col-md-8"><div class="well">{$gate.description}</div></div>
                                        </div>
                                    </div>
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <label><b>Enabled Support Departments</b></label>
                    <p class="small-descr">
                        Select support departments that will be available for this brand
                    </p>

                </td>
                <td>
                    <input type="hidden" name="config[EnabledSupportDept][]"  value="-1" />
                    <ul class="opt-list">
                        {foreach from=$depts item=dept}
                            {if !$dept.visible}{continue}
                            {/if}
                            <li class="li-cat">
                                <input id="dept{$dept.id}" type="checkbox" name="config[EnabledSupportDept][]"  value="{$dept.id}"
                                       {if in_array($dept.id, $entry.config.EnabledSupportDept) || !$entry.config.EnabledSupportDept}checked="checked"{/if}/>
                                <label for="dept{$dept.id}">
                                    <strong>{$dept.name}</strong>
                                </label>
                            </li>
                        {/foreach}
                    </ul>
                </td>
            </tr>

            <tr>
                <td>
                    <label><b>Staff Signatures</b></label>
                    <p class="small-descr">
                        Setup email signatures added to tickets.
                    </p>

                </td>
                <td>
                    <input type="hidden" name="config[OverwriteStaffSignature][]"  value="-1" />
                    <ul class="opt-list">
                        {foreach from=$staff item=user}
                            <li class="li-cat">
                                <input id="staff{$user.id}" class="gate-enabled" type="checkbox" name="config[OverwriteStaffSignature][]"  value="{$user.id}"
                                       {if in_array($user.id, $entry.config.OverwriteStaffSignature)}checked="checked"{/if}/>
                                <label for="staff{$user.id}">
                                    <strong>{$user.firstname} {$user.lastname}</strong>
                                </label>
                                <div class="alt-conf">
                                    <textarea name="config[StaffSignature][{$user.id}]" 
                                              class="form-control" >{$entry.config.StaffSignature[$user.id]}</textarea>
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </td>
            </tr>
        </tbody>
        {if ($entry.brand_id != 1 || $entry.brand_id == 'new') && $mbaddons.altmodules}
            <tbody>
                <tr>
                    <td>
                        <label><b>Alternative Module Configuration</b></label>
                        <p class="small-descr">
                            Select modules which configuration you want to overide for this brand.
                        </p>
                        <p class="small-descr">
                            Disabled plugins will use configuration from default brand.
                        </p>

                    </td>
                    <td>
                        <input type="hidden" name="config[AltModule][]"  value="-1" />
                        <ul class="opt-list">
                            {foreach from=$altmodules item=module key=modid}
                                <li class="li-cat">
                                    <input id="gate{$module.id}" class="gate-enabled" type="checkbox" name="config[AltModule][]"  value="{$module.id}"
                                           {if in_array($module.id, $entry.config.AltModule)}checked="checked"{/if}/>
                                    <label for="gate{$module.id}">
                                        <strong>{$module.modname}</strong>
                                    </label>

                                    <div class="alt-conf">
                                        <input type="hidden" name="config[OverideModConfig][{$module.id}]"  value="[]" />
                                        <div class="row">
                                            <div class="col-md-4">{include file="moduleconfig.tpl" b=$module}</div>
                                            <div class="col-md-8"><div class="well">{$module.description}</div></div>
                                        </div>
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </td>
                </tr>
            </tbody>
        {/if}
    </table>
    <div class="clearfix" style="padding: 20px 10px 0;">
        <a class="new_dsave new_menu" href="#" onclick="$(this).parents('form').eq(0).submit();
                return false;">
            <span>Save Changes</span>
        </a>
    </div>
    {securitytoken}
</form>