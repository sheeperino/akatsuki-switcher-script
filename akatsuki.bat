TITLE AkatsukiScript

:: https://stackoverflow.com/questions/9232308/how-do-i-minimize-the-command-prompt-from-my-bat-file
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

:: change directory to where the script is located
cd /D "%~dp0"

:: ==========================================================

:: variables
SET voicemeeter_dir="C:\Program Files (x86)\VB\Voicemeeter\"

:: ==========================================================

:: use '::' to comment lines

:: kill voicemeeter
TASKKILL /f /im voicemeeterpro.exe

:: start akatsukiPatcher
START akatsukiPatcher.exe

:: kill SysMain for a smoother gameplay
net stop SysMain

:: start osu! with akatsuki.pw server and wait until it closes
START /wait %LOCALAPPDATA%\osu!\osu!.exe -devserver akatsuki.pw

:: ==========================================================

:: start voicemeeter after osu is closed
cd %voicemeeter_dir%
START voicemeeterpro.exe

:: kill akatsukiPatcher atfer osu is closed
TASKKILL /f /im akatsukiPatcher.exe

:: start SysMain after osu is closed
net start SysMain

exit

:: Script by sheeperino/Sophie :3
