alias c='clear'
alias tmux='tmux -u'

# rc
alias src='source ~/.zshrc'
alias erc='code $DOTFILES/zsh/rc.zsh'
alias tsrc='tmux source-file ~/.tmux.conf'

# open
# alias vs='code .'
alias vs='code-insiders .'
alias ow='cd ~web && vs'
alias oa='cd ~admin && vs'
alias opr='cd ~web-playwright && vs'
alias oc='cd ~callable && vs'
alias of='cd ~functions && vs'
alias oim='cd ~import-manager && vs'

alias tedit='code ~/.tmux.conf'

alias df='cd ~/dotfiles && vs'

# start
alias s='npm run start'

# start custom
alias sc='cd ~callable && nvm use 16 && npm run start:watch'
alias sw='cd ~web && nvm use 14 && npm run winstart'
alias sa='cd ~admin && nvm use 14 && s'

# funcitons

function to-phone {
    scp $1 phone:~/storage/from-pc
}

function take {
    mkdir -p $1
    cd $1
}
