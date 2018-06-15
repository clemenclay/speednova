$(document).ready(function() {
    var name = $('#name'),
        type = $('#type');
        
    name.bind('input keyup change', function(){
        var user = type.find('[value=user]');
        user.text(user.text().replace(/[^\/]*$/, $(this).val()));
    })
    
    type.change(function(){
        if(type.val() == 'custom'){
            type.next().show();
        }else
            type.next().hide();
    }).change();
});
