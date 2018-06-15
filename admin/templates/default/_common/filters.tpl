<div class="filters row">
    {foreach from=$filters item=filter key=name}
        <div class="form-group col-sm-6 col-md-4 col-lg-3" id="filter-{$name}" >
            {if $filter.type != 'radio' && $filter.type != 'checkbox'}
                <label>
                    {if $filter.name}{$filter.name}
                    {elseif $lang[$filter.lang]}{$lang[$filter.lang]}
                    {else}{$name|ucfirst}
                    {/if}
                </label>
            {/if}
            {if $filter.description}
                <a href="#" title="{$filter.description}" class="vtip_description"></a>
            {/if}
            {if $filter.type == 'select'}
                <select name="filter[{$name}]" class="form-control {$filter.class}">
                    <option value=""> - </option>
                    {foreach from=$filter.optgroups item=group}
                        <optgroup label="{if $group.name}{$group.name}{elseif $lang[$group.lang]}{$lang[$group.lang]}{else}{$group.lang}{/if}">
                            {foreach from=$group.options item=opt}
                                <option value="{$opt.value}" 
                                        {if $opt.value == $currentfilter[$name]}selected{/if}>
                                    {if $opt.name}{$opt.name}
                                    {elseif $lang[$opt.lang]}{$lang[$opt.lang]}
                                    {else}{$opt.value|ucfirst}
                                    {/if}
                                </option>
                            {/foreach}
                        </optgroup>
                    {/foreach}
                    {foreach from=$filter.options item=opt}
                        <option value="{$opt.value}" 
                                {if $opt.value == $currentfilter[$name]}selected{/if}>
                            {if $opt.name}{$opt.name}
                            {elseif $lang[$opt.lang]}{$lang[$opt.lang]}
                            {else}{$opt.value|ucfirst}
                            {/if}
                        </option>
                    {/foreach}
                </select>
            {elseif $filter.type == 'textarea'}
                <textarea name="filter[{$name}]" 
                          class="form-control {$filter.class}">{$currentfilter[$name]}</textarea>
            {elseif $filter.type == 'radio' || $filter.type == 'checkbox'}
                {foreach from=$filter.options item=opt}
                    <div class="{$filter.type}">
                        <label>
                            <input type="{$filter.type}" value="{$opt.value}" 
                                   name="filter[{$name}][]" 
                                   class="{$filter.class}" 
                                   {if $currentfilter[$name]}checked{/if}>
                            {if $opt.name}{$opt.name}
                            {elseif $lang[$opt.lang]}{$lang[$opt.lang]}
                            {else}{$opt.value|ucfirst}
                            {/if}
                        </label>
                    </div>
                {foreachelse}
                    <div class="{$filter.type}">
                        <label>
                            <input type="{$filter.type}" value="{$filter.value|default:1}" name="filter[{$name}]" 
                                   class="{$filter.class}" 
                                   {if $currentfilter[$name]}checked{/if}>
                            {if $filter.name}{$filter.name}
                            {elseif $lang[$filter.lang]}{$lang[$filter.lang]}
                            {else}{$name|ucfirst}
                            {/if}
                        </label>
                    </div>
                {/foreach}
            {elseif $filter.type == 'datepicker'}
                <div class="datepicker">
                    <input type="text" value="{$currentfilter[$name]}"
                           name="filter[{$name}]" class="form-control haspicker {$filter.class}">
                </div>
            {elseif $filter.type == 'tpl'}
                {include file=$filter.tpl}
            {else}
                <input type="text" value="{$currentfilter[$name]}" 
                       name="filter[{$name}]" class="form-control {$filter.class}">
            {/if}
        </div>
    {/foreach}
</div>
<div class="filters-actions row"> 
    <div class="col-md-12">
        <input type="submit" value="{$lang.Search}" class="btn btn-primary btn-sm" />
        <input type="submit" value="{$lang.Cancel}" class="btn btn-default btn-sm"
               onclick="$('#hider2').show();
                       $('#hider').hide();
                       return false;"/>
    </div>
</div>
{literal}
    <script>
        $(function () {
            $('.filters .chosenedge').chosenedge({width: "100%", enable_split_word_search: true, search_contains: true})
            $('.filters a.vtip_description').vTip()
        })
    </script>
{/literal}