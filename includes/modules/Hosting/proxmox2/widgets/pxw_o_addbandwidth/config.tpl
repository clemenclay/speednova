<div>
    <label class="nodescr">Description</label>
    <textarea style="width: 60%; height: 100px" name="config[description]">{$widget.config.description}</textarea>
</div>
<div class="netbwwidget">
    <label>
        Offered Items 
        <small>Added bandwidth will use units from network tab in product configuration</small>
    </label>
    
    <ul class="form-horizontal">
        {foreach from=$widget.config.items item=opt key=k}
            <li>
                <input class="col-sm-1" type="text" value="{$opt.data_sent}" pattern="\d+" name="config[datasent][]" placeholder="Sent" /> Sent,
                <input class="col-sm-1" type="text" value="{$opt.data_received}" pattern="\d+" name="config[datarecv][]" placeholder="Received" /> Received
                for <input class="col-sm-1" type="text" value="{$opt.price}" class="col-sm-1" name="config[price][]" pattern="[\d.,]+" placeholder="Price"/> {$currency.code}
                <a class="btn btn-danger btn-sm">Remove</a>
            </li>
        {/foreach}
        <li class="bw-template">
            <input class="col-sm-1" type="text" pattern="\d+" name="config[datasent][]" placeholder="Sent" required /> Sent,
            <input class="col-sm-1" type="text" pattern="\d+" name="config[datarecv][]" placeholder="Received" required /> Received
            for <input type="text" class="col-sm-1" pattern="[\d.,]+" name="config[price][]" placeholder="Price" required/> {$currency.code}
            <a class="btn btn-primary btn-sm">Add</a>
        </li>
    </ul>
</div>
{literal}
    <script>
        $(function(){
            $('#facebox').off('click.bw-act').on('click.bw-act', 'a.btn-danger', function(){
                $(this).parent().remove();
            });
            
            $('#facebox .netbwwidget').off('input.bw-act').on('input.bw-act', 'input', function(){
                var self = $(this);
                self.toggleClass('has-error', !self[0].checkValidity())
            });
            
            $('#facebox .bw-template a').click(function(){
                var self  = $(this).parent();
                var clone = self.clone();
                clone.find('a').text('Remove').addClass('btn-danger');
                
                self.before(clone);
                self.find('input').val('');
            })
        });
    </script>
    <style>
        #facebox .netbwwidget{
            clear:both
        }
        #facebox .netbwwidget input{
            float: none;
            margin: 2px 0;
        }
        #facebox .netbwwidget ul{
            overflow: hidden;
            list-style: none;
            margin:0;
            padding: 0 10px;
        }
        #facebox .netbwwidget .has-error{
            border-color: red;
        }
        #facebox .netbwwidget .has-error:focus{
            border-color: red;
            box-shadow:0 0px 4px rgba(245, 34, 34, 1.2);
            outline: none;
        }
    </style>
{/literal}