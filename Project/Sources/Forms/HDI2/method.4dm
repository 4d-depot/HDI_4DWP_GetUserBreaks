var $path : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		WParea:=WP New:C1317
		
		ARRAY TEXT:C222(_BreakNames; 0)
		ARRAY TEXT:C222(_RemoveBreaks; 0)
		ARRAY TEXT:C222(_ReplaceBreaks; 0)
		ARRAY LONGINT:C221(_BreakTypes; 0)
		
		APPEND TO ARRAY:C911(_BreakNames; "Line break")
		APPEND TO ARRAY:C911(_BreakNames; "Paragraph break")
		APPEND TO ARRAY:C911(_BreakNames; "Column break")
		APPEND TO ARRAY:C911(_BreakNames; "Page break")
		APPEND TO ARRAY:C911(_BreakNames; "Section break")
		
		APPEND TO ARRAY:C911(_BreakTypes; wk line break:K81:186)
		APPEND TO ARRAY:C911(_BreakTypes; wk paragraph break:K81:259)
		APPEND TO ARRAY:C911(_BreakTypes; wk column break:K81:254)
		APPEND TO ARRAY:C911(_BreakTypes; wk page break:K81:188)
		APPEND TO ARRAY:C911(_BreakTypes; wk section break:K81:187)
		
		
		COPY ARRAY:C226(_BreakNames; _RemoveBreaks)
		COPY ARRAY:C226(_BreakNames; _ReplaceBreaks)
		APPEND TO ARRAY:C911(_ReplaceBreaks; "space")  // last item, no matching type
		
		
		APPEND TO ARRAY:C911(_BreakNames; "All breaks")
		APPEND TO ARRAY:C911(_BreakTypes; -1)
		
		_BreakNames:=6  // All breaks 
		
		
		
		
		ARRAY TEXT:C222(_RemoveDoubles; 0)
		COPY ARRAY:C226(_RemoveBreaks; _RemoveDoubles)
		_RemoveBreaks:=1
		_RemoveDoubles:=1
		_ReplaceBreaks:=2
		
		
		Form:C1466.remove:=1
		Form:C1466.replace:=0
		
		OBJECT SET TITLE:C194(*; "btnAction"; "Remove")
		OBJECT SET ENABLED:C1123(*; "PopupReplaceLabels"; False:C215)
		
		
		// load sample
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"sample.4wp"
		WPArea:=WP Import document:C1318($path)
		Form:C1466.breaks:=New collection:C1472()
		
		Form:C1466.trace:=False:C215
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (OBJECT Get visible:C1075(*; "MessageText")=False:C215)
			
			OBJECT SET VISIBLE:C603(*; "MessageText"; True:C214)
			OBJECT SET VISIBLE:C603(*; "MessageFrame"; True:C214)
			SET TIMER:C645(4*60)
			
		Else 
			
			OBJECT SET VISIBLE:C603(*; "MessageText"; False:C215)
			OBJECT SET VISIBLE:C603(*; "MessageFrame"; False:C215)
			
		End if 
		
End case 

