function Run-AsAdmin {
    sudo choco install $args
}

Set-Alias cinst Run-AsAdmin