<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Bookstore Home</title>
<link href="/sgree41008/includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/sgree41008/includes/css/redo.css" rel="stylesheet" />
<script src="/sgree41008/includes/js/jQuery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/sgree41008/includes/bootstrap/js/bootstrap.js" type="text/javascript"></script>
</head>

<cfinclude template="stateinfo.cfm" />

<cfparam name="p" default="carousel" />

<cfparam name="tool" default="addedit" />

<body>
	<div id="wrapper" class="container">
		<div id="topHeader" class="row">
        	<cfinclude template="header.cfm" />
        </div>
    	<div id="horizontalnav" class="row">
        	<cfinclude template="mainnav.cfm" />
       	</div>
	    <div id="maincontent" class="row">
			<div id="center" class="col-sm-9 col-lg-9 col-md-9 col-sm-push-3">
            	<cfinclude template="#p#.cfm" />
			</div>
            <div id="leftgutter" class="col-sm-3 col-lg-3 col-md-3 col-sm-pull-9">
            	<cfinclude template="genrenav.cfm" />
            </div>
			
        </div>
    	<div id="footer" class="row">
        	Read Dese Books<br/>
            1 University Way<br/>
            Lowell, MA 
        </div>
	</div>
</body>
</html>

