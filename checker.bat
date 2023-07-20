:start
timeout /t 15 /nobreak

SETLOCAL EnableExtensions
set EXE=AstroServer.exe
set WEBHOOK= your webhook here
:: Make sure to change the webhook to your own
:: right you can delete webhooks
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  echo %EXE% is Not Running
  curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"server down, rebooting\"}" %WEBHOOK% & echo rebooting server & start ./WindowsServer/AstroServer.exe -log
)

goto start
