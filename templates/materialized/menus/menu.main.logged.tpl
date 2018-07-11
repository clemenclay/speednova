           <li class="user-details cyan darken-2 hide-on-med-and-up">
            <div class="row">
                <div class="col col s4 m4 l4">
                    <img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image">
                </div>
                <div class="col col s8 m8 l8">
                    
                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown">
                    {if $logged=='1'}
                                    {$login.firstname} {$login.lastname}
                    {/if}
                        <i class="mdi-navigation-arrow-drop-down right"></i></a><ul id="profile-dropdown" class="dropdown-content" style="width: 128px; position: absolute; top: 57px; left: 101.234px; opacity: 1; display: none;">
                        <li><a href="#"><i class="mdi-action-face-unlock"></i> Profile</a>
                        </li>
                        <li><a href="#"><i class="mdi-action-settings"></i> Settings</a>
                        </li>
                        <li><a href="#"><i class="mdi-communication-live-help"></i> Help</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="mdi-action-lock-outline"></i> Lock</a>
                        </li>
                        <li><a href="#"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                        </li>
                    </ul>
                    <p class="user-roal">Administrator</p>
                </div>
            </div> 
            </li>


</li>

<li class=""><a href="{$ca_url}clientarea/invoices/" class="waves-effect waves-cyan"><i class="mdi-editor-insert-invitation hide-on-med-and-up"></i> {$lang.invoices}</a>
</li>