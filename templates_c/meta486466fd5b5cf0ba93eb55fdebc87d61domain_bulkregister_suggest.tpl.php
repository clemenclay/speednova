<?php
return array (
  'type' => 'domain',
  'thumb' => 'templates/orderpages/images/bulk_domain_thumb.png',
  'configfile' => 'templates\\orderpages\\config\\domain_bulkregister_suggest.yml',
  'author' => 'HostBill team',
  'name' => 'Bulk domain registration + Domain name suggestions',
  'description' => 'Use this template with TLDs you wish to offer registration for. You can also assign this orderpage to product you wish to offer domain with.
	<br> For domain name suggestions to work you will need to activate a \'Domain suggestion\' plugin. 
	<br><br><strong>How-to Videos:</strong><br>
	<a class="external" target="_blank" href="http://cdn.hostbillapp.com/videos/orderpages/domain_suggestion_plugin.swf">Activating domain suggestions</a>',
  'img' => 'templates/orderpages/images/bulk_domain_preview.png',
  'file' => 'templates\\orderpages\\domain_bulkregister_suggest.tpl',
  'template' => 'domain_bulkregister_suggest',
  'template_old' => 'bulkregister_suggest',
  'typespecific' => false,
  'hash' => '486466fd5b5cf0ba93eb55fdebc87d61',
  'filebasename' => 'domain_bulkregister_suggest',
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