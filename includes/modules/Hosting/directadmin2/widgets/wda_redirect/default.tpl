
<div style="margin: 10px 0; padding: 0 10px;">
    {include file="`$widget_dir`../domain.tpl"}
    <h2>
        <span id="pageHeading">Redirects</span>
    </h2>

    <div class="body-content">
        <p class="description">
            A redirect allows you to make one domain redirect to another domain, 
            either for a website or a specific web page. For example, create
            a redirect so that <strong>www.example.com</strong> automatically
            redirects users to <strong>www.example.net</strong>. 
        </p>       
        <div class="section">
            <h3>Current Redirects</h3>
            <table id="redirecttbl" class="sortable table table-striped">
                <thead>
                    <tr>
                        <th class=" clickable">Source</th>
                        <th class=" clickable">Redirect</th>
                        <th class=" clickable">Type</th>
                        <th nonsortable="true">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$list item=entry}
                        <tr>
                            <td style="white-space: nowrap">{$domain}<b>{$entry.source}</b></td>
                            <td ><a href="{$entry.to}">{$entry.to|truncate:40:'...':false:true}</a></td>
                            <td >{$entry.type}</td>
                            <td >
                                <a href="{$widget_url}&act=del&path={$entry.source|escape:'url'}&security_token={$security_token}"
                                   onclick="return confirm('Do You really want to delete this entry?')">
                                    <span class="icon icon-trash" title="Remove"></span>
                                </a>
                            </td>
                        </tr>
                    {foreachelse}
                        <tr>
                            <td class="errors" colspan="8">There are no redirects configured for your account.</td>
                        </tr>
                    {/foreach}
                </tbody>
                <tfoot></tfoot>
            </table>
        </div>
        <div class="section">
            <h3>Add Redirect</h3>
            <p class="description">
                A permanent redirect will notify the visitor’s browser to update any bookmarks that are linked to the page that is being redirected. 
                Temporary redirects will not update the visitor’s bookmarks.
            </p>
            <br />

            <form action="{$widget_url}&act=add" name="mainform" method="POST" id="mainform">
                <div class="control-group">
                    <label for="ddlType">
                        Type
                    </label>
                    <div class="row">
                        <div class="span6">
                            <select class="form-control" name="type" id="ddlType">
                                <option value="301">Permanent (301)</option>
                                <option value="302">Temporary (302)</option>
                                <option value="303">See Other (303)</option>
                            </select>
                        </div>
                        <div class="span6">
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="urlpath">
                    </label>
                    <div class="row">
                        <div class="span6">
                            <div class="input-prepend form-inline">
                                <span class="add-on">{$domain}/</span><input type="text" id="urlpath" size="20"  name="path" style="width: 183px">
                            </div>
                        </div>
                        <div class="span6">
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="url">
                        redirects to
                    </label>
                    <div class="row">
                        <div class="span6">
                            <input type="text" size="55" class="form-control span4" name="url" id="url">
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <input type="submit" value="Add" class="btn btn-flat-primary btn-primary" id="submit-button">
                </div>
                {securitytoken}
            </form>
        </div>
    </div>
</div>

