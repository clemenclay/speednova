
{if $error}
<script>
{literal}
swal({   title: "{/literal}{foreach from=$error item=blad}{$blad}{/foreach}{literal}",   
            type: "error",
            timer: 2000,   
            showConfirmButton: true 
        });

{/literal}
//swal("{foreach from=$error item=blad}{$blad}{/foreach}", "", "error")</script>
{/if}



<div id="infos"  {if $info}style="display:block"{/if}>

     <div class="alert alert-info">
        <a class="close" >&times;</a>
        {if $info}
        {foreach from=$info item=infos}{$infos}<br/>{/foreach}
        {/if}
    </div>
</div>