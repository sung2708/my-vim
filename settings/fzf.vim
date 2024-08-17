let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let $FZF_DEFAULT_OPTS = '--preview "bat --style=numbers --color=always {}"'
