REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'clientarea', 'forceoff','Force Off' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'sshkeys','SSH Keys' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vmbackup','VM Backup' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'diskbackup','Disk Backup' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'creditleft','Credit left' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'yourbrowsernotsupported','Your browser is not supported' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'reconnect','Re-connect' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'aresurewantsendctrlaltdel','Are you sure you want to send Ctrl+Alt+Del?' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'cpuusagethisvirtualserver','CPU usage for this virtual server' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'thechartshowsinstantutilizationaccu','The top chart shows instant CPU utilization accurate to within one min in the last 24 hours.The bottom chart shows hourly utilization. You can zoom into a specific time period by clicking and dragging in a chart.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'licensingtype','Licensing Type' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'yourlicense','Your own license' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'licensekey','License Key' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'createvmbackup','Create VM backup' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'iopsthisdisk','IOPS for this Disk' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'youzoomintospecifictimeperiodclicki','You can zoom into a specific time period by clicking and dragging in a chart.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'recipes','Recipes' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'public','public' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'savethisprivateintofileyourmachine','Save this private key into a file on your machine' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'generatedkey','Generated key' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'registerkey','Register Key' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'registerexistingpublickey','Register existing public key' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'youmusthaveprivatekeythepairandpass','You must have the private SSH key of the key pair (and passphrase, if it has one).' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'addkey','Add key' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'ref','Ref' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'reversedns','Reverse DNS' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'networkinterfaceusage','Network Interface Usage' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'thechartshowsbandwidthusedthelastho','The top chart shows bandwidth used in the last 24 hours accurate to within one min. The bottom chart shows hourly usage.You can zoom into a specific time period by clicking and dragging in a chart.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'compatiblewith','Compatible with' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'step','Step' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'steps','Steps' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'addstep','Add Step' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'editstep','Edit Step' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'addsteprecipe','Add step to recipe' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'script','Script' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'resultsource','Result source' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'exitcode','Exit Code' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'and','and' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'passanythingelse','Pass anything else' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'passvalues','Pass values' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'onsuccess','On success' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'proceed','Proceed' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'gostep','Go to step' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'failanythingelse','Fail anything else' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'failvalues','Fail values' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'onfailure','On failure' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'updatestep','Update step' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'recipe','Recipe' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'runrecipeoncevirtualservers','Run Recipe once on Virtual Server(s)' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'onthispagecanselectvirtualserversth','On this page you can select Virtual Servers that are currently running and run the Recipe once on selected.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'applyselectedvs','Apply to selected VS' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'runvs','Run on VS' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'newrecipe','New Recipe' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'createrecipe','Create new Recipe' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'scripttype','Script type' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'addrecipe','Add Recipe' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vmrecipes','VM Recipes' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'recipevariables','Recipe Variables' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'variablename','Variable name' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'value','Value' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'addvariable','Add new variable' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsprovisioning','VS Provisioning' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'unassign','Unassign' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'norecipes','No recipes' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsnetworkrebuild','VS Network rebuild' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsdiskadded','VS Disk added' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsnetworkinterfaceadded','VS Network Interface added' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsdiskresized','VS Disk resized' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vsresize','VS Resize' FROM hb_language WHERE target='user'
UNION SELECT id, 'global', 'assign','Assign' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'assignrecepieevent','Assign Recepie to event' FROM hb_language WHERE target='user';