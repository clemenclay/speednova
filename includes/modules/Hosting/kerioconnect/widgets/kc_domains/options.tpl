
<table style="width: 100%">
    <tr>
        <td> <strong>Domain aliases </strong></td>
    </tr>
    <tr>
        <td>
            <input type="checkbox" name="config[disablealias]" value="1" {if $widget.config.disablealias}checked="checked"{/if} class="inp" style="vertical-align: middle; margin: 5px"/>
            Disable creation of domain aliases
        </td>
    </tr>

    <tr>
        <td> <strong>Widget description</strong></td>
    </tr>
    <tr>
        <td>
            <textarea name="config[wdescription]" class="inp" style="width: 90%"
                      placeholder="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nisi mi, suscipit in tincidunt sit amet, fringilla eget arcu. Sed sagittis accumsan metus non pharetra">{$widget.config.wdescription}</textarea>
        </td>
    </tr>
</table>