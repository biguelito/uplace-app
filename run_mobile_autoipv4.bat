@echo off
setlocal
setlocal enabledelayedexpansion
for /f "usebackq tokens=*" %%a in (`ipconfig ^| findstr /i "ipv4"`) do (
  for /f delims^=^:^ tokens^=2 %%b in ('echo %%a') do (
    for /f "tokens=1-4 delims=." %%c in ("%%b") do (
      set _o1=%%c
      set _o2=%%d
      set _o3=%%e
      set _o4=%%f
      rem strip leading space from first octet
      set _4octetIPV4=!_o1:~1!.!_o2!.!_o3!.!_o4!
      )
    )
  )

set API_URL=!_4octetIPV4!
set PORT=5000
set API_COMMON=http://!API_URL!:!PORT!

flutter run --dart-define=API_COMMON=!API_COMMON!

endlocal
