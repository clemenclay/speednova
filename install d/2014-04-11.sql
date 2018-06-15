REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'clientarea', 'snapshot','Snapshot' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'algorithm','Algorithm' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'stickiness','Stickiness' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'helthcheck','Helth Check' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'roundrobin','Round-robin' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'leastconnections','Least connections' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'source','Source' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vmassigment','VM Assignment' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'setupvpn','Setup VPN' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'creatingsnapshot_desc','Creating VM Snapshot will prevent you from attaching new volumes to the VM or deleting any existing volumes.VM snapshots which include memory state can\'t be kept if you upgrade/downgrade VM resources. Any existing VM snapshots of this type will be discarded.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'snapshotmemory','Snapshot memory' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'revertthissnapshot','Revert to this snapshot' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'loadbalancing','Load Balancing' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpn_csdesc','VPN allows to connect securely from your home or office network to a private network in the cloud.' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpnaccessip','Your VPN access is currently enabled and can be accessed via the IP' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpnipseckey','Your IPSec pre-shared key is' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpndisableforip','Disable VPN for' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpnenableforip','Enable VPN for' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'pleaseselectip','Please select an IP' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpnrequireip','At least one Public IP is required to setup VPN' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'setup','Setup' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'vpnuser','VPN User' FROM hb_language WHERE target='user'
UNION SELECT id, 'clientarea', 'adduser','Add user' FROM hb_language WHERE target='user'
UNION SELECT id, 'editadmins', 'deleteDomains','Delete Domains' FROM hb_language WHERE target!='user'
UNION SELECT id, 'editadmins', 'editDomains','Edit Domains' FROM hb_language WHERE target!='user';