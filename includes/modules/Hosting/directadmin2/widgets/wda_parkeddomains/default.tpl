
<div style="margin: 10px 0; padding: 0 10px;">
    {include file="`$widget_dir`../domain.tpl"}
    <h2>
        <span id="pageHeading">Aliases</span>
    </h2>
    <div class="body-content">
        <p class="description" id="descAliases">
            Domain aliases make your website available from another domain name. 
            For example, you can make <strong>www.example.net</strong> and <strong>www.example.org</strong> show content from <strong>www.example.com</strong>. 
        </p>
        <div class="section">
            <table class="sortable table table-striped" id="parkeddomaintbl">
                <thead>
                    <tr>
                        <th class=" clickable">Domain</th>
                        <th nonsortable="true">Destination</th>
                        <th nonsortable="true">Type</th>
                        <th nonsortable="true">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$list item=entry key=key}
                        <tr>
                            <td >{$entry.domain}</td>
                            <td >{$entry.target}</td>
                            <td >{if $entry.type == 'alias'}Alias{else}Redirect{/if}</td>
                            <td >
                                <a href="{$widget_url}&act=del&name={$entry.domain}&security_token={$security_token}"
                                   onclick="return confirm('Do You really want to delete this entry?')">
                                    <span class="icon icon-trash" title="Remove"></span>
                                </a>
                            </td>
                        </tr>
                    {foreachelse}
                        <tr>
                            <td class="errors" colspan="5">
                                No aliases are present on your account.
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
                <tfoot></tfoot>
            </table>
        </div>
        <div class="section">
            <h3 id="hdrCreate">
                Create a New Alias
            </h3>
            <div class="parked-domain form-horizontal">
                <form id="domainform" action="{$widget_url}&act=add" method="POST">
                    <div class="form-group control-group">
                        <label for="domain" id="lblDomain">
                            Domain
                        </label>
                        <div class="row">
                            <div class="input-append span6">
                                <input type="text" id="domain" name="domain">{*}
                                {*}<span class="add-on"> <i class="icon icon-chevron-right"></i> </span>{*}
                                {*}<span class="add-on">{$domain}</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group control-group">
                        <label for="domain" id="lblDomain">
                            Type
                        </label>
                        <div class="row">
                            <div class="span6">
                                <select name="type">
                                    <option value="alias">Alias</option>
                                    <option value="redirect">Redirect</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Add Domain" name="go" id="domain_submit" class="btn btn-flat-primary btn-primary">
                    </div>
                    {securitytoken}
                </form>
            </div>
        </div>
    </div>
</div>
