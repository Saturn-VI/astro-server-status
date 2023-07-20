:start
timeout /t 15 /nobreak

SETLOCAL EnableExtensions
set EXE=AstroServer.exe
set WEBHOOK=https://discord.com/api/webhooks/1131610990874726540/czSBG6G71oKxYbExZdCNl41wnlw-HEv6p0JSeNQcDmRi6PlRg2IohexP6vdg0t1mgoq1
:: Make sure to change the webhook to your own
:: (the current one dumps into a muted channel in a throwaway server I have)
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  echo %EXE% is Not Running
  curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"server down, rebooting\"}" %WEBHOOK% & echo rebooting server & start ./WindowsServer/AstroServer.exe -log
)

goto start
