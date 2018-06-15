
{include file='ajax.formnavigation.tpl'}


<div class="container-fluid" id="asker">
    <div class="wizard-form-wrapper">
        <h4 class="wizard-step-long-title"></h4>

        <form class="well" method="POST"  enctype="multipart/form-data">
        <input type="hidden" name="step" value="{$currentstep}" />
        <input type="hidden" name="make" value="submit" />


            {foreach from=$fields item=field}

            <div class="control-group   ">

                <label class="control-label" for="id_{$field.id}">
                    <div class="label-field-text-wrapper {if $field.configuration.required}label-for-required-field{/if}">{$field.name}</div>

                </label>

                <div class="controls">
                    {$field.html}
                </div>

            </div>

            {/foreach}


            <input id="Continue" class="button is-success pull-right" type="submit" value="Continue"/>
            <div style="clear: both;"></div>
    {securitytoken}
        </form>

    </div>

</div>