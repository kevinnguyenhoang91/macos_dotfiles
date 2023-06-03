ZSH_THEME="jonathan"

plugins=(git docker-compose zsh-autosuggestions zsh-syntax-highlighting)

export GEM_HOME="${HOME}/.gem"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/ruby@3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:${GEM_HOME}/bin:${PATH}"
export PATH="${HOME}/.cargo/bin:$PATH"
export PATH="${PATH}:${HOME}/.rvm/bin"
export ZSH=~/.oh-my-zsh
export EDITOR="$(which code) -w"
export TERM='xterm-256color'
export NVM_DIR="${HOME}/.nvm"
export RIPGREP_CONFIG_PATH="${HOME}/.rgrc"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH="${HOME}/go"
export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"
export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"
export PATH="${JAVA_HOME}/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/opt/homebrew/opt/rust/bin:${PATH}"

[[ -s "${ZSH}/oh-my-zsh.sh" ]] && . "${ZSH}/oh-my-zsh.sh"
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && . "${HOME}/.rvm/scripts/rvm"
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.secrets ]] && source ~/.secrets
[[ -f ~/.zsh/z.lua/z.lua ]] && eval "$(lua ~/.zsh/z.lua/z.lua --init zsh enhanced once)"
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ] && source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# aliases
alias vim='lvim'
alias nvim='lvim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'

# tmux {{{
connect_to_most_recent_tmux_session() {
  if _not_in_tmux; then
    if _any_tmux_sessions; then
      tmux attach -t "$(_most_recent_tmux_session)"
    else
      tmux
    fi
  fi
}

# Returns the name of the most recent tmux session, sorted by time the session
# was last attached.
_most_recent_tmux_session() {
  tmux list-sessions -F "#{session_last_attached} #{session_name}" |
    sort -r |
    cut -d' ' -f2 |
    head -1
}

_not_in_tmux() {
  [[ -z "${TMUX}" ]]
}

_any_tmux_sessions() {
  [[ -n "$(tmux ls 2>/dev/null)" ]]
}

inside_ssh() {
  [[ -n "${SSH_CLIENT}" ]] || [[ -n "${SSH_TTY}" ]]
}

inside_vscode() {
  [[ -n "${TERM_PROGRAM}" ]] && [[ "${TERM_PROGRAM}" == *"vscode"* ]]
}

inside_iterm() {
  [[ -n "${TERM_PROGRAM}" ]] && [[ "${TERM_PROGRAM}" == *"iTerm.app"* ]]
}

if ! inside_ssh && ! inside_vscode && ! inside_iterm; then
  connect_to_most_recent_tmux_session
fi
# }}}

[[ -s "$NVM_DIR/bash_completion" ]] && \. "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [[ $? -eq 0 ]]; then
  eval "$__conda_setup"
else
  if [ -f "${HOME}/opt/anaconda3/etc/profile.d/conda.sh" ]; then
    . "${HOME}/opt/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="${HOME}/opt/anaconda3/bin:${PATH}"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# thefuck
eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [[ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [[ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export GPG_TTY=$(tty)
