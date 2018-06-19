ALTER TABLE  `hb_invoices` ADD  `flags` INT( 11 ) NOT NULL DEFAULT  '0',
ADD INDEX (  `flags` );
##########
REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'cart', 'ccpaymentprocessing','Processing Payment' FROM hb_language WHERE target='user'
UNION SELECT id, 'cart', 'ccpaymentredirection','Please wait while your payment is being processed, if you are not redirected in 5 seconds please refresh this page.' FROM hb_language WHERE target='user';
##########
INSERT INTO `hb_reports` (`id`, `type`, `name`, `query`, `options`, `handler`) VALUES
(NULL, 'Orders', 'Total transaction fees by gateway, sort by period', 'SELECT m.modname as `Gateway Name`,\r\nhb_currency(SUM(t.fee) ,\r\nt.currency_id,t.rate) as `Total Fee` \r\nFROM hb_modules_configuration `m` \r\nINNER JOIN hb_transactions `t` ON (t.module = m.id) \r\nWHERE\r\n t.date > :date_bottom \r\nAND t.date < :date_top \r\nGROUP BY t.module', 1, 'sql'),
(NULL, 'Orders', 'Total transactions count by gateway, sort by period', 'SELECT m.modname as `Gateway Name`,\r\nCOUNT(t.id) as `Transactions count` \r\nFROM hb_modules_configuration `m` \r\nINNER JOIN hb_transactions `t` ON (t.module = m.id) \r\nWHERE\r\n t.date > :date_bottom \r\nAND t.date < :date_top \r\nGROUP BY t.module', 1, 'sql'),
(NULL, 'Orders', 'Discounts by promocode', 'SELECT \r\nc.code as `Promotional coupon`,\r\nSUM(l.discount) AS `Total Discount`,\r\nCOUNT(l.id) AS `Times Used`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`\r\nFROM \r\nhb_coupons c\r\nJOIN\r\nhb_coupons_log l ON (l.coupon_id=c.id)\r\nJOIN \r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_currencies cx \r\nON cx.id=b.currency_id\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\n\r\n\r\nGROUP BY b.currency_id,c.id', 1, 'sql'),
(NULL, 'Clients', 'List of credits applied to client accounts in given period', 'SELECT\r\nl.date AS `Date`,\r\nl.`in` AS `Credit Applied`,\r\nl.`admin_id` AS `Staff ID`,\r\nCOALESCE(mc.modname,''None'') AS `Gateway`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`,\r\nl.client_id AS `Client Id`,\r\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client name`\r\nFROM\r\nhb_client_credit_log l\r\nJOIN\r\nhb_client_details cd ON cd.id =l.client_id\r\nJOIN\r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\r\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\r\n\r\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\r\n\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\nAND\r\nl.`in`>0\r\n\r\n\r\nORDER BY l.date ASC', 1, 'sql'),
(NULL, 'Clients', 'Amount of credit applied to client accounts in given period by gateway', 'SELECT\r\nSUM(l.`in`) AS `Credit Applied`,\r\nCOALESCE(mc.modname,''None'') AS `Gateway`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`\r\nFROM\r\nhb_client_credit_log l\r\nJOIN\r\nhb_client_details cd ON cd.id =l.client_id\r\nJOIN\r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\r\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\r\n\r\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\r\n\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\nAND\r\nl.`in`>0\r\n\r\nGROUP BY b.currency_id,t.module', 1, 'sql'),
(NULL, 'Clients', 'Amount of credit applied to client accounts in given period by staff member', 'SELECT\r\nSUM(l.`in`) AS `Credit Applied`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`,\r\nl.admin_id AS `Staff ID`\r\nFROM\r\nhb_client_credit_log l\r\nJOIN\r\nhb_client_details cd ON cd.id =l.client_id\r\nJOIN\r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\r\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\r\n\r\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\r\n\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\nAND\r\nl.`in`>0\r\n\r\nGROUP BY b.currency_id AND l.admin_id', 1, 'sql');