$root = "$HOME\Documents\steamcmd"

# プロセスが停止したことを確認する
# https://learn.microsoft.com/ja-jp/powershell/module/microsoft.powershell.management/stop-process?view=powershell-7.4#3
$p = Get-Process -Name PalServer-Win64-Test-Cmd
Stop-Process -InputObject $p
Get-Process | Where-Object { $_.HasExited }

# アップデート
Start-Process -FilePath $root\steamcmd.exe -ArgumentList '+login', 'anonymous', '+app_update', '2394010', 'validate', '+quit' -Wait

# PalServerを起動
Start-Process -FilePath $root\steamapps\common\PalServer\PalServer.exe