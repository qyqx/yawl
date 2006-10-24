# Auto-generated by EclipseNSIS Script Wizard
# Oct 24, 2006 11:43:25 AM

Name "NexusWorkflow Editor"
# Defines
!define REGKEY "SOFTWARE\$(^Name)"
!define VERSION 1.0
!define COMPANY "Nexus Workflow"
!define URL http://www.nexusworkflow.com

# MUI defines
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-blue.ico"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\NexusWorkflow Editor"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
!define MUI_STARTMENUPAGE_DEFAULT_FOLDER "NexusWorkflow Editor"
!define MUI_CUSTOMFUNCTION_GUIINIT CustomGUIInit
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-blue.ico"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

# Included files
!include Sections.nsh
!include MUI.nsh

# Reserved Files
ReserveFile "${NSISDIR}\Plugins\BGImage.dll"
ReserveFile "${NSISDIR}\Plugins\AdvSplash.dll"

# Variables
Var StartMenuGroup

# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English

# Installer attributes
OutFile setup.exe
InstallDir "$PROGRAMFILES\NexusWorkflow Editor"
CRCCheck on
XPStyle on
ShowInstDetails show
VIProductVersion 1.0.0.0
VIAddVersionKey ProductName "NexusWorkflow Editor"
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey CompanyName "${COMPANY}"
VIAddVersionKey CompanyWebsite "${URL}"
VIAddVersionKey FileVersion ""
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright ""
InstallDirRegKey HKLM "${REGKEY}" Path
ShowUninstDetails show

# Installer sections
Section -Main SEC0000
    SetOutPath $INSTDIR\lib
        SetOverwrite on
        File ..\..\build\3rdParty\lib\*.jar
        File ..\..\build\3rdParty\persistenceLibs\*.jar
        File ..\..\build\3rdParty\serviceLibs\jython\*.jar
        File ..\..\build\3rdParty\serviceLibs\xfire\*.jar
        File ..\..\build\3rdParty\standAlone-libs\*.jar
        File ..\..\build\3rdParty\wsif-lib\*.jar
        File ..\..\build\3rdParty\xsdlib\*.jar
    SetOutPath $INSTDIR\examples
        SetOverwrite on
        File /r ..\..\exampleSpecs\xml\*.x*
    SetOutPath $INSTDIR\classes
        SetOverwrite on
        File /r ..\..\build\classes\*
        File /r ..\..\build\properties\*
    SetOutPath $INSTDIR\bin
        SetOverwrite on
        File /r ..\..\build\nexusWorkflowEditor\bin\*.bat
    WriteRegStr HKLM "${REGKEY}\Components" Main 1
SectionEnd

Section -post SEC0001
    WriteRegStr HKLM "${REGKEY}" Path $INSTDIR
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $SMPROGRAMS\$StartMenuGroup
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk" $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayName "$(^Name)"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayVersion "${VERSION}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" Publisher "${COMPANY}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" URLInfoAbout "${URL}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoModify 1
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoRepair 1
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKLM "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o un.Main UNSEC0000
    RmDir /r /REBOOTOK $INSTDIR\classes
    RmDir /r /REBOOTOK $INSTDIR\examples
    RmDir /r /REBOOTOK $INSTDIR\lib
    RmDir /r /REBOOTOK $INSTDIR\bin
    DeleteRegValue HKLM "${REGKEY}\Components" Main
SectionEnd

Section un.post UNSEC0001
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk"
    Delete /REBOOTOK $INSTDIR\uninstall.exe
    DeleteRegValue HKLM "${REGKEY}" StartMenuGroup
    DeleteRegValue HKLM "${REGKEY}" Path
    DeleteRegKey /IfEmpty HKLM "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKLM "${REGKEY}"
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup
    RmDir /REBOOTOK $INSTDIR
SectionEnd

# Installer functions
Function CustomGUIInit
    Push $R1
    Push $R2
    BgImage::SetReturn /NOUNLOAD on
    BgImage::SetBg /NOUNLOAD /GRADIENT "0 0 128 0 0 0"
    Pop $R1
    Strcmp $R1 success 0 error
    File /oname=$PLUGINSDIR\bgimage.bmp "C:\WINDOWS\Coffee Bean.bmp"
    System::call "user32::GetSystemMetrics(i 0)i.R1"
    System::call "user32::GetSystemMetrics(i 1)i.R2"
    IntOp $R1 $R1 - 128
    IntOp $R1 $R1 / 2
    IntOp $R2 $R2 - 128
    IntOp $R2 $R2 / 2
    BGImage::AddImage /NOUNLOAD $PLUGINSDIR\bgimage.bmp $R1 $R2
    CreateFont $R1 "Times New Roman" 26 700 /ITALIC
    BGImage::AddText /NOUNLOAD "$(^SetupCaption)" $R1 "255 255 255" 16 8 500 100
    Pop $R1
    Strcmp $R1 success 0 error
    BGImage::Redraw /NOUNLOAD
    Goto done
error:
    MessageBox MB_OK|MB_ICONSTOP $R1
done:
    Pop $R2
    Pop $R1
FunctionEnd

Function .onGUIEnd
    BGImage::Destroy
FunctionEnd

Function .onInit
    InitPluginsDir
    Push $R1
    File /oname=$PLUGINSDIR\spltmp.bmp "..\..\build\nexusWorkflowEditor\NexusSplash.bmp"
    advsplash::show 1000 1000 1000 -1 $PLUGINSDIR\spltmp
    Pop $R1
    Pop $R1
FunctionEnd

# Uninstaller functions
Function un.onInit
    ReadRegStr $INSTDIR HKLM "${REGKEY}" Path
    ReadRegStr $StartMenuGroup HKLM "${REGKEY}" StartMenuGroup
    !insertmacro SELECT_UNSECTION Main ${UNSEC0000}
FunctionEnd

