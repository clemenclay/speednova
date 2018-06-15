<div class="form-control">
    <label>Replication Frequency</label>
    <select name="frequency" id="frequency">
        <option value="ON_DEMAND">On Demand</option>
        {foreach from=$freqs item=freq}
            <option value="{$freq|upper}">{$freq|capitalize}</option>
        {/foreach}
    </select>
</div>
<div class="form-control frequency frequency-MINUTELY">
    <label>Execute every</label>
    <select name="minutelyValue" class="span1" id="everyMinute">
    </select>
    minutes
</div>
<div class="form-control frequency frequency-HOURLY frequency-DAILY" >
    <label>Starting Minute</label>
    <select name="startingMinute" class="span1" id="startingMinute">
    </select>
    minutes
</div>
<div class="form-control frequency frequency-DAILY form-inline">
    <label>Hours of Day</label>
    <div id="hoursOfDay">

    </div>
</div>
<div class="form-control frequency frequency-WEEKLY frequency-MONTHLY frequency-YEARLY" >
    <label>Starting Time</label>
    <select name="startingHour" class="span1" id="startingHour">

    </select> :
    <select name="startingMinute" class="span1" id="startingMinute">

    </select>
</div>
<div class="form-control frequency frequency-WEEKLY form-inline">
    <label>Days of Week</label>
    <div id="daysOfWeek">

    </div>
</div>
<div class="form-control frequency frequency-MONTHLY form-inline">
    <label>Days of Month</label>
    <div id="daysOfMonth">

    </div>
</div>
<div class="form-control frequency frequency-YEARLY">
    <label>Day of Month</label>
    <select name="dayOfMonth" class="span1" id="dayOfMonth">

    </select>
</div>
<div class="form-control frequency frequency-YEARLY form-inline">
    <label>Months of Year</label>
    <div id="monthsOfYear">

    </div>
</div>