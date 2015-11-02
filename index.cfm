<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>UML Database Course - name</title>
</head>
<cfparam name="content" default="" />
<cfif content neq ''>
	<cffile action="read" file="#expandpath('/')#includes/#content#" variable="content" />
</cfif>
<cfinclude template="/includes/names.cfm" />
<cfdirectory directory="#expandpath('.')#" name="alldirs" recurse="no" type="dir">
<link href="/includes/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="/includes/css/class.css" type="text/css" rel="stylesheet">
<script src="/includes/js/class.js" type="text/javascript"></script>
<body>
	<div id="wrapper" class="col-lg-12">
    	<cfoutput>
			<div id="adminnav" style="float:none; clear:both; height:50px; ">
				<ul class="nav nav-pills" style="margin-left:auto; display:block; ">
					<li style="float:right"><a>Welcome #session.firstname#</a></li>
					<li style="float:right"><a href="https://uml.umassonline.net/" target="_blank">Class Blackboard Site</a> </li>
				</ul>
			</div>
		
        <div id="topheader">Class 90-248 Web Site Database Implementation - #trim(session.firstname)# #trim(session.lastname)#'s Table of Contents Page</div></cfoutput>
		<div id="mainarea">
			<div id="leftgutter" class="col-lg-2">
				<ul class="nav nav-stacked">
					<li><a onclick="getarticle('aboutpage.cfm')" target="_blank">What is this page?</a></li>
					<cfoutput query="alldirs">
						<cfif name neq 'includes'>
							<li><a href="#name#" target="_blank">#name#</a></li>
						</cfif>
					</cfoutput>
				<li><hr/></li>
                <!---
					Add your custom links below this line.
					To keep the same formatting as the above items, use this format:
					 <li><a href="link to folder/file">Name of link </a></li>
					
				--->

				</ul>
			</div>
			<div id="center" class="col-lg-9">
            	<cfoutput>
					<cfif content neq ''>
    	            	#content#
        	        </cfif>
				</cfoutput>
            </div>
		</div>
	</div>
</body>
</html>
