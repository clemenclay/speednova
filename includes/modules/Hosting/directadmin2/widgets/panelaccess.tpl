<form id="qlogin" action="{$panel_url}CMD_LOGIN" method="POST" name="form" target="_blank" style="display: none">
    <input type=hidden name=referer value="/">
    <input type=hidden name=FAIL_URL value="{$fullwidget_url}">
    <input type=hidden name=LOGOUT_URL value="{$fullwidget_url}">
    <input type=hidden name=username value="{$service.username}">
    <input type=hidden name=password value="{$accesskey}">
</form>
{literal}
    <script>
        function wda_cplogin(url) {
            url = url || '/';
            $('#qlogin').find('[name=referer]').val(url).end().submit();
            return false;
        }
        $(document).on('click', '[data-cplogin]', function(e) {
            e.preventDefault();
            return wda_cplogin('/' + $(this).data('cplogin').replace(/^\//,''));
        })
    </script>
{/literal}