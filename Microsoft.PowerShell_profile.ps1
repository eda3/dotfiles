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


# プロンプトを変更する
function prompt () {
    $prompt = if (-not(([Security.Principal.WindowsPrincipal] `
                    [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
                    [Security.Principal.WindowsBuiltInRole] "Administrator"`
            ))) {
        " > "
    }else{
        " # " 
    }
    "[$($env:USERNAME)@$($env:COMPUTERNAME) " + (Split-Path (Get-Location) -Leaf) + "]${prompt}" 
}
