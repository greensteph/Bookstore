<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
	<cfset myBook=StructNew()>
    <cfset myBook.title="The Girl on the Train">
    <cfset myBook.Author={"FirstName":"Paula","LastName":"Hawkins","Age":"43"}>
    <cfset myBook.Publisher={"Name":"Riverhead Books","City":"New York","State":"New York"}>
    <cfset myBook.ISBN="1594633665">
    <cfset myBook.Price={"Paperback":"$13.47","eBook":"$9.75"}>
    <cfset myBook.Genre="Fiction">
    <cfset myBook.Category="Thriller">
    <cfset myBook.Rating="4/5 Stars">
    <cfset myBook.NumberofPages="336">
    <cfset myBook.YearPublished="2015">


 

	<cfdump var="#myBook#">

</body>
</html>