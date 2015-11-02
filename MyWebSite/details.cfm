Details



<cfparam name="searchme" default="" />

<cfif searchme eq ''>
	Please enter a search phrase
<cfelse>
	<cfquery name="bookinfo" datasource="#application.dsource#">
    	select * from books where title like '%#searchme#%' or isbn13='%#searchme#%'
    </cfquery>
  
    
    <cfoutput>
    <cfif bookinfo.recordcount eq 0>
    	#noresults()#
    <cfelseif bookinfo.recordcount eq 1>
    	#showBookDetails()#
    <cfelseif bookinfo.recordcount gt 1>
    	#showHitList()#
    </cfif>
    </cfoutput>
    
 </cfif>
 
 <cffunction name="noresults">
 	<div>Please Try Again</div>
 </cffunction>
    
 <cffunction name="showHitList">
 	<ul>
    	<cfoutput query="bookinfo">
        	<li><a href="#cgi.SCRIPT_NAME#?p=details&searchme=#trim(isbn13)#">#trim(title)#</a></li>
        </cfoutput>
    </ul>
 </cffunction>
 
 <cffunction name="showBookDetails">
 	<cfoutput>
    	<div>
        	<img src="/sgree41008/includes/classimages/#bookinfo.image[1]#" style="float:left; margin:3px">
            #bookinfo.title[1]#<br/>
            #bookinfo.year[1]#<br/>
            #bookinfo.description[1]#<br/>
		</div>
 </cfoutput>
 </cffunction>
 