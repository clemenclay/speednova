{if $cf.items && $cf.type == 'slider'}
{foreach from=$cf.items item=cit}
    <tr {if $smarty.foreach.loop.index == 0} class="no-border" {/if}>
        <td class="slider-name"><span>{$cf.description} </span> {$cf.name} </td>
        <td>
            <input
                    name="custom[{$cf.id}][{$cit.id}]"
                    value="{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}"
                    type="hidden"
                    style="display:none"
                    id="custom_field_{$cf.id}"
                    onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"
                    />
            <div class="main-slider-bg" data-number="{$slideno}">
                <div class="middle-layer">
                    <div class="main-slider bar slider-color-{$slideno}">
                        <span></span>
                    </div>
                    <div class="slider-label"><span></span></div>
                </div>
            </div>
        </td>
        <td>
            <div class="customize-btns">
                <div class="customize-btn-bg">
                    <div class="customize-btn btn-minus">
                        <i class="icon-customize-minus"></i>
                    </div>
                </div>

                <div class="customize-btn-bg">
                    <div class="customize-btn btn-plus">
                        <i class="icon-customize-plus"></i>
                    </div>
                </div>
            </div>
        </td>
        <td class="total"><span>{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}</span></td>
    </tr>
    <script type="text/javascript">
        mainSlider.push( {literal}{{/literal}
            max : parseInt('{$cf.config.maxvalue}') || 100 ,
            min : parseInt('{$cf.config.minvalue}') || 0,
            step : parseInt('{$cf.config.step}') || 1 ,
            value : parseInt('{if $contents[1][$cf.id][$cit.id].qty}{$contents[1][$cf.id][$cit.id].qty}{else}{$cf.config.initialval}{/if}') || 0,
            index: parseInt('{$slideno}'),
            {literal}}){/literal};
    </script>
{/foreach}
{/if}