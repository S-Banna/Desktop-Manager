param(
    [string]$ext
)

if ($ext -eq "") {
    Start-Process explorer.exe -WindowStyle Maximized 
} else {
    Start-Process explorer.exe "C:\Users\user\Desktop\courses\$ext" -WindowStyle Maximized 
}