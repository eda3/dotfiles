# PowerShellから `notepad $profile` `code $profile` でプロファイルをいじれる
function touch {
    New-Item -type file $args
}

function gs {
    git status $args
}
function gl {
    git log --oneline --decorate --graph --branches --tags --remotes --name-status -5

}
function gf {
    git diff $args
}
function gfs {
    git diff --staged
}

function gaa {
    git add -A
}
function gcom {
    git commit -m $args
}

function ll {
   Get-ChildItem $args
}


function open {
    Invoke-Item $args
}
