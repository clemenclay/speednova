 <table border="0" cellpadding="6" cellspacing="0" width="100%" style="margin-bottom:10px;">
     <tr>
         <td></td>
         <td>Provide your remote monitoring node details. Create separate App in HostBill for new node..</td>
     </tr>
       <tr><td  align="right" width="165"><strong>Node IP</strong></td><td ><input  name="ip" size="60" value="{$server.ip}" class="inp"/></td></tr>
       <tr><td  align="right" width="165"><strong>API User</strong></td><td ><input  name="username" size="25" value="{$server.username}" class="inp"/></td></tr>
      <tr><td  align="right" width="165"><strong>API Password</strong></td><td ><input type="password" name="password" size="25" class="inp" value="{$server.password}" autocomplete="off"/></td></tr>
        
      
        <tr>
         <td></td>
         <td><b>Creating new node:</b></td>
     </tr> 
     <tr>
         <td></td>
         <td><div id="htacode" class="code" style=" margin: 5px 0px; -webkit-box-shadow: rgb(136, 136, 136) 0px 0px 2px inset; padding: 10px;">
#1. Create VM with Centos 6.5 x86_64  - fresh install <br/>
#2. Login as root, issue command: <br/>
# wget -O - http://install.hostbillapp.com/hbmonitoring/install.sh | /bin/bash <br/>
#3. update /home/nodemonit/uptime/config/default.yaml  <b>monitor</b> section - set api user, password and url to your hostbill <br/>
#4. Start monitoring node: /etc/init.d/hbmonitoring start <br/>
#5. Update connection details above with api username/password set in step 3.
<br/><br/>
If you're using CGI/FCGI php handler, and up/down notifications do not work, add following in your HostBill .htaccess file: <br/>{literal}
&lt;IfModule mod_rewrite.c&gt;<br/>
     RewriteEngine on<br/>
     RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization},L]<br/>
&lt;/IfModule&gt; {/literal}
</div>
         </td>
     </tr>
    </table>
