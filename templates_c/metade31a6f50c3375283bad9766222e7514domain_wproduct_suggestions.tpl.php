<?php
return array (
  'type' => 'domain',
  'thumb' => 'templates/orderpages/images/domain_generic_thumb.png',
  'configfile' => 'templates\\orderpages\\config\\domain_wproduct_suggestions.yml',
  'author' => 'HostBill team',
  'name' => 'Product with domain + Domain name suggestions',
  'description' => 'Order page with this template will not be displayed in cart. Use this template for domains that you wish to offer with product only.
	<br>For domain name suggestions to work you will need to activate a \'Domain suggestion\' plugin
	<br><br><strong>How-to Videos:</strong><br>
	<a class="external" target="_blank" href="http://cdn.hostbillapp.com/videos/orderpages/domain_suggestion_plugin.swf">Activating domain suggestions</a>',
  'file' => 'templates\\orderpages\\domain_wproduct_suggestions.tpl',
  'template' => 'domain_wproduct_suggestions',
  'template_old' => 'wproduct_suggestions',
  'typespecific' => false,
  'hash' => 'de31a6f50c3375283bad9766222e7514',
  'filebasename' => 'domain_wproduct_suggestions',
  'config' => 
  array (
    'suggestions' => 
    array (
      'value' => 10,
      'name' => 'Suggestions',
      'description' => 'Number of maximum sugested domain names',
      'type' => 'input',
    ),
  ),
);