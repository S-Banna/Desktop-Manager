; variables and controls

LMS := EnvGet("LMS")
course := ""
url := ""

; simplify win11 desktop control

Numpad8::Send "^#d" 
Numpad6::Send "^#{Right}"
Numpad4::Send "^#{Left}"
Numpad2::Send "^#{F4}"

; runs

Numpad5::{ ; swap course of choice
    global course, url
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
    if (course == url == "") {
        Run("firefox")
    } else Run Format("firefox https://{1}/course/view.php?id={2}", LMS, url)
}

Numpad3::{ ; run explorer on current course, or default
    if (course == url == "") {
        Run("explorer")
    } else Run Format("explorer C:\Users\user\Desktop\courses\{1}", course)
}

Numpad7::{ ; run code on current course, or default
    if (course == url == "") {
        Run("code")
    } else Run Format("cmd.exe /c code C:\Users\user\Desktop\courses\{1}", course)
}