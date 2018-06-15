<div >
    <div id="billing_info" class="form-inline">
        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <div class="section">
            {if $install}
                <p> Installation progress </p>
                <div id="install-progress" class="progress progress-striped active widget-progress">
                    <div class="bar" style="width: {$install.progress}%">
                        <span>{$install.progress}%</span>
                    </div>
                </div>
                <table class="table table-striped" id="install-steps">
                    {foreach from=$install.steps item=step}
                        <tr>
                            <td>{$step.comment}</td>
                            <td><span class="label {if $step.status=='done'}label-success{elseif $step.status=='doing'}label-warning{/if}">{if $step.status=='doing'}In progress{else}{$step.status}{/if}</span></td>
                        </tr>
                    {/foreach}
                </table>
            {else}
                <form autocomplete="off" action="{$widget_url}&act={$act}" method="post">
                    <input type="hidden" name="make" value="submit" />
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker table table-striped">
                        <tbody>
                            <tr >
                                <td width="160" align="right">Select new OS template</td>
                                <td>
                                    <select name="os"  id="ostemplate">
                                        <option value="0">Select</option>
                                        {foreach from=$ostemplates item=os}
                                            <option value="{$os}">{$os}</option>
                                        {/foreach}
                                    </select>
                                </td>
                            </tr>   
                        </tbody>
                        <tbody id="osdetails">

                        </tbody>
                        <tbody>
                            <tr >
                                <td width="160" align="right">Hostname</td>
                                <td>
                                    <input name="hostname" />
                                </td>
                            </tr>   
                            <tr >
                                <td width="160" align="right"></td>
                                <td>
                                    <input type="submit" value="{$lang.submit}" class="btn btn-primary" />
                                </td>
                            </tr>  
                        </tbody>
                    </table>
                    {securitytoken}
                </form>
            {/if}
        </div>
    </div>
</div>

<script type="text/javascript" src="{$widgetdir_url}../widget.js"></script>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>