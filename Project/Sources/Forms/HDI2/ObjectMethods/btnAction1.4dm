var $i; $n; $loopCount; $globalCount : Integer
var $sort : Collection
var $_filteredBreaks : Collection
var $currentBreak; $previousBreak : Object
var $plural; $string : Text


$loopCount:=0
$_filteredBreaks:=WP Get breaks:C1768(WParea; _BreakTypes{_RemoveDoubles}).orderBy("start asc")

$n:=$_filteredBreaks.length-1
While ($n>0)
	
	$currentBreak:=$_filteredBreaks[$n]
	$previousBreak:=$_filteredBreaks[$n-1]
	
	If ($currentBreak.start=($previousBreak.start+1))
		WP SET TEXT:C1574($currentBreak; ""; wk replace:K81:177)
		$loopCount:=$loopCount+1
	End if 
	
	$n:=$n-1
	
End while 

Form:C1466.breaks:=WP Get breaks:C1768(WParea)  // Update list !

$plural:="s"*Num:C11($loopCount>1)
Form:C1466.message:=String:C10($loopCount)+" "+_RemoveDoubles{_RemoveDoubles}+$plural+" have been removed."

SET TIMER:C645(-1)