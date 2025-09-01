param (
    [string]$ext
)

if ($ext -eq "") {
    $folder = ""
} else {
    $folder = "C:\Users\user\Desktop\courses\$ext"
}
$vscodeProcess = Get-Process "Code" -ErrorAction SilentlyContinue
    
if ($vscodeProcess) {
    code "$folder"
} else {
    Start-Process "code" "$folder" -WindowStyle Hidden
}