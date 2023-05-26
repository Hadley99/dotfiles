alias c='clear'

# rc
alias src='source ~/.zshrc'
alias erc='code $DOTFILES/zsh/rc.zsh'

# open
alias vs='code .'
alias ow='cd ~web && vs'
alias oc='cd ~callable && vs'
alias of='cd ~functions && vs'
alias oim='cd ~import-manager && vs'

# start
alias sc='cd ~callable && nvm use 16 && npm run start:watch'

alias s='npm run start'
alias sw='npm run winstart'

# funcitons

function take {
    mkdir -p $1
    cd $1
}
