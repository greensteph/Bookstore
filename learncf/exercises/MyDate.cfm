<!doctype HTML>
<html>

<head>
<meta charset="utf‐8" /> 
<title>Untitled Document</title>
</head>

<body>
<cfoutput>
	#now()#<br>
	#dateformat(now(),"short")#<br>
	#dateformat(now(),"medium")#<br>
	#dateformat(now(),"long")#<br>
	#dateformat(now(),"mm/dd/yyyy")#<br>
	#dateformat(now(),"full")#<br>
	#dateformat(now(),"d-mmm-yyyy")#<br>
	#dateformat(now(),"mm/dd/yy hh:nn:ss")#<br>
	#dateformat(now(),"dddd")#<br>
	#dateformat(now(),"ddd mm yyyy")#<br>
	#dateformat(now(),"gg")#<br>
	#dateformat(now(),"mmm-dd-yyyy")#<br>
	#timeformat(now(),"HH:MM:SS")#<br>
	#timeformat(now(),"hh:mm:ss TT")#<br>

</cfoutput>
</body>

</html>