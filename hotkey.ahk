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
    SoundBeep(523, 150)
    ih.Wait()
    ; second digit identifier, or b
    switch (ih.Input) {
        case "0": ; 204
            Run "lms.sh https://lms.aub.edu.lb/course/view.php?id=29005"
        case "1": ; 214
            Run "lms.sh https://lms.aub.edu.lb/course/view.php?id=28869"
        case "2": ; 221
            Run "lms.sh https://lms.aub.edu.lb/course/view.php?id=28821"
        case "4": ; 241
            Run "lms.sh https://lms.aub.edu.lb/course/view.php?id=28408"
        case "b": ; 214b
            Run "lms.sh https://lms.aub.edu.lb/course/view.php?id=28309"
        default: 
            Run "lms.sh about:home"
    }
}