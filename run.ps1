param (
    [string]$url,
    [string]$folderExt,
    [int]$plusFile,
    [int]$plusCode
)

$folder = "C:\Users\user\Desktop\courses\$folderExt"

Start-Process firefox.exe "$url"

if ($plusFile -eq 1) {
    explorer.exe "$folder"
}

if ($plusCode -eq 1) {
    code "$folder" 
}