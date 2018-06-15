$(function() {
    var osProps = {
        family : 'Family',
        description: 'Description',
        bitFormat: 'Architecture',
        filesystems: 'Supported file systems'
    };
    var osdetails = $('#osdetails');
    $('#ostemplate').change(function() {
        var self = $(this);
        self.parents('form').eq(0).parent().addLoader();
        $.post(window.location.href, {
            act: 'tpl',
            id: self.val()
        }, function(data) {
            osdetails.empty();
            $('#preloader').hide();
            if (!data.tpl)
                return false;
            
            for(var key in osProps){
                if(typeof data.tpl[key] != 'undefined'){
                    var value = data.tpl[key].toString(),
                        capt = value.charAt(0);
                    value = capt.toUpperCase() + value.substr(1);
                    
                    osdetails.append($('<tr></tr>')
                        .append('<td><strong>'+osProps[key]+'</strong></td>')
                        .append('<td>'+value+'</td>')
                    )
                }
            }
        })
    });
    $('#install-progress').each(function(){
        var self = $(this),
            steps =  $('#install-steps');
        function refresh(){
            $.get(window.location.href + '&act=installstatus', function(data){
                if(!data.install)
                    return false;
                self.find('.bar').css('width', data.install.progress + '%').find('span').text(data.install.progress + '%');
                for(var i=0; i<data.install.steps.length; i++){
                    var step = data.install.steps[i],
                    trlabel = steps.find('tr').eq(i).find('.label');
                   
                    var text = step.status;
                    trlabel.removeClass('label-success label-danger label-warning');
                    switch(step.status){
                        case 'doing':
                            trlabel.addClass('label-warning');
                            text = 'in progress'
                            break;
                        case 'done':
                            trlabel.addClass('label-success');
                            break;
                        case 'error':
                            trlabel.addClass('label-danger');
                            break;
                    }
                    trlabel.text(text);
                }
                setTimeout(refresh, 10000);
            })
        }
        setTimeout(refresh, 10000);
    });
})