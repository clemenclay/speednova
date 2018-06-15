{if $console}

    <script src="includes/types/xenservtype/clientarea/include/util.js"></script>
    <script src="includes/types/xenservtype/clientarea/console.js"></script>

    <div id="noVNC_screen" style="width: 720px;margin: 10px auto;">
        <div id="noVNC_status_bar" class="noVNC_status_bar" style="margin-top: 0px;">
            <table border=0 width="640px"><tr>
                    <td><div id="noVNC_status">Loading</div></td>
                    <td width="1%"><div id="noVNC_buttons">
                            <input type=button value="Send CtrlAltDel"
                                   id="sendCtrlAltDelButton">
                        </div></td>
                </tr></table>
        </div>
        <canvas id="noVNC_canvas" width="640px" height="20px">
            Canvas not supported.
        </canvas>
    </div>



    <script>

        var res = "{$console.res}";
        var session = "{$console.session}";

        var rfb;

        {literal}
        INCLUDE_URI = "includes/types/xenservtype/clientarea/include/";
        Util.load_scripts(["webutil.js", "base64.js", "websock.js", "des.js",
            "input.js", "display.js", "jsunzip.js", "rfb.js"]);
        window.onscriptsload = function () {



            setUpConnection(res,session);
        };
    </script>
{/literal}
{else}
    <div style="color: red; text-align: center; "><strong>Sorry, console is unavailable at this point</strong></div>
{/if}