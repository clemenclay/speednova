REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'clientarea', 'unpaid_invoice_for_service','This service have some unpaid invoices, cancellation is not possible, please contact support' FROM hb_language WHERE target='user';