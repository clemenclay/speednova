
   
        
    
        <aside id="left-sidebar-nav">
        <ul id="slide-out" class="side-nav fixed leftside-navigation ps-container ps-active-y" style="width: 240px;">
{if $logged=='1'}
        {include file='menus/menu.main.logged.tpl'}
    {else}
        {include file='menus/menu.main.notlogged.tpl'}
{/if}

            <li class="bold"><a href="index.html" class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i> Dashboard</a>
            </li> 

        <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 883px; right: 3px;"><div class="ps-scrollbar-y" style="top: 0px; height: 594px;"></div></div></ul>
        <a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="mdi-navigation-menu"></i></a>
        </aside>