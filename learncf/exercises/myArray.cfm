<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
	<cfset myArray=ArrayNew(1)>
    <cfset myArray[1]="Above the Fold">
    <cfset myArray[2]="Diary of a Wimpy Kid">
    <cfset myArray[3]="Ruby Wizardry">
    <cfset myArray[4]=StructNew()>


	<cfdump var="#myArray#" />

</body>
</html>