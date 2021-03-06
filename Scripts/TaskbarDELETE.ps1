<#
    .SYNOPSIS
    Remove shortcut from taskbar. Choose language in the script.
#>

$UnPinVerbTask = @{}

$UnPinverbTask['De-DE'] ="Von Taskleiste lösen"
#$UnPinverbTask['En-US'] ="Unpin from taskbar"

$culture = $Host.CurrentUICulture.Name

$aFilePaths = @("C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe","C:\Windows\system32\ServerManager.msc")

Foreach ($FilePath in $aFilePaths)
{

    if(-not (test-path $FilePath))
    {
        write-warning “`nPath does not exist.`n $FilePath `nExiting… `n";
        return
    }

    $path= split-path $FilePath
    $shell=new-object -com “Shell.Application"
    $folder=$shell.Namespace($path)
    $item = $folder.Parsename((split-path $FilePath -leaf))
    $verbs=$item.Verbs()

    foreach($v in $verbs)
    {
        if($v.Name.Replace(“&","") -match $UnPinVerbTask[$culture])
        {
            $v.DoIt()
        }
    }
}

