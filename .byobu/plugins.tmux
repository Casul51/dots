set-option -g @tpm_plugins '  \
  tmux-plugins/tpm            \
  tmux-plugins/tmux-resurrect \
  tmux-plugins/tmux-continuum \
  '

set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.byobu/plugins/"


# Tmux-resurrect plugin
set -g @resurrect-dir '/home/casual/.byobu/session'
# set -g @resurrect-save-bash-history 'on'
# set -g @resurrect-processes 'false'
# set -g @resurrect-processes ':all:'
set -g @resurrect-processes 'nano,vim,micro,ssh,mosh,btop,nvtop'
set -g @overwrite-option '@resurrect-overwrite'
set -g @overwrite_option '@resurrect-overwrite'

#run-shell '~/.byobu/plugins/tpm/tpm'
run '~/.byobu/plugins/tpm/tpm'
