; Inno setup script for creation Windows x64 installer

; ToDo:
; * Спросить пользователя, создавать ли папку в меню пуск
; * Спросить пользователя, запускать ли приложение после установки
; * Спросить. удалить ли предыдущую версию, если она установлена
; * Автоматически вытаскивать версию, название и прочее
; * Исправить конфликт, если уже установлена версия с отличающейся битностью
; * Сделать вывод от битности в окне установки

[Setup]

; Application name
#define   Name       "TemplateQtQuick"
; Application version
#define   Version    "1.0"
; Organization name
#define   Publisher  "3dproger"
; Organization domain
#define   URL        "https://github.com/3dproger"
; Application executable file name
#define  ExeName    "TemplateQtQuick.exe"

; unique identifier for the application.
; uncomment and generate this via Tools -> Generate GUID
 AppId={#Name}_{#Version}_x64_{{65E32C79-0624-448F-8BCF-B93CEB1F0888} 

; x86_64 only installation
ArchitecturesInstallIn64BitMode=x64

; Compression options
Compression=lzma2
SolidCompression=yes

WizardStyle=modern
DisableDirPage=no
DisableProgramGroupPage=no

AppName={#Name}
AppVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}

DefaultGroupName={#Name}
DefaultDirName={pf}\{#Name}
UninstallDisplayIcon={app}\{#ExeName}

WizardImageFile="big_image.bmp"
WizardSmallImageFile="small_image.bmp"
SetupIconFile="installer_icon.ico"
DisableWelcomePage=false

; installer executable name
OutputBaseFileName={#Name}_{#Version}_x64_Setup
; вшкусещкн where to put the output installer
OutputDir=..\windows_installers

[Languages]
Name: en; MessagesFile: "compiler:Default.isl";
Name: ru; MessagesFile: "compiler:Languages\Russian.isl";
;Name: en; MessagesFile: "compiler:Default.isl"; LicenseFile: "License_ENG.txt"    
;Name: ru; MessagesFile: "compiler:Languages\Russian.isl"; LicenseFile: "License_RUS.txt"


[Messages]
ru.BeveledLabel=Russian
en.BeveledLabel=English

;[CustomMessages]

[Icons]
 Name: "{group}\{#Name}"; Filename: "{app}\{#ExeName}"
 Name: "{group}\{cm:UninstallProgram,{#Name}}"; Filename: "{uninstallexe}"
 Name: "{commondesktop}\{#Name}"; Filename: "{app}\{#ExeName}"; Tasks: desktopicon

[Tasks]
; Создание иконки на рабочем столе
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

;[Run]
; ToDo: creat icon

[Files]
;файлы
Source: "..\deploy\windows_x86_64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

