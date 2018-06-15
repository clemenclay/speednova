<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>

    <base href="{$system_url}" />
    <script src="{$moduledirectory}plugins/jquery-2.1.1.min.js"></script>

    <!-- bootstrap for better look example, but not necessary -->
    <link rel="stylesheet" href="{$moduledirectory}plugins/bootstrap/css/bootstrap.css" type="text/css" media="screen, projection">

    <!-- Step Form Wizard plugin -->
    <link rel="stylesheet" href="{$moduledirectory}step-form-wizard/css/step-form-wizard.css" type="text/css" media="screen, projection">
    <script src="{$moduledirectory}step-form-wizard/js/step-form-wizard.js"></script>

    <!-- validation library http://parsleyjs.org/ -->
    <link rel="stylesheet" href="{$moduledirectory}plugins/parsley/parsley.css" type="text/css" media="screen, projection">
    <script src="{$moduledirectory}plugins/parsley/parsley.min.js"></script>
    {userheader}
{literal}
    <script>
        var sfw;
        $(document).ready(function() {
            sfw = $("#wizard_example").stepFormWizard({
                height: 'auto',
                onNext: function(i, wizard) {
                    return $('form', wizard).parsley().validate($('fieldset',wizard).eq(i).attr('id'));
                },
                onFinish: function(i) {
                    return $('form', wizard).parsley().validate();
                }
            });
        })

    </script>

    <style>
        pre {margin: 45px 0 60px;}
        p {margin-bottom: 10px;}
    </style>
{/literal}
</head>
<body>

<div class="container">
    <div class="site-index">
        <div class="body-content">

                <div class="row" style="padding:20px;">

                    <div class="col-md-6"><h2>{$business_name}</h2></div>
                    <div class="col-md-6"><a href="{$system_url}" class="btn btn-default pull-right" style="margin:23px 0px">&laquo; {$lang.backtoclientarea}</a></div>

                </div>
            <div class="row"  {if $error}style="display:block"{else}style="display:none"{/if}>
                <div id="errors" class="col-md-12 none">
                    <div class="alert alert-danger alert-dismissible" role="alert">


                        {if $error}
                            {foreach from=$error item=blad}{$blad}<br/>{/foreach}
                        {/if}                </div>

                </div>
            </div>
            <div class="row">


                <div class="col-md-12">
                    <form id="wizard_example" action="" method="post">         <input type="hidden" name="make" value="submit" />

                        {foreach from=$steps item=step key=k}

                        <fieldset id="step_{$step.id}">
                            <legend>{$step.name}</legend>
                            <div class="row">

                                {foreach from=$step.fields item=field}
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="fid_{$field.id}">{$field.name}</label>

                                        {$field.html}
                                    </div>
                                </div>
                                {/foreach}

                            </div>
                        </fieldset>
                        {/foreach}

                        <fieldset >
                            <legend>Create ticket</legend>
                            <div class="row">

                                    <div class="col-lg-12">
                                       <p>Thank you. You can now provide additional details in support ticket form that will open after clicking on "Finish".</p>
                                    </div>

                            </div>
                        </fieldset>
                        {securitytoken}
                    </form>
                </div>
            </div>

            <footer class="footer">
                <div class="container">
                    <p class="pull-left">© {$business_name} 2015</p>
                </div>
            </footer>
        </div>
    </div>
</div>
</body>
</html>