
C_LONGINT:C283($type)
C_COLLECTION:C1488($_breaks)


If (Form:C1466.trace)
	TRACE:C157
End if 

$type:=_BreakTypes{_BreakNames}
If ($type=-1)
	Form:C1466.breaks:=WP Get breaks:C1768(WParea)
Else 
	Form:C1466.breaks:=WP Get breaks:C1768(WParea; $type)
End if 
