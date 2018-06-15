{if $cf.items && $cf.type == 'slider'}
    {foreach from=$cf.items item=cit name=loop}
    <div class="slider-box {if $vslider == 0} no-ml {/if}">
        <div class="slider-bg slider-color-{$vslider}">
            <input
                    name="custom[{$cf.id}][{$cit.id}]"
                    value="{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}"
                    type="hidden"
                    style="display:none"
                    id="custom_field_{$cf.id}"
                    onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"
                    />
            <p>{$cf.name}</p>
            <div class="circular-wrapper">
                <div id="circular-slider-{$vslider}" class="circular-position"></div>
                <div class="white-border">
                    <div>
                        <p class="value-{$vslider}"><span>{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}</span> {$cf.description}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider-field clearfix">
            <div id="main-slider-{$vslider}" class="slider-path"></div>
            <div class="min-text">Min</div>
            <div class="max-text">Max</div>
        </div>
    </div>
    <script type="text/javascript">
        _slider.push( {literal}{{/literal}
            max : parseInt('{$cf.config.maxvalue}') || 100 ,
            min : parseInt('{$cf.config.minvalue}') || 0,
            step : parseInt('{$cf.config.step}') || 1 ,
            value : parseInt('{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}') || 0,
            index: parseInt('{$slideno}'),
            {literal}}){/literal};
    </script>
    {/foreach}
{/if}