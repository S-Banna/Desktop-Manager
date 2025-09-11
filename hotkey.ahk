; variables and controls

LMS := EnvGet("LMS")
course := ""
url := ""

; simplify win11 desktop control

!3::Send "^#d" 
!2::Send "^#{Right}"
!1::Send "^#{Left}"
!4::Send "^#{F4}"

; runs

Numpad5::{ ; swap course of choice
    global course
    global url
    ; waits for next input
    ih := InputHook("L1")
    ih.Start()
    SoundBeep(500, 50)
    ih.Wait()
    ; second digit identifier, or 3 for b
    switch (ih.Input) {
        case "0": ; 204
            course := "204"
            url := "29005"
        case "1": ; 214
            course := "214"
            url := "28869"
        case "2": ; 221
            course := "221"
            url := "28821"
        case "3": ; 214b
            course := "214b"
            url := "28309"
        case "4": ; 241
            course := "241"
            url := "28408"
        default: 
            course := ""
            url := ""
            SoundBeep(100, 150)
    }
}

Numpad1::{ ; run firefox on current course, or default
    global url
    Run Format("powershell.exe -ExecutionPolicy Bypass -File firefox.ps1 {1}", url)
}

Numpad3::{ ; run explorer on current course, or default
    global course
    Run Format("powershell.exe -ExecutionPolicy Bypass -File explorer.ps1 {1}", course)
}

Numpad7::{ ; run code on current course, or default
    global course
    Run Format("powershell.exe -ExecutionPolicy Bypass -File code.ps1 {1}", course)
} 

Numpad0::Send("!{F4}") ; close