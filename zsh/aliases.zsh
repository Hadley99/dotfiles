alias c='clear'
alias tmux='tmux -u'

# rc
alias src='source ~/.zshrc'
alias erc='code $DOTFILES/zsh/rc.zsh'
alias tsrc='tmux source-file ~/.tmux.conf'
alias tedit='code ~/.tmux.conf'

# open
alias vs='code .'
alias ow='cd ~web && vs'
alias oa='cd ~admin && vs'
alias opr='cd ~web-playwright && vs'
alias oc='cd ~callable && vs'
alias of='cd ~functions && vs'
alias oim='cd ~import-manager && vs'

alias df='cd ~/dotfiles && vs'

# start
alias s='npm run start'

# start custom
alias sc='cd ~callable && nvm use 16 && npm run start:watch'
alias sw='cd ~web && npm run winstart'

# funcitons

function to-phone {
    scp $1 phone:~/storage/from-pc
}

function take {
    mkdir -p $1
    cd $1
}
