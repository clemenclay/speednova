
<div class="bordered-section article">
    <h2>Select department</h2>

        <div style="padding: 10px 19px">
    {foreach from=$departments item=dept}

        <h3><a href="?cmd=supportfields&action=selectdepartment&department={$dept.id}">{$dept.name}</a></h3>
        <p>{$dept.description}</p>
    {/foreach}
        </div>
</div>