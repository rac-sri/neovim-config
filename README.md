

and then:

`
cd .config/yazi/keymap.toml
`

and paste the below:

`[[manager.prepend_keymap]]
on = "h"
run = "leave"

[[manager.prepend_keymap]]
on = "l"
run = "enter"

[[manager.prepend_keymap]]
on = "/"
run = "find"
desc = "Find file"
`
