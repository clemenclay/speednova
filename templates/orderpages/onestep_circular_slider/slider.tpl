{if $cf.items && $cf.type == 'slider'}
    {foreach from=$cf.items item=cit}
        <div class="left-slider-box">
            <div class="left-slider-bg">
                <div id="small-slider-{$slideno}" class="left-slider-gradient" data-slider="{$slideno}">
                    <div class="left-slider-img">
                        <div class="left-slider-inner-bg">
                            <p class="name">{$cf.name} {$cf.price}</p>
                            <p class="value">{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}</p>
                        </div>
                    </div>
                </div>
            </div>
            <input
                    name="custom[{$cf.id}][{$cit.id}]"
                    value="{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}"
                    type="hidden"
                    style="display:none"
                    id="custom_field_{$cf.id}"
                    onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"
                    />
            <div class="slider-option">
                <div class="inner-bg slider-less">
                    <i class="icon-slider-less"></i>
                </div>
            </div>
            <div class="slider-option right">
                <div class="inner-bg slider-more">
                    <i class="icon-slider-more"></i>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            smallSlider.push( {literal}{{/literal}
                max : parseInt('{$cf.config.maxvalue}') || 100 ,
                min : parseInt('{$cf.config.minvalue}') || 0,
                step : parseInt('{$cf.config.step}') || 1 ,
                value : parseInt('{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}') || 0,
                obj: false,
                index: parseInt('{$slideno}'),
                id : {$cf.id}
                {literal}}){/literal};
        </script>
    {/foreach}
{/if}