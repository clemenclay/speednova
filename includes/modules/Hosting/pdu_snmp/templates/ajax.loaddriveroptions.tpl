{if $features}<div>
    <b>Show readings to staff/customer: </b><br/>
    {if $features.active_power}<input type="checkbox" name="custom[active_power]" value="1" {if $server.custom.active_power}checked="checked"{/if}/> Active Power <br/>{/if}
    {if $features.apparent_power}<input type="checkbox" name="custom[apparent_power]" value="1"  {if $server.custom.apparent_power}checked="checked"{/if}/> Apparent Power <br/>{/if}
    {if $features.current}<input type="checkbox" name="custom[current]" value="1" {if $server.custom.current}checked="checked"{/if} /> Current <br/>{/if}
    {if $features.maxcurrent}<input type="checkbox" name="custom[maxcurrent]" value="1" {if $server.custom.maxcurrent}checked="checked"{/if} /> Maximum Current <br/>{/if}
    {if $features.voltage}<input type="checkbox" name="custom[voltage]" value="1" {if $server.custom.voltage}checked="checked"{/if} /> Voltage <br/>{/if}


    {if $features.username}
        <strong>Enter web login access details:</strong> <br/>
        Username: <input type="text" name="custom[username]" value="{$server.custom.username}" class="inp" /> <br/>
        Password: <input type="password" name="custom[password]" value="{$server.custom.password}" class="inp" /> <br/>
    {/if}


</div>{else}
    <br/>
{/if}
<b>Power billing is: </b>
{if !$power_billing}
    <label class="label label-warning">Unavailable</label>
{elseif $power_billing==1}
    <label class="label label-success">Available</label>
{elseif $power_billing==2}
    <label class="label label-info">Available, averaged</label>
{elseif $power_billing==3}
    <label class="label label-info">Available, averaged</label>
{elseif $power_billing==4}
    <label class="label label-info">Available, averaged for entire device</label>



{/if}