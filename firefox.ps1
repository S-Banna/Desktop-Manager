param(
    [string]$url
)

if ([string]::IsNullOrWhiteSpace($url)) {
    firefox ""
} else {
    firefox --new-window "https://$Env:LMS/course/view.php?id=$url"
}