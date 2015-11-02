<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Management Home</title>
<link href="/sgree41008/includes/bootstrap/css/bootstrap.css" rel="stylesheet"></link>
<link href="/sgree41008/includes/css/redo.css" rel="stylesheet" />
<script src="/sgree41008/includes/js/jQuery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/sgree41008/includes/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="/sgree41008/includes/ckeditor/ckeditor.js" type="text/javascript"></script>
</head>


<cfparam name="tool" default="addedit" />

<body>

	<div id="wrapper" class="container">
		<div id="header" class="row">
        	<cfinclude template="managenav.cfm" />
        </div>
        
    	<div id="mainarea" class="row">
        	<cfinclude template="#tool#.cfm" />
       	</div>
	    
	</div>
</body>
</html>

