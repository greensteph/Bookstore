<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
	<cfset  todayDate=now()>
    <cfoutput>
    	#todayDate#<br>
        <hr>
        
        <cfset totalBookCost=0>
        <ol>
        	<li>Learn To Program - 12.66
        		<cfset totalBookCost=totalBookCost+12.66>
            </li>
            
            <li>Diary of a Wimpy Kid - 7.67
            	<cfset totalBookCost=totalBookCost+7.67>
            </li>
            
            <li>A Dog's Purpose - 8.41
            	<cfset totalBookCost=totalBookCost+8.41>
            </li>
            
            <li>Ruby Wizardry - 17.95
            	<cfset totalBookCost=totalBookCost+17.95>
            </li>
            
            <li>The Girl on the Train - 13.47
            	<cfset totalBookCost=totalBookCost+13.47>
            </li>
            
            <li>Eloquent Javascript - 23.64
            	<cfset totalBookCost=totalBookCost+23.64>
            </li>
            
            <li>HTML & CSS - 17.19
            	<cfset totalBookCost=totalBookCost+17.19>
            </li>
            
            <li>Above the Fold - 22.68
            	<cfset totalBookCost=totalBookCost+22.68>
            </li>
            
            <li>Designing Brand Identity - 22.73
            	<cfset totalBookCost=totalBookCost+22.73>
            </li>
            
            <li>Big Nate: Welcome to my World - 7.52
            	<cfset totalBookCost=totalBookCost+7.52>
            </li>
            <hr>
            Total: #dollarformat(totalBookCost)#
            
                    
    </cfoutput>    


</body>
</html>
