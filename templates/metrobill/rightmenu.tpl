<aside class="right_menu" {if $cmd=='cart' || ($cmd=='clientarea' && $action=='services') || $cmd=='tickets'}style='display:none'{/if}>
    <header><h1>{$business_name}</h1></header>
	
	<div class="dashboard-right-content">
            {if $cmd == 'clientarea' && $action == 'default'}
			<h4 class="main-h">{$lang.curbalance|capitalize}</h4>
            <p class="main-p">Basic information about your account</p>
            
            <ul class="square-list horizontal-list clearfix">
            	<li>
                    	<div class="square-box ballance-box">
                        	<div class="box">
                            	<i class="ico-ballance"></i>
                            </div>
                            <p>Your Ballance</p>
							<div class="ballance"><span class="currency">{if $currency.sign}{$currency.sign}{/if}</span>{if $acc_credit_balance < 0}- {/if}{$acc_credit_balance|abs|price:$currency:false} <span class="usd">{if $currency.code} {$currency.code}{/if}</span></div>
							<!--<div class="left-btns">
                                <button type="submit" class="btn btn-flat-manage btn-small"><i class="ico-manage"></i> Manage</button>
                            </div>-->
                        </div>
                </li>
				{if $enableFeatures.deposit!='off' }
				<li>
					<a href="{$ca_url}clientarea/addfunds/">
					<div class="funds-box">
						<div class="box">
                            	<i class="ico-add"></i>
                            </div>
					<p>{$lang.addfunds}</p>
					</div>
					</a>
				</li>
				{/if}
                
            </ul>
            
            <div class="line"></div>
			
			{/if}
            
            <h4 class="main-h">{$lang.quicklinks}</h4>
            <p class="main-p">Most important links for your account</p>
            
            <ul class="square-list quick-list">
				<li class="menu">Menu</li>
            	<li>
                	<a href="{$ca_url}tickets/new/">
                        	<div class="middle-cricle">
                            	<span class="ico-ticket"></span>
                            </div>
							<div class="arrow"></div>
                            <p>{$lang.openticket|capitalize}</p>
							
                    </a>
                </li>
                <li>
                	<a href="{$ca_url}profiles/">
                        	<div class="middle-cricle">
                            	<span class="ico-contact"></span>
                            </div>
							<div class="arrow"></div>
                            <p>{$lang.managecontacts|capitalize}</p>
							
                    </a>
                </li>
                <li>
                	<a href="{$ca_url}clientarea/ipaccess/">
                        	<div class="middle-cricle">
                            	<span class="ico-security"></span>
                            </div>
							<div class="arrow"></div>
                            <p>{$lang.security|capitalize}</p>
                    </a>
                </li>
                <li>
                	<a href="{$ca_url}knowledgebase/">
                        	<div class="middle-cricle">
                            	<span class="ico-book"></span>
                            </div>
							<div class="arrow"></div>
                            <p>{$lang.knowledgebase}</p>
                      
                    </a>
                </li>
                <li>
                	<a href="{$ca_url}netstat/">
                        	<div class="middle-cricle">
                            	<span class="ico-status"></span>
                            </div>
							<div class="arrow"></div>
                            <p>{$lang.netstat|capitalize}</p>
                    </a>
                </li>
            </ul>
        </div>
		
</aside>

