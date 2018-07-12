<div class="col s12 m4">
                <ul class="collection">
                  <a href="#!" class="collection-item">Alan<span class="badge">1</span></a>
                  <a href="#!" class="collection-item">Alan<span class="new badge">4</span></a>
                  <a href="#!" class="collection-item">Alan
                                                </a><a href="#!" class="collection-item">Alan<span class="badge">14</span></a>
                </ul>
              </div>




<h2 style="color: transparent;">Menu</h2>
<div class="card">
        <ul class="list-group list-group-flush">
            <li class="list-group-item{if $action=='details'} active{/if}"><a href="{$ca_url}clientarea/details/"><span class="iconfont-card iconfont-size4 silver" style=""></span>
                <h4>{$lang.mydetails}</h4></a>
            </li>

            <li class="list-group-item{if $action=='password'} active{/if}"><a href="{$ca_url}clientarea/password/"><span class="iconfont-lock iconfont-size4 silver" style=""></span>
                <h4>{if $clientdata.contact_id}{$lang.changemainpass}{else}{$lang.changepass}{/if}</h4></a>
            </li>

            {if $enableFeatures.deposit!='off' }
            <li class="list-group-item{if $action=='addfunds'} active{/if}"><a href="{$ca_url}clientarea/addfunds/"><span class="iconfont-plus-round iconfont-size4 silver" style=""></span>
                <h4>{$lang.addfunds}</h4></a>
            </li>
            {/if}
            {if $clientdata.contact_id!='off'}
            <li class="list-group-item{if $action=='profilepassword'} active{/if}"><a href="{$ca_url}clientarea/profilepassword/"><span class="iconfont-lock iconfont-size4 silver" style=""></span>
                <h4>{$lang.changemypass}</h4></a>
            </li>
            {/if}


            {if $enableCCards!='off'}
            <li class="list-group-item{if $action=='ccard'} active{/if}"><a href="{$ca_url}clientarea/ccard/"><span class="iconfont-extract iconfont-size4 silver" style=""></span>
                <h4>{$lang.ccard}</h4></a>
            </li>
            {/if}


            {if $enableACH!='off'}
                <li class="list-group-item{if $action=='ach'} active{/if}"><a href="{$ca_url}clientarea/ach/"><span class="iconfont-card iconfont-size4 silver" style=""></span>
                    <h4>{$lang.ACHecheck}</h4></a>
                </li>
            {/if}
            <!--
            <div class="box-feature{if $cmd=='profiles'} active{/if}"><a href="{$ca_url}profiles/"><span class="iconfont-add-user iconfont-size4 silver" style=""></span>
                <h4>{$lang.profiles}</h4></a>
            </div>-->
            {if $enableFeatures.security=='on'}
            <li class="list-group-item{if $action=='ipaccess'} active{/if}"><a href="{$ca_url}clientarea/ipaccess/"><span class="iconfont-cloud-upload iconfont-size4 silver" style=""></span>
                <h4>{$lang.ipaccess}</h4></a>
            </li>
            {/if}
        </ul>
</div>