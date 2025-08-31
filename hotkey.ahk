; variables and controls

LMS := EnvGet("LMS")

plusFile := false
Numpad1::{
    global plusFile
    plusFile := !plusFile
    if (plusFile) {
        SoundBeep(600, 50)
    } else SoundBeep(200, 50)
}

plusCode := false
Numpad3::{
    global plusCode
    plusCode := !plusCode
    if (plusCode) {
        SoundBeep(600, 50)
    } else SoundBeep(200, 50)
}

; simplify win11 desktop control

Numpad8::Send "^#d"

Numpad6::Send "^#{Right}"

Numpad4::Send "^#{Left}"

Numpad2::Send "^#{F4}"

; common setups

Numpad5::{ ; work keys
    ; waits for next input
    ih := InputHook("L1")
    ih.Start()
    SoundBeep(500, 50)
    ih.Wait()
    ; second digit identifier, or b
    switch (ih.Input) {
        case "0": ; 204
            Run Format("powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"https://{1}/course/view.php?id=29005`" `"204`" {2} {3}", LMS, plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "1": ; 214
            Run Format("powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"https://{1}/course/view.php?id=28869`" `"214`" {2} {3}", LMS, plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "2": ; 221
            Run Format("powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"https://{1}/course/view.php?id=28821`" `"221`" {2} {3}", LMS, plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "4": ; 241
            Run Format("powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"https://{1}/course/view.php?id=28408`" `"241`" {2} {3}", LMS, plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "b": ; 214b
            Run Format("powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"https://{1}/course/view.php?id=28309`" `"214b`" {2} {3}", LMS, plusFile ? 1 : 0, plusCode ? 1 : 0)
        default: 
            Run "powershell.exe -ExecutionPolicy Bypass -File run.ps1 `"about:home`""
    }
}