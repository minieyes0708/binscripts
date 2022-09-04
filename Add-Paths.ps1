$SEP = ''
$PWD = (pwd).Path
if ($env:PATHS) { $SEP = ';' }
$env:PATHS = "$PATHS$SEP$PWD"
