# Basic loop that sends the F13 key every 4m59s for ~4 hours
## Save as .ps1 file and run as a background job via; Start-Job -Filepath .\keep-alive.ps1
## Stop it prematurely by; get-job | stop-job

while($val -ne 48)
{
    $dummyshell = New-Object -com "Wscript.shell"
    $dummyshell.sendkeys("{F13}")
    start-sleep 299
    $val++
}