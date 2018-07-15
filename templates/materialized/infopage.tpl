<div class="bordered-section article">
    <h2 class="bbottom ">{$page.title}</h2>
    <div class="p19">
        {$page.content}
    </div>
</div>
{$ca_url}
<script>
{literal}
if(window.location.href==={/literal}"http://localhost/speednova/{$ca_url}page/contacto/"{literal}) {
         $("li#contacto").addClass("active");
}
{/literal}
</script>