<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:07
         compiled from adminwidgets/systeminfo.tpl */ ?>
<?php if ($this->_tpl_vars['self_check']): ?>

        <table class="whitetable fs11 statustables" width="100%" cellspacing="0" cellpadding="3">
            <tr class="odd">
                <td width="12%" align="right">PHP</td>
                <td width="12%"><?php if ($this->_tpl_vars['self_check']['php']['ok']): ?><b><?php echo $this->_tpl_vars['self_check']['php']['version']; ?>
</b><?php else: ?><b class="err vtip_description" title="Error: HostBill requires PHP 5.6+, with lower versions it may not work stable."><?php echo $this->_tpl_vars['self_check']['php']['version']; ?>
</b><?php endif; ?></td>
                <td width="12%" align="right">MySQL</td>
                <td width="12%"><?php if ($this->_tpl_vars['self_check']['mysql']['ok']): ?><b><?php echo $this->_tpl_vars['self_check']['mysql']['version']; ?>
</b><?php else: ?><b class="err vtip_description" title="Error: HostBill requires MySQL 5+, with lower versions it wont work stable."><?php echo $this->_tpl_vars['self_check']['mysql']['version']; ?>
</b><?php endif; ?></td>
                <td width="12%" align="right">PDO</td>
                <td width="12%"><?php if (! $this->_tpl_vars['self_check']['pdo']): ?><b>Enabled</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is compiled without PDO extension, to make sure all modules work add pdo+pdo_mysql to your php">Disabled</b><?php endif; ?></td>
                <td width="12%" align="right">PDO_MySQL</td>
                <td><?php if (! $this->_tpl_vars['self_check']['pdo_mysql']): ?><b>Enabled</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is compiled without PDO_MySQL extension, to make sure all modules work add pdo+pdo_mysql to your php">Disabled</b><?php endif; ?></td>
            </tr>
            <tr class="even">
                <td  align="right">cURL installed</td>
                <td ><?php if (! $this->_tpl_vars['self_check']['curl']): ?><b>Yes</b><?php else: ?><b class="err vtip_description" title="ERROR: Your PHP missing cURL extension - HostBill will not work stable!">Disabled</b><?php endif; ?></td>
                <td  align="right">cURL enabled</td>
                <td ><?php if (! $this->_tpl_vars['self_check']['curl_disabled']): ?><b>Yes</b><?php else: ?><b class="err vtip_description" title="ERROR: cURL is in php.ini disable_functions - HostBill will not work stable!">Disabled</b><?php endif; ?></td>
                <td align="right">JSON</td>
                <td><?php if (! $this->_tpl_vars['self_check']['json']): ?><b>Enabled</b><?php else: ?><b class="err vtip_description" title="ERROR: Your PHP is missing JSON support, many modules will not work.">Disabled</b><?php endif; ?></td>
                <td align="right">SimpleXML</td>
                <td><?php if (! $this->_tpl_vars['self_check']['simplexml']): ?><b>Enabled</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing JSON support, many modules will not work.">Disabled</b><?php endif; ?></td>
            </tr>

            <tr class="odd">
                <td  align="right">Memory Limit</td>
                <td ><?php if ($this->_tpl_vars['self_check']['memory_limit']['ok']): ?><b><?php echo $this->_tpl_vars['self_check']['memory_limit']['limit']; ?>
</b><?php else: ?><b class="err vtip_description" title="Error: Your PHP memory_limit is too low - PDF invoice generation may fail. HostBill require at leasts 32M"><?php echo $this->_tpl_vars['self_check']['memory_limit']['limit']; ?>
</b><?php endif; ?></td>
                <td  align="right">Magic Quotes</td>
                <td ><?php if (! $this->_tpl_vars['self_check']['magic_quotes']): ?><b>Disabled</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP have magic_quotes_gpc enabled in php.ini. It may slow down HostBill performance.">Enabled</b><?php endif; ?></td>
                <td align="right">SPL</td>
                <td><?php if (! $this->_tpl_vars['self_check']['spl']): ?><b>Enabled</b><?php else: ?><b class="err vtip_description" title="ERROR: Your PHP is missing SPL extension - many functions will not work!.">Disabled</b><?php endif; ?></td>
                <td align="right">IMAP</td>
                <td><?php if (! $this->_tpl_vars['self_check']['imap']): ?><?php if (! $this->_tpl_vars['self_check']['imap_ssl']): ?><b>Enabled</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP IMAP extension is missing SSL support, importing tickets using POP method over ssl will fail.">No ssl support</b><?php endif; ?><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing IMAP extension, importing tickets using POP method will fail.">Disabled</b><?php endif; ?></td>
            </tr>
            <tr class="even">

                <td align="right">PHP MBstring</td>
                <td><?php if (! $this->_tpl_vars['self_check']['mbstring']): ?><b>Yes</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing mbstring extension - PDF invoice customization wont work.">No</b><?php endif; ?></td>

                <td align="right">DOM support</td>
                <td><?php if (! $this->_tpl_vars['self_check']['dom']): ?><b>Yes</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing DOM extension - PDF invoices may not work.">No</b><?php endif; ?></td>
                <td  align="right">GD installed</td>
                <td ><?php if (! $this->_tpl_vars['self_check']['gd']): ?><b>Yes</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing GD extension - PDF invoices will not show images.">No</b><?php endif; ?></td>
                <td  align="right">GD GIF</td>
                <td ><?php if (! $this->_tpl_vars['self_check']['gdgif']): ?><b>Yes</b><?php else: ?><b class="warn vtip_description" title="Warning: Your PHP is missing GD extension - PDF invoices will not show images">No</b><?php endif; ?></td>

            </tr>
            <tr class="odd">
                <td width="12%" align="right">Main HB dir</td>
                <td width="12%"><?php echo $this->_tpl_vars['hb_maindir']; ?>
</td>
                <td colspan="6"></td>
            </tr>
        </table>

        <script type="text/javascript">
            <?php echo '
            function fn123() {
                $("b.vtip_description").vTip();
            }
            appendLoader(\'fn123\');
            '; ?>

        </script>


<?php endif; ?>