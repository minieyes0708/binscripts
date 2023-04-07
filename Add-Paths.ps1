if ($global:PATHS) {
    $global:PATHS += (pwd).Path
} else {
    $global:PATHS = @((pwd).Path)
}