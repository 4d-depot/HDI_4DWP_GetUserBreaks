C_COLLECTION:C1488($_breakRanges)
C_OBJECT:C1216($breakRange)

If (Form:C1466.trace)
	TRACE:C157
End if 


// Find all line breaks
$_breakRanges:=WP Get breaks:C1768(WParea; wk line break:K81:186)

// Replace them by paragraph breaks
For each ($breakRange; $_breakRanges)
	WP INSERT BREAK:C1413($breakRange; wk paragraph break:K81:259; wk replace:K81:177)
End for each 