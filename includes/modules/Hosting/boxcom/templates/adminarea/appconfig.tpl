<div style="padding-left: 180px;">
    <input type="hidden" value="{$security_token}" name="state" />
    <button type="submit" name="requestauth"  value="1" >Click here to authorize with box.com</button>
    {securitytoken}
</div>
<input type="hidden" value="{$server.password|escape}" name="password"/>
<input type="hidden" value="{$server.field1|escape}" name="field1"/>
<input type="hidden" value="{$server.field2|escape}" name="field2"/>