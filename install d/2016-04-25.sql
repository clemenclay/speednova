INSERT INTO `hb_reports` (`id`, `type`, `name`, `query`, `options`, `handler`)
VALUES
	(NULL, 'Clients', 'List of customers with positive credit balance', 'SELECT DISTINCT cb.client_id as `Client ID`,\r\n cb.credit as `Credit Balance`,\r\n COALESCE(cur.code,sub.main_currency) as `Currency Code`,\r\n CONCAT(d.firstname,\' \',d.lastname) as `Client Name` \r\nFROM hb_client_details d \r\nINNER JOIN hb_client_billing cb ON cb.client_id = d.id \r\nINNER JOIN (SELECT value as main_currency, 0 as currency_id \r\nFROM hb_configuration \r\nWHERE\r\n setting = \'CurrencyCode\') sub ON sub.currency_id = 0 \r\nLEFT JOIN hb_currencies cur ON cur.id = cb.currency_id \r\nWHERE\r\n cb.credit > 0 \r\n\r\nORDER BY cb.credit DESC', 1, 'sql');
