param (
    [string]$url,
    [string]$folderExt,
    [int]$plusFile,
    [int]$plusCode
)

$folder = "C:\Users\user\Desktop\courses\$folderExt"

firefox --new-window "$url" 

if ($plusFile -eq 1) {
    Start-Process explorer.exe "$folder" -WindowStyle Maximized 
}

if ($plusCode -eq 1) {
    $vscodeProcess = Get-Process "Code" -ErrorAction SilentlyContinue
    
    if ($vscodeProcess) {
        code "$folder"
    } else {
        Start-Process "code" "`"$folder`"" -WindowStyle Hidden
    }
}

exit