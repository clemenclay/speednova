<div id="formcontainer">
    <div id="formloader" style="background:#fff;padding:10px;"> <form action="?cmd=module&module={$moduleid}&do=newrack&floor_id={$floor_id}" method="post" id="addcolocation">

            <div class="tabb colo_newrack">
                <h3 style="margin:0px;">Create new Rack</h3>

                <div class="form" style="margin:10px 0px">
                    <label class="nodescr">Name</label>
                    <input name="name" type="text" />

                    <label class="nodescr">Room</label>
                    <input name="room" type="text" value="{$rack.room}"/>
                    
                    <label class="nodescr">Units [U]</label>
                    <input name="units" type="text" size="4" value="50"/>


                    <label class="nodescr">Weight (empty) [lbs]</label>
                    <input name="empty_weight" size="4" value="0.00" type="text" />

                    <label class="nodescr">Connector speed [MBps]</label>
                    <input name="networkspeed" size="6" type="text" value="1000" />




                </div>

                <div class="clear"></div>
            </div>


        </form></div>

    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span id="savechanges" >
                <span class="bcontainer " ><a class="new_control greenbtn" href="#" onclick="$('#addcolocation').submit(); return false"><span><b>Add new rack</b></span></a></span>
                <span >{$lang.Or}</span>
            </span>
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');return false;"><span>{$lang.Close}</span></a></span>
        </div>
        <div class="clear"></div>
    </div>

</div>