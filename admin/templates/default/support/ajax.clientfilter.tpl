<form class="blu" id="clientfilterf" method="post">
{include file='clients/ajax.emailcriterias.tpl'}


    <center><input type="button" name="submit" value="Get matching clients" style="font-weight: bold;" onclick="return submit_clientfilter()"/></center>
    {securitytoken}
</form>
{literal}
    <script>
    function submit_clientfilter() {
        $.post('?cmd=sendmessage&make=getids&'+$('#clientfilterf').serialize(),function(data){
            console.log(data);
           if(data.ids) {
                $('#client_ids').val(data.ids)
           }
            $(document).trigger('close.facebox');
        });
        return false;
    }
    </script>
{/literal}