<!-- Orderpage -->
<div id="orderpage" class="orderpage">


    {include file='cart_folding_box/header.tpl'}


    <div class="row">
        <div class="span8">
            <h3>{$lang.mydomains}</h3>

            <div class="domain-choose">
            <form action="" method="post" onsubmit="return step1.on_submit();" name="domainpicker" id="form1">
                <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                <input type="hidden" value="{$cart_contents[0].recurring}" id="product_cycle" name="product_cycle" />
                <input type="hidden" name="make" value="checkdomain" />
                <p>{$lang.productconfig1_desc}</p>
                <ul class="domain-options">
                    {if $allowregister}<li><input type="radio" name="domain" value="illregister" onclick="$('#add-domain').find('div.slidme').hide();$('#illregister').show();" checked="checked" id="illregister_input" />{$business_name|string_format:$lang.iwantregister}</li>
                    {/if}
                    {if $allowtransfer}<li><input type="radio" onclick="$('#add-domain').find('div.slidme').hide();$('#illtransfer').show();" value="illtransfer" name="domain"  id="illtransfer_input" />{$business_name|string_format:$lang.iwanttransfer}</li>
                    {/if}
                    {if $allowown}<li><input type="radio" onclick="$('#add-domain').find('div.slidme').hide();$('#illupdate').show();" value="illupdate" name="domain" id="illupdate_input" />{$lang.iwantupdate}</li>
                    {/if}
                    {if $subdomain}<li><input type="radio" onclick="$('#add-domain').find('div.slidme').hide();$('#illsub').show();" value="illsub" name="domain" id="illsub_input"  />{$lang.iwantsub}</li>
                    {/if}
                </ul>
                <div id="add-domain" class="domain-option domain-option-nobg form-horizontal">
                    {if $allowregister}
                        <div align="center" id="illregister" class="t1 slidme">
                            <div id="multisearch" class="left" style="margin-top:5px">
                                <textarea name="sld_register" id="sld_register"></textarea>
                            </div>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-left:10px;width:400px;float:left">
                                {foreach from=$tld_reg item=tldname name=ttld}
                                    {if $smarty.foreach.ttld.index % 4 =='0'}<tr>
                                    {/if}
                                    <td width="25%"><input type="checkbox" name="tld[]" value="{$tldname}" {if $smarty.foreach.ttld.first}checked="checked"{/if} class="tld_register"/> {$tldname}</td>
                                    {if $smarty.foreach.ttld.index % 4 =='5'}</tr>
                                    {/if}
                                {/foreach}
                                <tr>
                                </tr>
                            </table>
                            <div class="clear"></div>
                            <div class="add-new-button">
                                <a href="#" class="btn btn-step" onclick="if($('#form2 input:checked').length>0 && ( $('#illregister_input').is(':checked') ||  $('#illtransfer_input').is(':checked')) ) $('#form2').submit(); else $('#form1').submit(); return false;">{$lang.check}</a>
                            </div>
                        </div>
                    {/if}
                    {if $allowtransfer}
                        <div align="center" id="illtransfer" style="display: none;" class="slidme">www.
                            <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled span3"/>
                            <select name="tld_transfer" id="tld_transfer" class="span2">
                                {foreach from=$tld_tran item=tldname}
                                    <option>{$tldname}</option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}
                    {if $allowown}
                        <div align="center" id="illupdate" style="display: none;" class="slidme">www.
                            <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled span3"/>
                            .
                            <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span1"/>
                        </div>
                    {/if}
                    {if $subdomain}
                        <div align="center" id="illsub" style="display: none;" class="slidme">www.
                            <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled span3"/>
                            {$subdomain}
                        </div>
                    {/if}

                </div>
                </form>
                <form method="post" action="" id="form2">
                    <div id="updater">{include file="ajax.checkdomain.tpl"} </div>
                </form>
            </div>
        </div>


        <div class="span4" id="cartSummary">
            {include file='cart_folding_box/cart_summary.tpl'}
        </div>
        </div>


    {include file='cart_folding_box/pagination.tpl'}



</div>
<!-- End of Orderpage -->