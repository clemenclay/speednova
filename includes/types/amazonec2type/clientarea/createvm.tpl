{include file="`$cloudstackdir`header.cloud.tpl"}
<script type="text/javascript" src="includes/types/amazonec2type/js/progress.js"></script>
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.createnewserver}</h3>
    <div class="clear"></div>
</div>

<div id="progressbar" style="padding:10px;display:none;"></div>
<div class="content-bar nopadding" style="position:relative">
    <form method="post" action="" id="cloudstackbuild">
        <input type="hidden" value="createmachine" name="make" />
       
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td colspan="2" id="flavormgr">
                    <center><img src="includes/types/amazonec2type/images/ajax-loader-big.GIF" alt=""/></center>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.name}</span>
                    <input type="text" size="30" required="required" name="CreateVM[InstanceName]"  class="styled" value="{$submit.CreateVM.InstanceName}" title="Name can contain ASCII letters 'a' through 'z', the digits '0' through '9', and the hyphen ('-'), must be between 1 and 63 characters long, and can't start or end with \"-\" and can't start with digit"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="slabel">{$lang.ostemplate}</span>
                    <select style="min-width:250px;" required="required" name="CreateVM[ImageId]" id="virtual_machine_template_id" onchange="oschange(this);" >
                        {foreach from=$CreateVM.ostemplates item=templa}
                            <option value="{$templa[0]}" {if $templa[3]>0 && $templa[2]=='template'}data-size="{$templa[3]}"{/if}{if $submit.CreateVM.ImageId==$templa[0]}selected="selected"{/if}>
                                {$templa[1]} 
                                {if $templa[4] && $templa[4]>0} ({$templa[4]|price:$currency} )
                                {/if}
                            </option>
                        {/foreach}
                    </select>
                </td>
            </tr>
          
          
            <tr>
                <td align="center" style="border:none" colspan="2">
                    <input type="submit" value="{$lang.CreateVM}" style="font-weight:bold" class=" blue" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            {literal}
                var intervalx = undefined;
                $('#progressbar').on("positionChanged", function(e) {
                    if (e.percent >= 100) {
                        clearInterval(intervalx);
                        intervalx = undefined;
                    }
                });
                function initprogress() {
                    $('.content-bar').hide();
                    $('#progressbar').addClass('content-bar').show().progressbar({
                        maximum: 100,
                        warningMarker: 110,
                        dangerMarker: 110,
                        step: 1
                    });
                    intervalx = setInterval(function() {
                        $('#progressbar').progressbar('stepIt');

                    }, 450);
                }
                function oschange(that) {
                    return false;
                }
                $.get('?cmd=flavormanager&selected={/literal}{$submit.flavor_id}{literal}', function(data) {
                    $('#flavormgr').html(data);
                });
                $(document).ready(function() {
                    $('#cloudstackbuild').submit(initprogress);

                    init_sliders();
                    $('input[name="CreateVM[InstanceName]"]').unbind('keyup').keyup(function() {
                        var that = $(this),
                                val = that.val(),
                                btn = $('input[type="submit"]');
                        if (val.length < 1 || val.length > 63 || val.match(/[^\da-zA-Z\-]|^[^a-zA-Z]|[^a-zA-Z\d]$/) != null) {
                            that.parent().addClass('error');
                            btn.prop('disabled', true).fadeTo(200, 0.5);
                        } else {
                            btn.prop('disabled', false);
                            that.parent().removeClass('error').fadeTo(200, 1);
                            ;
                        }
                    }).keyup().parent().addClass('control-group');
                  
                });
            {/literal}
        </script>
        <style> 
            {literal}
            span.slabel {
                color: #505050;
                display: block;
                float: left;
                font: bold 14px helvetica,arial,sans-serif;
                overflow: hidden;
                padding: 7px 5px 7px 10px;
                width: 370px;
            }
            {/literal}
        </style>
        {securitytoken}
    </form>
</div>
{include file="`$cloudstackdir`footer.cloud.tpl"}
