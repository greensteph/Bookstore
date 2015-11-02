
<cfparam name="newaccountmessage" default="" />
<cfparam name="loginmessage" default="" />

<script>
	function validateNewAccount() {
		var origpw=document.getElementById('password').value;
		var confirmpw=document.getElementById('confirmpassword').value;
		console.log('the origpw value is ' + origpw);
		console.log('the confirmpw value is ' + confirmpw);
		if(origpw==confirmpw && origpw!=''){
			document.getElementById('newaccountmessage').innerHTML='';
			document.getElementById('newaccountsubmitbutton').click();
			alert('It Passed')
		}
		else{
			document.getElementById('newaccountmessage').innerHTML="Your Passwords DO NOT match or Password field is empty";
		}
	}
</script>

<cfset processforms()>



<div class="col-lg-6">
	<cfoutput>
    	<div class="panel panel-default">
        		<div class="panel-heading">
                New Account
                </div>
        </div>
        
        <div id="newaccountmessage">&nbsp; #newaccountmessage# </div>
        
    	<form id="newaccountform" action="#cgi.SCRIPT_NAME#?p=login" class="form-horizontal" method="post">
        <input type="hidden" name="newpersonid" />
        	<div class="form-group">
            	<label class="control-label col-lg-4">First Name</label>
                <div class="col-lg-8">
                	<input type="text" name="firstname" class="form-control" placeholder="First Name">
                </div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-lg-4">Last Name</label>
                <div class="col-lg-8">
                	<input type="text" name="lastname" class="form-control" placeholder="Last Name">
                </div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-lg-4">Email</label>
                <div class="col-lg-8">
                	<input type="text" name="email" class="form-control" placeholder="Email" required>
                </div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                	<input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </div>
            </div>
            
           <div class="form-group">
            	<label class="control-label col-lg-4">Confirm Password</label>
                <div class="col-lg-8">
                	<input type="password" id="confirmpassword" name="password" class="form-control" placeholder="Confirm Password">
                </div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-lg-4">&nbsp;</label>
                <div class="col-lg-8">
                	<button type="button" class="btn btn-primary" onclick="validateNewAccount()">Make Account</button>
                    <input type="submit" id="newaccountsubmitbutton" value="Make A">
                </div>
            </div>
         </form> 
    </cfoutput>
</div>



<cffunction name="processforms">
	<cfif isdefined('form.newpersonid')>
    <cfquery name="isin" datasource="#application.dsource#">
    select * from people where email='#form.email#'
    </cfquery>
    <cfif isin.recordcount eq 0>
    	<cfset newaccountnum=createuuid()>
        
        <cfquery name="putin" datasource="#application.dsource#">
        	insert into people
            (personid,firstname,lastname,email)
            values
            ('#newaccountnum#','#form.firstname#','#form.lastname#','#form.email#');
        </cfquery>

        <cfquery name="putInPass" datasource="#application.dsource#">
        	insert into passwords
            (personid,password)
            values
            ('#newaccountnum#','#hash(form.password, "SHA-256")#')
        </cfquery>
     <cfelse>
     	<cfset newaccountmessage="Account created. Please log in.">
	<cfdump var="#form#">
   </cfif>  
   </cfif>
   
</cffunction>

<div class="col-lg-6">
	<cfoutput>#loginform()#</cfoutput>
</div>

<cffunction name="loginform">
	<cfoutput>
    <div class="panel panel-default">
    	<div class="panel panel-heading">
        Login
        </div>
        <div class="panel-body">
        	<div id="loginmessage">#loginmessage#</div>
            	<form action="#cgi.SCRIPT_NAME#?p=login" method="post" class="form-horizontal">
                <div class="form-group">
                <label class="control-label col-lg-4">Email</label>
                <div class="col-lg-8">
                	<input type="text" name="loginemail" class="form-control" />
                </div>
                </div>
                
           <div class="form-group">
           <label class="contol-label col-lg-4">Password</label>
           <div class="col-lg-8">
           		<input type="password" name="loginpass" class="form-control" />
           </div>
       </div>
       
       <div class="form-group">
       <label class="contol-label col-lg-4">&nbsp;</label>
       <div class="col-lg-8">
       		<input type="submit" class="btn btn-primary" />
       </div>
       </div>
      </form>
      
      <div style="text-align:center">
      	<a href="#cgi.SCRIPT_NAME#?p=forgotpassword">Forgot Password</a>
      </div>
   </cfoutput>
</cffunction>
