<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/dedicated_new/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_dedicated_new.yml',
  'author' => 'HostBill team',
  'name' => 'Dedicated Servers Full-screen',
  'description' => 'This order page has been created specifically to help you sell dedicated servers in modern, professional way.',
  'img' => 'templates/orderpages/dedicated_new/preview.png',
  'file' => 'templates\\orderpages\\cart_dedicated_new.tpl',
  'template' => 'cart_dedicated_new',
  'template_old' => 'dedicated_new',
  'typespecific' => false,
  'hash' => 'ac672ff187caef873978f1ffd08bdee5',
  'filebasename' => 'cart_dedicated_new',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'template' => 
    array (
      'value' => 'hide',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/dedicated_new/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'subheader' => 
    array (
      'value' => 'Quick and easy setup. Great prices! Impossible is nothing...',
      'name' => 'Sub-header',
      'description' => 'This phrase will be displayed under category name',
      'type' => 'input',
    ),
    'subheader_text' => 
    array (
      'value' => 'Over <strong>2000 companies</strong> around the globe including hosting companies, Cloud/IaaS/VPS Solutions Providers,
Domain name and SSL Resellers use <strong>HostBill</strong> to manage their online business.',
      'name' => 'Sub-header text',
      'description' => 'This phrase will be displayed below sub header',
      'type' => 'textarea',
    ),
    'server_img' => 
    array (
      'name' => 'Product images',
      'value' => '<li>opteron.png</li>
<li>xenon.png</li>
<li>opteron.png</li>
<li>xenon.png</li>',
      'type' => 'featurelist',
      'description' => 'Image names used in \'Best sellers\' listing, used also in later steps<br />All images need to be placed in orderpages/dedicated_new/img/',
    ),
    'feature_list_header' => 
    array (
      'value' => 'Key <strong>features</strong>',
      'name' => 'Features header',
      'description' => 'Use this to draw more attention to your plan',
      'type' => 'input',
    ),
    'feature_list' => 
    array (
      'name' => 'Features list',
      'value' => '<li>No operators limits</li>
<li>Free GeoIP tracking, no database update fees</li>
<li>Included in HostBill for free, no additional fees</li>
<li>Chat History, printable transcripts</li>
<li>Install on own server, keep control</li>
<li>Seamless integration with HostBill Ticketing system</li>
<li>Engage website visitors to chat</li>
<li>Ban unwanted visitors from using chat</li>',
      'type' => 'featurelist',
    ),
    'footer_header_left' => 
    array (
      'value' => 'Need <strong>Help</strong>',
      'name' => 'Left footer header',
      'type' => 'input',
    ),
    'subfooter_first' => 
    array (
      'value' => 'Knowledgebase',
      'name' => 'First block header',
      'type' => 'input',
    ),
    'subfooter_first_text' => 
    array (
      'value' => 'You can find answers to frequently asked questions, articles, tutorials and guides written by our team in our <a href="?cmd=knowledgebase">knowledgebase</a>.',
      'name' => 'First block',
      'description' => 'First left most block, html available',
      'type' => 'textarea',
    ),
    'subfooter_last' => 
    array (
      'value' => 'Support tickets',
      'name' => 'Second block header',
      'type' => 'input',
    ),
    'subfooter_last_text' => 
    array (
      'value' => 'We provide online support that you can easily access from your client portal,
you can easly submit a ticket directly from <a href="?cmd=support">our support page</a>,
or by sending us an email.',
      'name' => 'Second block',
      'description' => 'Second left most block, html available',
      'type' => 'textarea',
    ),
    'footer_header_right' => 
    array (
      'value' => 'Our <strong>Company</strong>',
      'name' => 'Right footer header',
      'type' => 'input',
    ),
    'footer_text_right' => 
    array (
      'value' => 'For presales questions <a href="?cmd=tickets&action=new">open support ticket</a> for presales department<br />
For support related enquiries - <a href="?cmd=support">visit support seciton</a><br />
Contact with us directly via info[at]hostbillapp.com<br />
Phone consultations schedule a call by <a href="?cmd=tickets&action=new">opening pre-sales question ticket</a>',
      'name' => 'Right footer',
      'description' => 'Right most block with dark background, html available',
      'type' => 'textarea',
    ),
  ),
);