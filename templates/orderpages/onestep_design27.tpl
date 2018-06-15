{*
@@author:: Rafal Gutkowski <goodkowski@gmail.com>
@@name:: Lato Full-screen, One-step 
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. 
@@thumb:: onestep_design27/thumb.png
@@img:: onestep_design27/preview.png
*}
<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <base href="{$system_url}" />
        <title>{$hb}{if $pagetitle}{$pagetitle} - {/if}{$business_name}</title>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.css" />
        <!--<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />-->
        <link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_design27/css/style.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_design27/css/jquery.pnotify.default.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_design27/css/jquery-ui-1.8.21.custom.css">
        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/ie8.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.js"></script>
        <script type="text/javascript" src="{$orderpage_dir}onestep_design27/js/jquery.pnotify.min.js"></script>
        <script type="text/javascript" src="{$orderpage_dir}onestep_design27/js/script.js"></script>
        <script type="text/javascript" src="{$template_dir}js/common.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>

        <script type="text/javascript">
            var infos = [], errors = [];
            {if $error}
                {foreach from=$error item=blad}errors.push('{$blad|escape:'javascript'}');
                {/foreach}
            {/if}
            {if $info}
                {foreach from=$info item=infos}infos.push('{$infos|escape:'javascript'}');
                {/foreach}
            {/if}
            {literal}
        $(function () {
            pnotify(infos, 'info');
            pnotify(errors, 'error');
        });
        function pnotify(list, type) {
            for (var i in list)
                $.pnotify({
                    text: list[i],
                    type: type,
                    hide: false,
                    sticker: false,
                    icon: false
                });
        }

            {/literal}
        </script>
        {userheader}
    </head>
    <body class="{$language|capitalize} tpl_nextgen">

        <div class="plans-top row">
            <a href="{$system_url}" class="back-to-home">Back to <b>home page</b></a>

            <div class="headline">
                <p class="sup">{$opconfig.header1}</p>
                <h1 class="sub">{$opconfig.header2}</h1>
            </div>

            <div class="servers">
                {foreach from=$products item=i name=productLoop}
                    <div class="server" data-pid="{$i.id}">
                        <h3 class="name">{$i.name}</h3>
                        <p class="price">
                            {if $i.paytype!='Free'}<span class="sign">{$currency.sign}</span>{/if}
                            {include file="common/price.tpl" product=$i hidecode=true hidesign=true} 
                            {if $i.paytype!='Free'} <span class="code">{$currency.code}</span>{/if}
                        </p>
                        <table class="table included">
                            <thead>
                                <tr class="whatincluded">
                                    <td colspan="2">{$lang.seewhatincluded}:

                                    </td>
                                </tr>
                            </thead>
                            {specs var="awords" string=$i.description}
                            {foreach from=$awords item=prod name=lla key=k}
                                {if $prod.specs}
                                    <tbody>
                                        {foreach from=$prod.specs item=feat name=plan key=ka}
                                            <tr>
                                                <th>{$feat[0]}</th>
                                                <td>{$feat[1]}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                {/if}
                            {/foreach}
                            {assign var=awords value=false}
                        </table>
                        <div class="select-button">
                            <div class='toggle' 
                                 id='tl'
                                 toggle-div
                                 toggle-class='toggle-on'
                                 toggle-active=false>
                                <div class='toggle-text-off'>{$lang.select}</div>
                                <div class='glow-comp'></div>
                                <div class='toggle-button'></div>
                                <div class='toggle-text-on'>{$lang.selected}</div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>

            <div class="summary container" style="opacity: 0;">
                <div class="pull-right proceed">
                    <i class="icon-card"></i>
                    <b>{$lang.proceedtocart}</b>
                    <p>{$opconfig.text1}</p>
                    <button class="btn btn-success btn-proceed">{$lang.ordernow}</button>
                </div>
                <div class="pull-left billing">
                    <i class="icon-tag"></i>
                    <b>{$lang.totalprice}</b>
                    <p>{$lang.Monthly}</p>
                    <div class="totalprice price"></div>
                </div>
            </div>
        </div>

        <div class="checkout">
            <div class="headline">
                <p class="sup">{$opconfig.details1}</p>
                <h1 class="sub">{$opconfig.details2}</h1>
            </div>

            <div class="container">
                <div id="update" class="row">
                    {include file="ajax.onestep_design27.tpl"}
                </div>

                <!-- Client Information -->
                <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
                    <input type="hidden" name="make" value="order" />
                    <div class="row">
                        <div class="span12">
                            {if $logged!="1"}
                                <div class="client-toggle pull-right">
                                    <select name="form_type" onchange="setFormType()">
                                        <option value="0">{$lang.newclient}</option>
                                        <option value="1">{$lang.alreadyclient}</option>
                                    </select>
                                </div>
                            {/if}


                            <div class="configuration-box client-details">
                                <div class="configuration-header">
                                    <h2>{$lang.ContactInfo}</h2>
                                </div>
                                <div class="configuration-body no-bg">

                                    {*CONTACT INFO*}
                                    {if $logged=="1"}
                                        <div class="client-logged">
                                            {include file="drawclientinfo.tpl"}
                                        </div>
                                    {else}
                                        <div id="clientForm" class="clear">
                                            {if $submit.cust_method=='login' || $submit.action=='login'}

                                                {include file='ajax.login.tpl'}

                                            {else}
                                                {include file='ajax.signup.tpl'}
                                            {/if}
                                        </div>
                                    {/if}

                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Additional informations -->
                    <div class="row">
                        <div class="span12">

                            <div class="configuration-box">
                                <div class="configuration-header">
                                    <h2>{$lang.c_tarea}</h2>
                                </div>
                                <div class="configuration-body additional-information no-bg">
                                    <textarea class="notes"></textarea>
                                </div>
                            </div>

                            <div class="tos">

                                <div class="padding">
                                    <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                                </div>

                                <button type="submit" class="btn btn-success checkout-button disabled" disabled="disabled">{$lang.checkout}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
    </body>
</html>