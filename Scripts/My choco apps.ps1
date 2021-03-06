# install
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# disable confirmations
choco feature enable -n allowGlobalConfirmation

$apps = @('vscode','firefox','7zip','notepadplusplus','adobereader','vlc','putty')

Foreach ($app in $apps)
{
  choco install $app
}
