
<!--Logoff-->
<cfif isdefined('url.p') and url.p eq 'loggoff'>
	<cfset structclear(session)>
    <cfset session.isLoggedIn=false>
    <cfset p="carousel">
</cfif>

<!--Login-->
<cfif isdefined('form.loginemail')>
	<cfquery name="getpers" datasource="#application.dsource#">
    	select * from people
        inner join passwords on passwords.personid=people.id
        where email='#form.loginemail#' and password='#hash(form.loginpass, "SHA-256")#'
    </cfquery>
    
	<cfif getpers.recordcount eq 0>
		<cfset loginmessage="Your Account was not Found">
     <cfelse>
     	<cfset session.isLoggedIn=true>
		<cfset session.user.firstname=getpers.firstname[1]>
        <cfset session.user.lastname=getpers.lastname[1]>
        <cfset session.user.acctnumber=getpers.id[1]>
        <cfset session.user.email=getpers.email[1]>
        <cfset session.user.isAdmin=getpers.isadmin[1]>
     </cfif>

</cfif> 


<!--If No Session-->
<cfif not isdefined('session.isLoggedIn')>
	<cfset session.isLoggedIn=false>
    <cfset session.user={}>
    <cfset session.user.firstname=''>
    <cfset session.user.lastname=''>
    <cfset session.user.acctnumber=''>
    <cfset session.user.email=''>
</cfif>