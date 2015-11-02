
        <nav class="navbar navbar-default">
<div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#readDeseNav">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">
            <img src="/sgree41008/includes/classimages/rdb.png"/>
        </a>
    </div>
    <div class="collapse navbar-collapse" id="readDeseNav">
        <ul class="nav navbar-nav">
            <li class="active"><a href="index.html">Home</a></li>
            <li><a>Store Information</a></li>
            <li><a>Highlighted</a></li>
            <li><a>Events</a></li>
            <li>
            <cfoutput>
                <form class="navbar-form navbar-left" role="search" action="#cgi.SCRIPT_NAME#?p=details" method="post">
                    <div class="form-group">
                        <input type="text" name="searchme"  class="form-control" placeholder="Search">
                     </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
             </cfoutput>
            </li>
        </ul>
        <cfoutput>
        <ul class="nav navbar-nav navbar-right">
        <cfif session.isLoggedIn eq true>
        	<li><a> Hi #session.user.firstname#</a></li>
            <li><a href="#cgi.SCRIPT_NAME#?p=loggoff.cfm">Logoff</a></li>
        <cfelse>
            <li><a href="#cgi.SCRIPT_NAME#?p=login">Login</a></li>
       </cfif>
       </cfoutput>
        </ul>
    </div>
</div>
</nav>
