Invoke-Expression (&starship init powershell)
winfetch

Remove-Alias cat
Remove-Alias ls

function cat {
    bat $args
}

function ccat {
    bat --style plain $args
}

function l {
    eza --icons --long --header --all $args
}

function ls {
    eza --icons --long --header $args
}

function tree {
    eza --icons --tree --level=2 $args
}

function which($name) {
        Get-Command $name | Select-Object -ExpandProperty Definition
}

function .. {
    Set-Location -Path ".."
}