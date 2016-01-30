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
	// Query to test with
	myQuery = application.udf.sqlExecute("SELECT * FROM appointment");

	// Example One: simple query to table
	//writeOutput(application.udf.helperTable(myQuery));
	
	// Example Two: custom array of columns
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"]));
	
	// Example Three: custom inline table style
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleTable = "width: 500;"));
	
	// Example Three: custom row style
	//writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleTable = "width: 500;", styleRow = "tr-state-offered"));
	
	// Example Four: custom row style logic
	/*myFunction = function(query data, numeric record)
	{
		if(arguments.data.appointmentID[arguments.record] == 1) {return "tr-state-noCriteria";}
		return "tr-state-offered";
	};
	writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], styleLogic = myFunction));*/
	
	// Example Five: custom extra columns
	myFunction = function(query data, numeric record)
	{
		var example = "buttonDelete(" & arguments.data.appointmentID[arguments.record] & ")";
		return "<input type = 'button' value = 'DELETE' onClick = '" & example & "'/>";
	};
	myExtra = [{title:"DELETE", logic:myFunction}];
	writeOutput(application.udf.helperTable(data = myQuery, colsDisplay = ["appointmentID", "boardNum"], colsExtra = myExtra));
</cfscript>
</blockquote>

Notes
-----
* uses some hardcoded styles - change as necessary

About the Author
----------------

You can learn more at my site: <a href = "https://jamieruntime.wordpress.com/2016/01/30/sql-execute-the-one-line-sql-statement-udf/" target = "_blank">JamieRuntime article</a>