{if $loginwidget}
    <div id="login-widget" style="display: none">
        
        <form id="login-widget-form" name="" action="{$ca_url}{$cmd}/{$action}" method="post">
            <div id="login-widget-block">
                <h2>{$lang.signin}</h2>
                <div class="separator-horizontal"></div>
                <span class="icon-stack pull-right" id="login-widget-close">
                    <i class="icon-circle icon-stack-base"></i>
                    <i class="icon-remove icon-light"></i>
                </span>
                <div class="input-prepend">
                    <i class="add-on icon-user"></i>
                    <input id="login-widget-user" name="username" type="text" 
                           placeholder="Username" required>
                </div>
                {if $enableFeatures.logincaptcha =='on'}
                    <div class="input-prepend input-append captcha-input">
                        <i class="add-on icon-refresh" onclick="$('#logincaptcha-bg').css('background-image', 'url(?cmd=root&action=captcha&t=' + (new Date()).getTime()+')');"></i>
                        
                        <input type="text" name="captcha" placeholder="{$lang.captcha}" />
                        <div class="captcha-bg" id="logincaptcha-bg" style="background-image: url(?cmd=root&action=captcha#w{$timestamp})"></div>
                        {*}<img class="capcha" src="?cmd=root&action=captcha#{$timestamp}" id="logincaptcha" alt="Login Image"/> {*}
                        <a href="#" onclick="" >{$lang.refresh}</a>
                    </div>
                {/if}
                <div class="input-prepend input-append">
                    <i class="add-on icon-lock"></i>
                    <input type="password" autocomplete="off" name="password" id="login-widget-password" 
                           placeholder="{$lang.password}" required />
                </div>
                <div class="separator-horizontal"></div>
                <button type="submit" class="btn progress-button" id="login-widget-submit" 
                    data-horizontal="" data-style="fill">{$lang.signin}</button>
            </div>
            <input type="hidden" name="action" value="login"/>
            {securitytoken}
        </form>
        <div id="login-widget-option"> 
            <a href="{$ca_url}signup/" class="list_item">{$lang.createaccount}</a>
            <a href="{$ca_url}root&amp;action=passreminder" class="list_item">{$lang.passreminder}</a>
        </div>
    </div>
{else}

    {include file="../common/tpl/ajax.login.tpl"}
{/if}