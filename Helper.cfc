component name = "Helper" output = "false"
{

	/**
	* @hint creates the html to render a table using company styles
	* @data the query of data to render
	* @colsDisplay an array of column data to display from the query {title and column}
	* @colsExtra an array of extra columns to add {title and logic}
	* @styleTable the inline style to apply to the table
	* @styleRow the default style of each row
	* @styleLogic the logic to apply to each row that returns a style
	*/
	public string function helperTable(required query data, array colsDisplay, array colsExtra, string styleTable, string styleRow = "tr-state-cancelled", function styleLogic)
	{
		// Columns
		if(isDefined('arguments.colsDisplay')) {var columns = arguments.colsDisplay;}
		else
		{
			var colNames = listToArray(arguments.data.columnList);
			var columns = [];
			for(var col = 1; col <= arrayLen(colNames); col++) {columns[col] = {title:colNames[col], column:colNames[col]};}
		}

		// Table header
		if(isDefined('arguments.styleTable')) {var html = "<table style = '" & arguments.styleTable & "'>";}
		else {var html = "<table>";}
		html &= "<tr class = 'tr-state-header'>";
		
		// Query columns
		for(var c = 1; c <= arrayLen(columns); c++) {html &= "<td>" & columns[c].title & "</td>";}
		
		// Extra columns
		if(isDefined('arguments.colsExtra'))
		{
			try {for(var e = 1; e <= arrayLen(arguments.colsExtra); e++) {html &= "<td>" & arguments.colsExtra[e].title & "</td>";}}
			catch(any ex) {throw(message = "No title was supplied for the extra column at position " & e, type = "Extra column invalid");}
		}
		
		// Table header end
		html &= "</tr>";
		
		// Table rows
		for(var r = 1; r <= arguments.data.recordCount; r++)
		{
			// Row style
			var rowStyle = arguments.styleRow;
			if(isDefined('arguments.styleLogic')) {rowStyle = styleLogic(arguments.data, r);}
			
			// Row data
			html &= "<tr class = " & rowStyle & ">";
			for(var c = 1; c <= arrayLen(columns); c++)
			{
				html &= "<td>" & evaluate("arguments.data." & columns[c].column & "[r]") & "</td>";
			}
			
			// Row extra
			if(isDefined('arguments.colsExtra'))
			{
				for(var e = 1; e <= arrayLen(arguments.colsExtra); e++)
				{
					if(!structKeyExists(arguments.colsExtra[e], "logic")) {throw(message = "No logic was supplied for the extra column at position " & e, type = "Extra column invalid");}
					try {html &= "<td>" & arguments.colsExtra[e].logic(arguments.data, r) & "</td>";}
					catch(any ex) {throw(message = "Logic was incorrect for the extra column at position " & e & ": " & ex.message, type = "Extra column invalid");}
				}
			}
		}

		// Table end
		html &= "</table>";
		return html;
	}

}