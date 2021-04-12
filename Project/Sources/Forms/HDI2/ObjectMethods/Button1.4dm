
var $path : Text

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"sample.4wp"
WP EXPORT DOCUMENT:C1337(WPArea; $path; wk 4wp:K81:4)
