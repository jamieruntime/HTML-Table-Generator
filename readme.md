Helper Table
============

Version 1.0.0
Jamie Purchase
30/01/2016

Description
-----------

Generates html to display a table using our styles

<blockquote>
<link rel = "stylesheet" href = "includes/styles/efficienc.css">
<cfscript>
	// Query to test with<br>
	myQuery = application.udf.sqlExecute("SELECT * FROM appointment");<br>
<br>
	// Example One: simple query to table<br>
	//writeOutput(application.udf.helperTable(myQuery));<br>
	<br>
	// Example Two: custom array of columns<br>
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"]));<br>
	<br>
	// Example Three: custom inline table style<br>
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleTable = "width: 500;"));<br>
	<br>
	// Example Three: custom row style<br>
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleTable = "width: 500;", styleRow = "tr-state-offered"));<br>
	<br>
	// Example Four: custom row style logic<br>
	/*myFunction = function(query data, numeric record)<br>
	{<br>
		if(arguments.data.appointmentID[arguments.record] == 1) {return "tr-state-noCriteria";}<br>
		return "tr-state-offered";<br>
	};<br>
	writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleLogic = myFunction));*/<br>
	
	// Example Five: custom extra columns<br>
	myFunction = function(query data, numeric record)<br>
	{<br>
		var example = "buttonDelete(" & arguments.data.appointmentID[arguments.record] & ")";<br>
		return "<input type = 'button' value = 'DELETE' onClick = '" & example & "'/>";<br>
	};<br>
	myExtra = [{title:"DELETE", logic:myFunction}];<br>
	writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], colsExtra = myExtra));<br>
</cfscript>
</blockquote>

Notes
-----
* uses some hardcoded styles - change as necessary

About the Author
----------------

You can learn more at my site: <a href = "https://jamieruntime.wordpress.com/2016/01/30/sql-execute-the-one-line-sql-statement-udf/" target = "_blank">JamieRuntime article</a>