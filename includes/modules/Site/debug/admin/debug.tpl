{literal}
    <script src="templates/default/js/json-formatter.js"></script>

    <script type="text/javascript">
        $(function () {

            var level = $('#level')
            var tick = $('#tick');

            var log = document.getElementById('debuglogs'),
                follow = true;

            function htmllog(record) {
                console.log(record);
                var html = '<span class="label label-' + record.level_name + '">' + record.level_name + '</span>\
                        <span class="log-date">' + record.datetime.date + '</span>\
                        <span class="log-msg">' + record.message + '</span>';

                if (record.trace)
                    html += '<span class="log-trace">' + record.trace + '</span>';

                var e = document.createElement('div');
                e.className = 'log'
                e.innerHTML = html;
                log.appendChild(e);

                if (record.context && (!Array.isArray(record.context) || record.context.length)) {
                    var formatter = new JSONFormatter(record.context, 0, {hoverPreviewEnabled: true});
                    e.appendChild(formatter.render())
                }
                if (follow)
                    log.scrollTop = log.scrollHeight;
            }
            var pause = false;
            function pull() {
                if (pause)
                    return setTimeout(pull, 1000);

                tick.attr('class', 'load');
                $('#taskMGR').taskQuickLoadShow();
                $.ajax({
                    url: '?cmd=debug&action=pull&lightweight=1&level=' + level.val(),
                    error: function () {
                        $('#taskMGR').taskQuickLoadHide();
                        setTimeout(function () {
                            tick.removeClass('load err');
                        }, 1000)
                        tick.addClass('err');
                        setTimeout(pull, 5000)
                    },
                    success: function (data) {
                        $('#taskMGR').taskQuickLoadHide();
                        for (var x in data) {
                            for (var i = 0, l = data[x].length; i < l; i++) {
                                htmllog(data[x][i])
                            }
                        }
                        setTimeout(pull, data.length ? 1000 : 5000)
                    }
                })
            }
            pull();

            $('#clear-logs').on('click', function () {
                log.innerHTML = '';
                return false;
            })

            $('#pause-logs').on('click', function () {
                var self = $(this);
                pause = !pause;
                self.toggleClass('active', pause);
                return false;
            })

            $('#follow-logs').on('click', function () {
                var self = $(this);
                follow = !follow;
                self.toggleClass('active', follow);
            })

            $('#queue-logs').on('click', function () {
                var dialog = bootbox.dialog({
                    message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> Loading...</div>',
                    onEscape: true,
                    backdrop: true
                }),
                    jobst = {
                        '-1': ['default', 'DRAFT'],
                        1: ['warning', 'WAITING'],
                        2: ['warning', 'RUNNING'],
                        3: ['danger', 'FAILED'],
                        4: ['success', 'COMPLETE']
                    };


                $.get('?cmd=debug&action=queue&lightweight=1', function (data) {
                    var body = $('.modal-body', dialog),
                        formatter;
                    body.find('.text-center').remove();

                    for (var i = 0, l = data.length; i < l; i++) {
                        var job = data[i],
                            div = document.createElement('div');

                        div.innerHTML = job.added
                            + ' <span class="label label-' + jobst[job.status][0] + '">' + jobst[job.status][1] + '</span> '
                            + job.description + ' ' + job.human_description
                            + ' <span class="label label-primary">' + job.queue + '</span>'
                            + (job.rel_type !== 'None' ? ' <span class="label label-danger">' + job.rel_type + ': ' + job.rel_id + '</span>' : '')
                            + (job.parent_id != '0' ? ' <span class="label label-info">parent job: ' + job.parent_id + '</span>' : '');

                        formatter = new JSONFormatter(data[i], 0, {hoverPreviewEnabled: true});
                        div.appendChild(formatter.render())

                        body[0].appendChild(div)
                    }
                })
            });

            $('#hook-logs').on('click', function () {
                var dialog = bootbox.dialog({
                    message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> Loading...</div>',
                    onEscape: true,
                    backdrop: true
                })
                $.get('?cmd=debug&action=hooks&lightweight=1', function (data) {
                    var body = $('.modal-body', dialog),
                        formatter = new JSONFormatter(data, 1, {hoverPreviewEnabled: true});
                    body.find('.text-center').remove();
                    body[0].appendChild(formatter.render())
                })
            });
        })
    </script>  
    <style>

        #logs-fixed{
            position: fixed;
            top: 80px;
            left: 0;
            width: 100%;
            bottom: 0;
            padding: 10px;
        }
        #logs-fixed .content{
            height: 80px;
            padding: 10px 0;
        }
        #debuglogs{
            height: calc(100% - 100px);
            width: 100%;
            font-family: monospace;
            overflow: scroll;
        }
        .log{
            padding: 4px 6px;
            border-top: 1px solid #d8d8d8;
        }
        .log:nth-child(2n){
            background: #eee;
        }
        .log-date{
            color: #888
        }
        .log-trace,
        .log-context{
            display: block;
            white-space: pre-wrap;
        }
        .label-DEBUG{
            background: #4e79f5;
        }
        .label-INFO{
            background: #00bcd4;
        }
        .label-WARNING{
            background: orange;
        }
        .label-ERROR{
            background: red;
        }
        .log .json-formatter-row .json-formatter-toggler:after{
            font-family: sans-serif;
            font-size: 10px
        }
        .log .json-formatter-row .json-formatter-string{
            white-space: pre-wrap;
        }
    </style>
{/literal}
<div id="logs-fixed">
    <h1><div>Debugging page</div></h1>
    <div class="content">
        <div class="btn-group">
            <a href="#clear" class="btn btn-default" id="clear-logs">Clear</a>
            <a href="#pause" class="btn btn-default" id="pause-logs">Pause</a>
            <a href="#folow" class="btn btn-default active" id="follow-logs">Follow</a>
        </div>
        <a href="#Hooks" class="btn btn-default" id="hook-logs">Hooks</a>
        <a href="#Queue" class="btn btn-default" id="queue-logs">Queue</a>
        <a href="?cmd=root&action=phpinfo" class="btn btn-default" id="hook-phpinfo" target="_blank">PHPInfo</a>
    </div>
    <div id="debuglogs"></div>
</div>


