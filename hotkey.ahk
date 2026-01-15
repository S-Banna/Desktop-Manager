; variables and controls

LMS := EnvGet("LMS")
course := ""
url := ""

; simplify win11 desktop control

!1::Send "^#{Left}"
!2::Send "^#{Right}"
Numpad8::Send "^#d" 
Numpad2::Send "^#{F4}"

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
        case "0": ; 240
            course := "240c"
            url := "31947"
        case "1": ; 271
            course := "271c"
            url := "31778"
        case "2": ; 242
            course := "242c"
            url := "31427"
        case "3": ; 203
            course := "203e"
            url := "30467"
        case "4": ; 201
            course := "201s"
            url := "31091"
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