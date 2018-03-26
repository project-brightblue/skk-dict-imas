@echo off

set SRC="."
set DIST="%APPDATA%\SKKFEP\DICTS"

echo skk-dict-imassc SKKFEP用導入バッチファイル
echo ###########################################
echo.

cd /d %~dp0

copy /Y %SRC%\SKK-JISYO.imassc.firstname %DIST%\SKK-JISYO.imassc.firstname > nul 2>&1
copy /Y %SRC%\SKK-JISYO.imassc.fullname %DIST%\SKK-JISYO.imassc.fullname > nul 2>&1

echo 辞書をコピーしました。
echo ###########################################
echo.
pause