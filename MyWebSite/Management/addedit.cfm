
<script>
	function toggleisbn13() {
	var isShowing=document.getElementById('newisbn13area').style.display;
	if(isShowing=="none") {
		document.getElementById('newisbn13area').style.display="block";
	}
	else {
		document.getElementById('newisbn13area').style.display="none";
		 }
	}
</script>

<style>
	.required{background-color:#FC282C}
	input:focus{background-color:#F1DD69}
</style>


<cfparam name="book" default="" />
<cfparam name="qterm" default="" />


<cfoutput>
	#processforms()#
</cfoutput>



<cftry>
	<div id="main" class="col-lg-9 col-lg-push-3">    	
        <cfoutput>
        #editform()#
        </cfoutput>
    </div>
    
    <div id="leftgutter" class="col-lg-3 col-lg-pull-9">    	
         <cfoutput>
         	#sidenav()#
	     </cfoutput>
    </div>
    
    <cfcatch type="any">
    	<cfdump var="#cfcatch#" />
    </cfcatch>
 </cftry>
 
 <cffunction name="sidenav" access="private">   
 	<cfoutput>
    	<form action="#cgi.SCRIPT_NAME#?tool=#tool#" method="post">
          <input id="qterm" type="text" name="qterm" placeholder="Search Books to Edit" value="#qterm#" />
          <button type="submit" class="btn btn-warning btn-xs">Search</button>
          <button type="button" class="btn btn-danger btn-xs" onClick="document.getElementById('qterm').value=''">Clear</button>
        </form>
    </cfoutput>
    
    <cfquery name="allbooks" datasource="#application.dsource#">
        	select * from books
            <cfif qterm neq ''>
            where title like '%#qterm#%'
            </cfif>
            order by title
     </cfquery>
     
     <ul class="nav nav-stacked">
      <cfoutput>
     	<li><a href="#cgi.SCRIPT_NAME#?tool=addedit&book=new&qterm=#qterm#">New Book</a></li>
        <cfloop query="allbooks">
        	<li>
              <a href="#cgi.SCRIPT_NAME#?tool=addedit&book=#isbn13#&qterm=#qterm#">
              #trim(title)#
              </a>
              </li>
            
        </cfloop>
        </cfoutput>
     </ul>
     
        <!-- <cfdump var="#allbooks#" /> -->   
 </cffunction>
 
 <!--EDIT FORM FUNCTION -->
 <cffunction name="editform" access="private">
 	<cfoutput>
    <cfif book neq ''>
     <cfquery name="bookinfo" datasource="#application.dsource#">
     	select * from books where isbn13='#book#'
     </cfquery>
     
     <cfquery name="allpubs" datasource="#application.dsource#">
     	select * from publisher order by name
     </cfquery>

 
     
     <cfif book eq 'new'>
     	<cfset isnbfielddisp="block">
        <cfset editisbnbuttondisp="none">
      <cfelse>
      	<cfset isbnfielddisp="none">
        <cfset editisbnbuttondisp="block">
      </cfif>

     <!--- <cfdump var="#bookinfo#" /> --->
     
     <legend>Editing: <cfif book eq 'new'>New Book<cfelse>#bookinfo.title[1]#</cfif></legend>
     
      <form action="#cgi.SCRIPT_NAME#?tool=addedit" method="post" enctype="multipart/form-data" class="form-horizontal">
       <input type="hidden" name="qterm" value="#qterm#" />
       
       <div class="form-group">
       <label for="ISBN13" class="col-sm-2 control-label">ISBN13:</label>
       	<div class="col-sm-10">
        <div id="oldisbn13area">
        	#bookinfo.isbn13[1]#
        </div>
       		<input type="hidden" name="isbn13" id="isbn13" value="#bookinfo.isbn13[1]#" placeholder="ISBN 13" class="form-control" required />
            <button type="button" class="btn btn-primary btn-xs" onclick-"toggleisbn13()" style="display:#editisbnbuttondisp#">Edit ISBN13</button> 
            
            <div id="newisbn13area" style="display:inline">
            	<input type="text" name="newisbn13" placeholder="Add New ISBN13">
            </div>
       </div>
        </div>
        
       <br>
       
       <div class="form-group">
       <label for="title" class="col-sm-2 control-label">Title:</label>
       	<div class="col-sm-10">
       <input type="text" name="title" id="title" value="#bookinfo.title[1]#" placeholder="Title" class="form-control" required/>
       </div>
        </div>
        
       </br>
       
      <div class="form-group">
       <label for="image" class="col-sm-2 control-label">Image:</label>
        <div class="col-sm-10">
         <input type="file" name="uploadimage" />
         <input type="hidden" name="image" value="#bookinfo.image[1]#" />
         <img src="/sgree41008/includes/classimages/#bookinfo.image[1]#" />
        </div>
       </div>
       
   		<div class="control-label form-group"> 
       <label for="publisher" class="control-label" >Publisher:</label>
       </div>
       <select id="publisher" name="publisher">
       	<option value=""></option>
        <cfloop query="allpubs">
        	<cfset ch="">
            <cfif bookinfo.publisher[1] eq allpubs.id[currentrow]>
            	<cfset ch='selected="selected"'>
            </cfif>
        	<option value="#id#" #ch#>#name#</option>
        </cfloop>
        </select>
        
        <textarea name="description">#bookinfo.description[1]#</textarea>
        <script>CKEDITOR.replace('description');</script> 
        
       <input type="submit" value="Submit" />
     
      </form>
      </cfif>
   
  
     </cfoutput>
 </cffunction>   <!-- END EDIT FORM FUNCTION -->
 
 <cffunction name="processforms" access="private">
 	<cfif isdefined('form.isbn13')>
    <cfoutput>
    <cfif isdefined('form.newisbn13') and form.newisbn13 neq ''>
    	<cfquery name="updateisbn" datasource="#application.dsource#">
    	update books set isbn13='#form.newisbn13#' where isbn13='#form.isbn13#'
        </cfquery>
        <cfset form.isbn13="form.newisnb13">
    </cfif>
    </cfoutput>
    
    
    	<cfif isdefined('form.uploadimage') AND form.uploadimage neq ''>
        <cffile action="upload" destination="#expandpath('/')#sgree41008/includes/classimages/"
        filefield="uploadimage" nameconflict="makeunique" />
        	<cfset form.image='#cffile.serverfile#'>
            </cfif>
    
            
            <cfquery name="putin" datasource="#application.dsource#">
                if not exists (select * from books where isbn13='#form.isbn13#')
                insert into books (isbn13) values ('#form.isbn13#');
        		update books set 
                title='#trim(form.title)#', 
                image='#trim(form.image)#', 
                publisher='#trim(form.publisher)#', 
                description='#form.description#' 
                where 
                isbn13='#form.isbn13#'
	        </cfquery>
    </cfif> 
    <cfset this="56">
    <cfset this='127'>
     
 </cffunction>
