</div>
   <!-- START FOOTER -->
    <footer class="page-footer">
        <div class="container">
            <div class="row section">
                <div class="col l6 s12">
                    <h5 class="white-text">World Market</h5>
                    <p class="grey-text text-lighten-4">World map, world regions, countries and cities.</p>
                    <div id="world-map-markers"></div>
                </div>
                <div class="col l4 offset-l2 s12">
                    <h5 class="white-text">Sales by Country</h5>
                    <p class="grey-text text-lighten-4">A sample polar chart to show sales by country.</p>
                    <div id="polar-chart-holder">
                        <canvas id="polar-chart-country" width="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                Copyright © 2015 <a class="grey-text text-lighten-4" href="http://themeforest.net/user/geekslabs/portfolio?ref=geekslabs" target="_blank">GeeksLabs</a> All rights reserved.
                <span class="right"> Design and Developed by <a class="grey-text text-lighten-4" href="http://geekslabs.com/">GeeksLabs</a></span>
            </div>
        </div>
    </footer>
    <!-- END FOOTER -->


    <!-- ================================================
    Scripts
    ================================================ -->
    

    <!--materialize js-->
    <script type="text/javascript" src="{$template_dir}js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="{$template_dir}js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    

    <!-- chartist -->
    <script type="text/javascript" src="{$template_dir}js/plugins/chartist-js/chartist.min.js"></script>   

    <!-- chartjs -->
    <script type="text/javascript" src="{$template_dir}js/plugins/chartjs/chart.min.js"></script>
    <script type="text/javascript" src="{$template_dir}js/plugins/chartjs/chart-script.js"></script>

    <!-- sparkline -->
    <script type="text/javascript" src="{$template_dir}js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="{$template_dir}js/plugins/sparkline/sparkline-script.js"></script>
    
 

    
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="{$template_dir}js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="{$template_dir}js/custom-script.js"></script>
    <!-- Toast Notification -->
    <script type="text/javascript">
    {literal}
    // Toast Notification
    $(window).load(function() {
        setTimeout(function() {
            Materialize.toast('<span>Hiya! I am a toast.</span>', 1500);
        }, 1500);
        setTimeout(function() {
            Materialize.toast('<span>You can swipe me too!</span>', 3000);
        }, 5000);
        setTimeout(function() {
            Materialize.toast('<span>You have new order.</span><a class="btn-flat yellow-text" href="#">Read<a>', 3000);
        }, 15000);
    });
     {/literal}
    </script>

    <!--
{if $logged!='1'}
            {include file="ajax.login.tpl" loginwidget=true}
        {/if}
        {userfooter}
-->
</body>

</html>