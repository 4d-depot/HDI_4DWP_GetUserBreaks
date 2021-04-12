var $sort : Collection
var $_filteredBreaks : Collection
var $break : Object
var $count : Integer
var $replace; $canReplace : Boolean
var $plural; $string : Text


If (Form:C1466.trace)
	TRACE:C157
End if 

$_filteredBreaks:=WP Get breaks:C1768(WParea; _BreakTypes{_RemoveBreaks}).orderBy("start asc")
If (Form:C1466.remove=1)
	$_filteredBreaks:=$_filteredBreaks.reverse()
End if 

// ACTION : remove or replace each item in the collection

// when the breaks are inside a header or footer, they can not be replaced by any kind of break…
$replace:=False:C215
Case of 
	: (_BreakTypes{_ReplaceBreaks}=wk column break:K81:254)
	: (_BreakTypes{_ReplaceBreaks}=wk page break:K81:188)
	: (_BreakTypes{_ReplaceBreaks}=wk section break:K81:187)
	Else 
		$replace:=True:C214
End case 

$count:=0

For each ($break; $_filteredBreaks)
	
	Case of 
		: (Form:C1466.remove=1)
			WP SET TEXT:C1574($break; ""; wk replace:K81:177)  // remove : done !
			$count:=$count+1
			
		: (_ReplaceBreaks=Size of array:C274(_ReplaceBreaks))
			WP SET TEXT:C1574($break; " "; wk replace:K81:177)  // replace by space : done !
			$count:=$count+1
			
		Else 
			
			If (Not:C34(Undefined:C82($break.container)))  // inside a header or footer
				$canReplace:=$replace  // based on type or replacement
			Else   //outside 
				$canReplace:=True:C214  // replace always OK
			End if 
			
			If ($canReplace)
				//WP SET TEXT($break; ""; wk replace)  // special case for libe breaks
				WP INSERT BREAK:C1413($break; _BreakTypes{_ReplaceBreaks}; wk replace:K81:177)
				$count:=$count+1
			End if 
			
	End case 
	
End for each 

Form:C1466.breaks:=WP Get breaks:C1768(WParea)  // Update list !
WP SELECT:C1348(*; "WParea"; wk start text:K81:165; wk start text:K81:165)

$plural:="s"*Num:C11($count>1)

Case of 
	: (Form:C1466.remove=1)
		
		Form:C1466.message:=String:C10($count)+" "+_RemoveBreaks{_RemoveBreaks}+$plural+" have been removed."
		
	: (_ReplaceBreaks=Size of array:C274(_ReplaceBreaks))
		Form:C1466.message:=String:C10($count)+" "+_RemoveBreaks{_RemoveBreaks}+$plural+" have been replaced by a space."
		
	Else 
		Form:C1466.message:="<1> have been replaced by <2>"
		Form:C1466.message:=String:C10($count)+" "+_RemoveBreaks{_RemoveBreaks}+$plural+" have been replaced by "+_ReplaceBreaks{_ReplaceBreaks}+$plural+"."
		
End case 

SET TIMER:C645(-1)





