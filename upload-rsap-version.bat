@echo off
set /p bn=BuildName?
echo Confirm:%bn%
pause
echo %bn% > rsapver.txt

copy ..\RSAP\build\main.exe .\RSAP\build\RSAP(build%bn%).exe
set "file=.\RSAP\downloads.html"

echo ^<a href="https://liyouxi2013.github.io/RSAP/build/RSAP(build%bn%).exe"^>RSAP_Build_%bn%^</a^> > "%file%.tmp"
type "%file%" >> "%file%.tmp"

move /y "%file%.tmp" "%file%" >nul

git add .
git commit -m "RSAP Build %bn% ver.txt"
git push
pause