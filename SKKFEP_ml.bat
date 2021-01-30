@echo off

set SRC="."
set DIST="%APPDATA%\SKKFEP\DICTS"

echo skk-dict-imasml SKKFEP用導入バッチファイル
echo ###########################################
echo.

cd /d %~dp0

copy /Y %SRC%\SKK-JISYO.imasml.actors.utf8 %DIST%\SKK-JISYO.imasml.actors.utf8 > nul 2>&1
copy /Y %SRC%\SKK-JISYO.imasml.firstname %DIST%\SKK-JISYO.imasml.firstname > nul 2>&1
copy /Y %SRC%\SKK-JISYO.imasml.fullname %DIST%\SKK-JISYO.imasml.fullname > nul 2>&1

echo 辞書をコピーしました。
echo ###########################################
echo.
pause