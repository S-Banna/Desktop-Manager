; variables and controls

plusFile := false
Numpad1::{
    global plusFile
    plusFile := !plusFile
    if (plusFile) {
        SoundBeep(600, 150)
    } else SoundBeep(200, 150)
}

plusCode := false
Numpad3::{
    global plusCode
    plusCode := !plusCode
    if (plusCode) {
        SoundBeep(600, 150)
    } else SoundBeep(200, 150)
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
    SoundBeep(500, 150)
    ih.Wait()
    ; second digit identifier, or b
    switch (ih.Input) {
        case "0": ; 204
            Run Format("lms.sh https://lms.aub.edu.lb/course/view.php?id=29005 204 {1} {2}", plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "1": ; 214
            Run Format("lms.sh https://lms.aub.edu.lb/course/view.php?id=28869 214 {1} {2}", plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "2": ; 221
            Run Format("lms.sh https://lms.aub.edu.lb/course/view.php?id=28821 221 {1} {2}", plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "4": ; 241
            Run Format("lms.sh https://lms.aub.edu.lb/course/view.php?id=28408 241 {1} {2}", plusFile ? 1 : 0, plusCode ? 1 : 0)
        case "b": ; 214b
            Run Format("lms.sh https://lms.aub.edu.lb/course/view.php?id=28309 214b {1} {2}", plusFile ? 1 : 0, plusCode ? 1 : 0)
        default: 
            Run "lms.sh about:home"
    }
}