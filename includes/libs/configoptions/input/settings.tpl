
<div class="clear"></div><label for="text-keya">Default value<small>Set initial value</small></label>
<input id="text-keya" type="text" name="config[initialval]" value="{$field.config.initialval|escape}" />


<div class="clear"></div><label for="text-keyx">Unique <small>With this option customer would need to enter value that was not used before</small></label>
<input id="text-keyx" type="checkbox"  name="config[unique]" {if $field.config.unique}checked="checked"{/if} value="1" />

<div class="clear"></div><label for="text-keyb">Regular expression<small>Regex to validate field value against</small></label>
<input id="text-keyb" type="text" name="config[expression]" value="{$field.config.expression|escape}" />

