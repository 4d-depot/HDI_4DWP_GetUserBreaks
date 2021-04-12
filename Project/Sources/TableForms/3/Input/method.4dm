C_BOOLEAN:C305($result)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		WP GET ATTRIBUTES:C1345([SAMPLES:3]wp:2;"breakParagraphsInFormulas";$result)
		
		If ($result)
			btnUseParagraphBreaks:=True:C214
			btnUseLineBreaks:=False:C215
		Else 
			btnUseParagraphBreaks:=False:C215
			btnUseLineBreaks:=True:C214
		End if 
		
End case 