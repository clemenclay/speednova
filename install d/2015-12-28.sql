REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'configfields', 'domaindnssupport','DNS Management' FROM hb_language WHERE target!='user'
UNION SELECT id, 'configfields', 'domaindnssupport-description','Registrar independent dns management trough hostbill dns services. <a href="https://hostbill.atlassian.net/wiki/display/DOCS/Forms+-+DNS+Management">Wiki</a>' FROM hb_language WHERE target!='user';