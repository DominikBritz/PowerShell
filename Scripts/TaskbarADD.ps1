<#
    .SYNOPSIS
    Add shortcut to taskbar. Choose language in the script.
#>

$PinVerbTask = @{}

$PinverbTask['De-DE'] ="An Taskleiste anheften"
#$PinverbTask['En-US'] ="Pin to taskbar"

$culture = $Host.CurrentUICulture.Name

$aFilePaths = @("C:\Program Files (x86)\Internet Explorer\iexplore.exe")

Foreach ($FilePath in $aFilePaths)
{

    if(-not (test-path $FilePath)){
    write-warning “`nPath does not exist.`n $FilePath `nExiting… `n";
    return
    }

    $path= split-path $FilePath
    $shell=new-object -com “Shell.Application"
    $folder=$shell.Namespace($path)
    $item = $folder.Parsename((split-path $FilePath -leaf))
    $verbs=$item.Verbs()

    foreach($v in $verbs){
    if($v.Name.Replace(“&","") -match $PinVerbTask[$culture]){
    $v.DoIt()
    }
    }
}