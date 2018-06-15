{*

Manage contacts

*}

<div class="white-container white-bg">
    <div class="padding">
        <div class="account-info-container">
            <h2>{$lang.profiles}</h2>
            <p>{$lang.profileinfo}</p>

            <!-- Table -->
            <div class="table-box m20">
                <div class="table-header">
                </div>
                <table class="table table-striped table-header-fix table-config">
                    <tr>
                        <th>{$lang.firstname}</th>
                        <th>{$lang.lastname}</th>
                        <th>{$lang.email}</th>
                        <th>{$lang.lastlogin}</th>
                        <th class="w10"></th>

                    </tr>
                    {foreach from=$profiles item=p name=ff}

                        <tr class="no-border">
                            <td>{$p.firstname}</td>
                            <td>{$p.lastname}</td>
                            <td>{$p.email}</td>
                            <td>
                                {if !$p.lastlogin|dateformat:$date_format} -
                                {else}{$p.lastlogin|dateformat:$date_format}
                                {/if}
                            </td>
                            <td class="align-r">
                                <div class="btn-group">
                                    <a class="btn btn-white small-p dropdown-toggle" data-toggle="dropdown" href="#">
                                        <i class="icon-c-cog"></i>
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu c-dropdown-menu">
                                        <li><a href="{$ca_url}profiles/edit/{$p.id}/" style="color:#737373">{$lang.editcontact}</a></li>
                                        <li><a href="{$ca_url}profiles/loginascontact/{$p.id}/" style="color:#737373">{$lang.loginascontact}</a></li>
                                        <li><a href="{$ca_url}profiles/&do=delete&id={$p.id}&security_token={$security_token}" onclick="return confirm('{$lang.areyousuredelete}');" style="color:red">{$lang.delete}</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    {foreachelse}
                        <tr>
                            <td colspan="20">
                                {$lang.nothing}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <!-- End of Table -->
            <div class="m20">
                <a href="{$ca_url}profiles/add/" class="btn btn-green"><i class="icon-add-w"></i> {$lang.addnewprofile}</a>
            </div>
        </div>
    </div>
</div>     

