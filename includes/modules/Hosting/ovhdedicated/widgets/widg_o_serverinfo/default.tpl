<h2>Server Information</h2>
<p>Your OS and hardware details are listed below.</p>
<br />
<div class="row">
    <div class="span4">
        <h3>CPU</h3>
        <p>{$cpu.name}<br/>
            Cores: {$cpu.core}<br/>
            Cache: {$cpu.cache.value}{$cpu.cache.unit}</p>
    </div>
    <div class="span4">
        <h3>RAM</h3>
        <p>
            {foreach from=$memory item=val key=type}
                {$val}x {$type}<br/>
            {/foreach}
        </p>
    </div>
</div>
        <br />
<div class="row">
    <div class="span4">
        <h3>Motherboard</h3>
        <p>{$motherboard.name}<br/>
            Manufacturer: {$motherboard.manufacturer}</p>
    </div>
    <div class="span4">
        <h3>Kernel version</h3>
        <p>{$os.kernelRelease}<br/>
            {$os.kernelVersion}</p>
    </div>
</div>