
function setUpConnection(res,session) {

    var getLocation = function(href) {
        var l = document.createElement("a");
        l.href = href;
        return l;
    };

    var location    = getLocation(res);
    host        = location.hostname;
    path        = location.pathname + location.search + "&session_id=" + session;
    var path2   = path.replace('/','');
    port        = 80;

    $D('sendCtrlAltDelButton').style.display = "inline";
    $D('sendCtrlAltDelButton').onclick = sendCtrlAltDel;

    if(rfb)
        try {rfb.disconnect()} catch(err) {};

    rfb = new RFB({'target':   $D('noVNC_canvas'),
        'encrypt':      (port==443),
        'true_color':   WebUtil.getQueryVar('true_color', true),
        'local_cursor': WebUtil.getQueryVar('cursor', true),
        'shared':       WebUtil.getQueryVar('shared', true),
        'view_only':    WebUtil.getQueryVar('view_only', false),
        'updateState':  updateState,
        'onPasswordRequired':  passwordRequired});
    rfb.connect(host, port, "", path2);
}
function sendCtrlAltDel() {
    rfb.sendCtrlAltDel();
    return false;
}

function passwordRequired(rfb) {
    var msg;
    msg = '<form onsubmit="return setPassword();"';
    msg += '  style="margin-bottom: 0px">';
    msg += 'Password Required: ';
    msg += '<input type=password size=10 id="password_input" class="noVNC_status">';
    msg += '<\/form>';
    $D('noVNC_status_bar').setAttribute("class", "noVNC_status_warn");
    $D('noVNC_status').innerHTML = msg;
}
function updateState(rfb, state, oldstate, msg) {
    var s, sb, cad, level;
    s = $D('noVNC_status');
    sb = $D('noVNC_status_bar');
    cad = $D('sendCtrlAltDelButton');
    switch (state) {
        case 'failed':       level = "error";  break;
        case 'fatal':        level = "error";  break;
        case 'normal':       level = "normal"; break;
        case 'disconnected': level = "normal"; break;
        case 'loaded':       level = "normal"; break;
        default:             level = "warn";   break;
    }

    if (state === "normal") { cad.disabled = false; }
    else                    { cad.disabled = true; }

    if (typeof(msg) !== 'undefined') {
        sb.setAttribute("class", "noVNC_status_" + level);
        s.innerHTML = msg;
    }
}

