<div class="bordered-section article">
    <h2 class="bbottom ">{$page.title}</h2>
    <div class="p19">
        {$page.content}
    </div>
</div>
<script>
{literal}
if(window.location.href==={/literal}"{$system_url}page/contacto/"{literal}) {
         $("li#contacto").addClass("active");
}
{/literal}
</script>