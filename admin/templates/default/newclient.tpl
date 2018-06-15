<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" {if $currentfilter}class="searchon"{/if}>
    <tr>
        <td ><h3>{$lang.newclient}</h3></td>
        <td  class="searchbox"><div id="hider2" style="text-align:right">

                &nbsp;&nbsp;&nbsp;<a href="?cmd=clients&action=getadvanced" class="fadvanced">{$lang.filterdata}</a> <a href="?cmd=clients&resetfilter=1" {if $currentfilter}style="display:inline"{/if}  class="freseter">{$lang.filterisactive}</a>

            </div>
            <div id="hider" style="display:none"></div></td>
    </tr>
    <tr>
        <td class="leftNav"><a href="?cmd=newclient"  class="tstyled selected"><strong>{$lang.registernew}</strong></a><br />

            <a href="?cmd=clients"  class="tstyled">{$lang.managecustomers}</a>
            <a href="?cmd=clients&list=active"  class="tstyled tsubit ">{$lang.Active}</a>
            <a href="?cmd=clients&list=closed"  class="tstyled tsubit ">{$lang.Closed}</a>
            {foreach from=$groups item=group}
                <a href="?cmd=clients&list={$group.id}"  class="tstyled tsubit " style="color:{$group.color}">{$group.name} <span>({$group.count})</span></a>
            {/foreach}
            <br />
            <a href="?cmd=clients&action=groups"  class="tstyled ">{$lang.clientgroups}</a>
            <a href="?cmd=clients&action=fields"  class="tstyled ">{$lang.customerfields}</a>
            <br />
            <a href="?cmd=affiliates"  class="tstyled">{$lang.Affiliates}</a>
            <a href="?cmd=affiliates&action=configuration"  class="tstyled">{$lang.affconfig}</a>
        </td>


        <td  valign="top"  class="bordered"><div id="bodycont">
                <form method="post" action="" name="signupform">
                    <input type="hidden" name="adminsignup" value="1" />
                    <div class="blu">
                        <a href="?cmd=csv" class="btn btn-default btn-sm" >
                            <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>
                            Import
                        </a>


                    </div>


                    <div id="ticketbody" class="lighterblue">




                        <div class="container-fluid clear lighterblue" style="padding-top:14px">
                            <div class="row">
                                <div class="col-md-6 col-lg-4">



                                    {foreach from=$fields item=field name=floop key=k}
                                    {if $smarty.foreach.floop.iteration > ($smarty.foreach.floop.total/2)}{break}{/if}


                                    <div {if $field.type=='Company' && $fields.type}class="iscomp form-group" style="{if !$submit.type || $submit.type=='Private'}display:none{/if}"
                                         {elseif $field.type=='Private' && $fields.type}class="ispr form-group" style="{if $submit.type=='Company'}display:none{/if}"
                                            {else}
                                            class="form-group"
                                            {/if} >
                                        <label for="{$k}">{if $k=='type'}
                                                {$lang.clacctype}
                                            {elseif $field.options & 1}
                                                {if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                                            {else}
                                                {$field.name}
                                            {/if}</label>

                                        {if $k=='type'}
                                            <select  name="type" class="form-control" onchange="{literal}if ($(this).val() == 'Private') {
                                                                $('.iscomp').hide();
                                                                $('.ispr').show();
                                                            } else {
                                                                $('.ispr').hide();
                                                                $('.iscomp').show();
                                                            }{/literal}">
                                                <option value="Private" {if $submit.type=='Private'}selected="selected"{/if}>{$lang.Private}</option>
                                                <option value="Company" {if $submit.type=='Company'}selected="selected"{/if}>{$lang.Company}</option>
                                            </select>
                                        {elseif $k=='country'}
                                            <select name="country" class="form-control">
                                                {foreach from=$countries key=k item=v}
                                                    <option value="{$k}" {if $k==$submit.country  || (!$submit.country && $k==$defaultCountry)} selected="Selected"{/if}>{$v}</option>

                                                {/foreach}
                                            </select>
                                        {else}
                                            {if $field.field_type=='Input'}
                                                <input type="text" value="{$submit[$k]}" class="form-control" name="{$k}" class="styled"/>
                                            {elseif $field.field_type=='Password'}
                                                <input type="password" autocomplete="off" value="" class="form-control" name="{$k}" class="styled"/>
                                            {elseif $field.field_type=='Select'}
                                                <select name="{$k}" class="form-control">
                                                    {foreach from=$field.default_value item=fa}
                                                        <option {if $submit[$k]==$fa}selected="selected"{/if}>{$fa}</option>
                                                    {/foreach}
                                                </select>
                                            {elseif $field.field_type=='Check'}
                                        <div class="checkbox">

                                                {foreach from=$field.default_value item=fa}
                                                    <label>
                                                        <input type="checkbox" name="{$k}[{$fa}]" {if $submit[$k][$fa]}checked="checked"{/if} value="1" />{$fa}
                                                    </label>

                                                {/foreach}
                                        </div>
                                            {/if}
                                        {/if}

                                        {if $field.description}<p class="help-block">{$field.description}</p>{/if}

                                    </div>
                                    {/foreach}

                                </div>
                                <div class="col-md-6  col-lg-4">

                                    {foreach from=$fields item=field name=floop key=k}
                                        {if $smarty.foreach.floop.iteration <= ($smarty.foreach.floop.total/2)}{continue}{/if}


                                        <div {if $field.type=='Company' && $fields.type}class="iscomp form-group" style="{if !$submit.type || $submit.type=='Private'}display:none{/if}"
                                             {elseif $field.type=='Private' && $fields.type}class="ispr form-group" style="{if $submit.type=='Company'}display:none{/if}"
                                                {else}
                                             class="form-group"
                                                {/if} >
                                            <label for="{$k}">{if $k=='type'}
                                                    {$lang.clacctype}
                                                {elseif $field.options & 1}
                                                    {if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                                                {else}
                                                    {$field.name}
                                                {/if}</label>

                                            {if $k=='type'}
                                                <select  name="type" class="form-control" onchange="{literal}if ($(this).val() == 'Private') {
                                                                $('.iscomp').hide();
                                                                $('.ispr').show();
                                                            } else {
                                                                $('.ispr').hide();
                                                                $('.iscomp').show();
                                                            }{/literal}">
                                                    <option value="Private" {if $submit.type=='Private'}selected="selected"{/if}>{$lang.Private}</option>
                                                    <option value="Company" {if $submit.type=='Company'}selected="selected"{/if}>{$lang.Company}</option>
                                                </select>
                                            {elseif $k=='country'}
                                                <select name="country" class="form-control">
                                                    {foreach from=$countries key=k item=v}
                                                        <option value="{$k}" {if $k==$submit.country  || (!$submit.country && $k==$defaultCountry)} selected="Selected"{/if}>{$v}</option>

                                                    {/foreach}
                                                </select>
                                            {else}
                                                {if $field.field_type=='Input'}
                                                    <input type="text" value="{$submit[$k]}" class="form-control" name="{$k}" class="styled"/>
                                                {elseif $field.field_type=='Password'}
                                                    <input type="password" autocomplete="off" value="" class="form-control" name="{$k}" class="styled"/>
                                                {elseif $field.field_type=='Select'}
                                                    <select name="{$k}" class="form-control">
                                                        {foreach from=$field.default_value item=fa}
                                                            <option {if $submit[$k]==$fa}selected="selected"{/if}>{$fa}</option>
                                                        {/foreach}
                                                    </select>
                                                {elseif $field.field_type=='Check'}
                                                    <div class="checkbox">

                                                        {foreach from=$field.default_value item=fa}
                                                            <label>
                                                                <input type="checkbox" name="{$k}[{$fa}]" {if $submit[$k][$fa]}checked="checked"{/if} value="1" />{$fa}
                                                            </label>

                                                        {/foreach}
                                                    </div>
                                                {/if}
                                            {/if}

                                            {if $field.description}<p class="help-block">{$field.description}</p>{/if}

                                        </div>
                                    {/foreach}

                                </div>


                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label>Optional: </label>
                                        <div class="checkbox">

                                                <label>
                                                    <input name="notifyclient" value="yes" type="checkbox"/> {$lang.notifyclient}
                                                </label>
                                            <label>
                                                <input name="affiliate" value="yes" type="checkbox"/>    {$lang.EnableAffiliate}
                                            </label>

                                        </div>

                                    </div>


                                </div>

                                    {if count($currencies)>1}
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label>{$lang.currency}:</label>
                                        <select name="currency_id" id="currency_id" class="form-control">
                                            {foreach from=$currencies item=curre}
                                                <option value="{$curre.id}" {if $curre.id=='0'}selected="selected"{/if}>{if $curre.code}{$curre.code}{else}{$curre.iso}{/if}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                    {/if}


                                    {if $groups}
                                        <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Group:</label>
                                         <select name="group_id" id="group_id" class="form-control">
                                                <option value="0" >{$lang.none}</option>
                                                {foreach from=$groups item=group}
                                                    <option value="{$group.id}" style="color:{$group.color}" {if $submit.group_id==$group.id}selected="selected"{/if}>{$group.name}</option>
                                                {/foreach}
                                            </select>
                                    </div>
                                    </div>
                                    {/if}
                                    {if $submit.ticket_id}
                                        <input type="hidden" name="ticket_id" value="{$submit.ticket_id}" />
                                    {/if}


                                <div class="col-md-12 col-lg-12">

                                    <center>
                                        <input type="submit"  value="{$lang.registerclient}" class="btn btn-primary" />
                                        <input type="button"  value="{$lang.Cancel}" onclick="window.location.href = '?cmd=clients'" class="btn btn-default"/>
                                    </center>

                                </div>

                            </div>
                        </div>




            </div>

            {securitytoken}
        </form>

    </div>

</td></tr>
</table>