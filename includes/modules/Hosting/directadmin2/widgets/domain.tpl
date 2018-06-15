{if $wda_domains}
    <form id="wda_domain" action="{$widget_url}" method="POST" name="form" class="pull-right form-inline" style="float: right;margin: 0">
        <select name="switchdomain" id="wda_switchdomain">
            {foreach from=$wda_domains item=dom}
                <option {if $domain == $dom}selected="selected"{/if}>{$dom}</option>
            {/foreach}
        </select>
    </form>
    {literal}
        <script>
            $(document).on('change', '#wda_switchdomain', function(e) {
                e.preventDefault();
                $('#wda_domain').submit();
            })
        </script>
    {/literal}
{/if}