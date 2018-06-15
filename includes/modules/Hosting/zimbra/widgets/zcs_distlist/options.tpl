<table style="width: 100%">
    <tr>
        <td> <strong>Edit account</strong></td>
    </tr>
    <tr>
        <td>
            <input type="checkbox" name="config[disableedit]" value="1" {if $widget.config.disableedit}checked="checked"{/if} class="inp" style="vertical-align: middle; margin: 5px"/>
            Disable option to edit account
        </td>
    </tr>

    <tr>
        <td> <strong>Archive account</strong></td>
    </tr>
    <tr>
        <td>
            <input type="checkbox" name="config[disablearhive]" value="1" {if $widget.config.disablearhive}checked="checked"{/if} class="inp" style="vertical-align: middle; margin: 5px"/>
            Disable option to enable/disable archive even if COS allows it
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