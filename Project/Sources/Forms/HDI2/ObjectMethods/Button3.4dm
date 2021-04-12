var $path : Text

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"sample.4wp"
WPArea:=WP Import document:C1318($path)

//WParea:=Form.e.wp
Form:C1466.breaks:=New collection:C1472()


