@echo off

set SRC="."
set DIST="%APPDATA%\SKKFEP\DICTS"

echo skk-dict-imasml SKKFEP用導入バッチファイル
echo ###########################################
echo.

cd /d %~dp0

copy /Y %SRC%\SKK-JISYO.imasasml.actors.utf8 %DIST%\SKK-JISYO.imasasml.actors.utf8 > nul 2>&1
copy /Y %SRC%\SKK-JISYO.imasasml.firstname %DIST%\SKK-JISYO.imasasml.firstname > nul 2>&1
copy /Y %SRC%\SKK-JISYO.imasasml.fullname %DIST%\SKK-JISYO.imasasml.fullname > nul 2>&1

echo 辞書をコピーしました。
echo ###########################################
echo.
pause