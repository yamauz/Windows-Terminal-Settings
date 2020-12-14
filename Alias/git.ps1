del alias:gcm -Force
function Git-Add {
    git add $args
}
function Git-Branch {
    git branch $args
}
function Git-Commit {
    git commit -m $args
}
function Git-Checkout {
    git checkout $args 
}
function Git-Log {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
}
function Git-Log-All {
    git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
}
function Git-Status {
    git status $args
}

Set-Alias gad Git-Add
Set-Alias gbr Git-Branch
Set-Alias gcm Git-Commit
Set-Alias gco Git-Checkout
Set-Alias glg Git-Log
Set-Alias glga Git-Log-All
Set-Alias gst Git-Status

