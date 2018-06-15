<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name} </title>
        <link href="{$template_dir}dist/stylesheets/application.css?v={$hb_version}" rel="stylesheet" media="all" />
        <link href="{$template_dir}dist/stylesheets/font-awesome.min.css?v={$hb_version}" rel="stylesheet" media="all" />
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h1>QuickBooks Online</h1>
            </div>
            <p class="lead">Connected sucesfully.</p>
            <p>You can safely close this window</p>
        </div>
        {literal}
        <script type="text/javascript">
            setTimeout(function(){
                window.close()
            }, 10000);
        </script>
        {/literal}
    </body>
</html>
