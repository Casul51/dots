unbind-key -n C-a
unbind-key -n C-s



unbind-key -n C-Left
unbind-key -n ^Left
unbind-key -n C-Right
unbind-key -n C-Down
unbind-key -n C-Up

#unbind-key -n S-UP
#unbind-key -n S-DOWN
#unbind-key -n S-LEFT
#unbind-key -n S-RIGHT



#bind -n S-Right next-window
#bind -n S-Left previous-window

#bind h split-window -v
bind i source-file ~/.byobu/.tmux.conf
bind i source-file ~/.byobu/keybindings.tmux
unbind-key -n C-t
unbind-key -n C-e
set -g prefix ^E
set -g prefix2 F12
bind e send-prefix
