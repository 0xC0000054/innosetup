; Simple install script for a Windows Photoshop Plugin
; Written for the FilterMeister plugin community
; by Kohan Ikin / namesuppressed.com
; syneryder@namesuppressed.com
;
; Includes contributions by the following:
;   Martijn van der Lee / vanderlee.com

; Change these values to those for your own plugin
#define CompanyName     "My Company"
#define ProductName     "My Example Plugin"
#define MajorVersion    "2"
#define VersionNumber   "2.0"
#define FullVersion     "2.0.0.0"
#define CopyrightYear   "2016"
#define CompanyURL      "http://www.example.com/"
#define SupportURL      "http://www.example.com/"
#define InstallName     "ExamplePluginInstall"

;TODO Separate "InstallFiles" from "PluginFiles".
#dim InstallFiles[1]
#define InstallFiles[0] "install.txt"

; Specify a list of common files to install for both the 32-bit &
; 64-bit version of your installation.
; If you don't have any common files, then comment these lines out.
#dim Files[1]
#define Files[0]        "common.txt"

; Specify a list of files to install for the 32-bit version only.
; If you don't have any 32-bit files, then comment these lines out.
#dim Files32[1]
#define Files32[0]      "example32.8bf"

; Specify a list of files to install for the 64-bit version only.
; If you don't have any 64-bit files, then comment these lines out.
#dim Files64[1]
#define Files64[0]      "example64.8bf"

; The License fill must be agreed to by the user before installing.
#define LicenseFileName "Files\license.txt"

; The ReadMe file will be shown after installation by default.
#define ReadMeFile      "Files\readme.txt"

; If you don't want a background, delete this line.
;#define UseInstallBackground

; By default, the uninstaller and any specified InstallFiles files, but
; not the plugin itself, will be installed in a predefined subdirectory
; of "Program Files" (or the x86 equivalent). The user will not be asked
; to specify this folder.
; Comment out if you don't want to ask the user for the install directory
;#define AskInstallDirectory

; Allow the user to specify a custom directory to install the plugin to.
; Comment out if you want to disable this feature
#define CustomDirectory

; Support for code-signing (both with SHA-1 and SHA-256 certificates)
; is possible, but not included in this script yet.  SignTool is the
; [Setup] command you'll need to use.  I highly recommend using kSign
; from kSoftware for your code-signing, so you don't have to download
; the entire Windows Platform SDK just to get a code signing app.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; You should not need to change anything below this for a simple install.  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[Setup]
AppName={#ProductName}
AppVerName={#ProductName} {#VersionNumber}
AppVersion={#VersionNumber}
VersionInfoVersion={#FullVersion}
AppPublisher={#CompanyName}
AppPublisherURL={#CompanyURL}
AppContact={#ProductName} Customer Support
AppSupportURL={#SupportURL}
AppCopyright=Copyright �{#CopyrightYear} by {#CompanyName}
UsePreviousAppDir=yes
UsePreviousGroup=yes
ShowTasksTreeLines=yes
DefaultDirName={pf}\{#ProductName} {#MajorVersion}
DefaultGroupName={#ProductName} {#MajorVersion}
OutputBaseFilename={#InstallName}

; Compression method. By default, lzma2/max compression is used, which
; typically offers the best compression rate.
;Compression=lzma

; Solid compression creates a smaller installer executable, at the cost of
; additional time during installation.
;SolidCompression=yes

; Enable these to change images in the installer
;SetupIconFile=Saki-Snowish-Install.ico
;WizardSmallImageFile=wizardsmall.bmp

; Enable these to show a background gradient.
; If you don't want a background, delete these lines
#ifdef UseInstallBackground
  BackColor=$000000
  BackColor2=$660000
  WindowShowCaption=no
  WindowVisible=yes
#endif

; Optionally display a user license if defined
#ifdef LicenseFile
  LicenseFile = {#LicenseFile}
#endif

; Keep all blank for 32-bit only install. Set to x64 for 64-bit (non-Itanium) installs.
; Remember that x86 is 32-bit, x64 is 64-bit!
ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64
                                                                          
; This is required for the InnoSetup preprocessor (ISPP). Do not change it.
#define I



[Files]
#sub InstallFile
  Source: "Files/{#InstallFiles[I]}"; DestDir: "{app}"; Flags: ignoreversion
#endsub
#for {I = 0; I < DimOf(InstallFiles); I++} InstallFile

#sub FileEntry
  Source: "Files/{#Files[I]}"; DestDir: "{app}"; Flags: ignoreversion dontcopy
#endsub
#for {I = 0; I < DimOf(Files); I++} FileEntry

#sub File32Entry
  Source: "Files/{#Files32[I]}"; DestDir: "{app}"; Flags: ignoreversion dontcopy; Check: not Is64BitInstallMode
#endsub
#for {I = 0; I < DimOf(Files32); I++} File32Entry

#sub File64Entry
  Source: "Files/{#Files64[I]}"; DestDir: "{app}"; Flags: ignoreversion dontcopy; check: Is64BitInstallMode
#endsub
#for {I = 0; I < DimOf(Files64); I++} File64Entry

#ifdef ReadMeFile
 Source: "{#ReadMeFile}"; DestDir: "{app}"; Flags: isreadme solidbreak
#endif

#include "common/locale.iss"

[CustomMessages]
english.InstallPluginsInto=Install plug-in into:
english.CustomDirTask=Install plug-in to a custom folder
english.CustomDirCaption=Select custom plug-in folder
english.CustomDirDescription=Where should the plug-in be installed?
english.CustomDirSubCaption=Select a custom folder in which the "{#ProductName} {#MajorVersion}" plug-in should be installed.
dutch.InstallPluginsInto=Installeer plug-in in:
dutch.CustomDirTask=Installeer plug-in in een extra map
dutch.CustomDirCaption=Selecteer extra plug-in map
dutch.CustomDirDescription=Waar moet de plug-in worden ge�nstalleerd?
dutch.CustomDirSubCaption=Selecteer een extra map waarin de "{#ProductName} {#MajorVersion}" plug-in moet worden ge�nstalleerd.

[Tasks]
Name: "InstallPluginTask"; Description: "{#ProductName} {#MajorVersion}"; GroupDescription: "{cm:InstallPluginsInto}";
#ifdef CustomDirectory
  Name: "CustomDirTask"; Description: "{cm:CustomDirTask}"; GroupDescription: "{cm:InstallPluginsInto}"; Flags: unchecked
#endif

[Registry]
Root: HKCU; Subkey: "Software\{#CompanyName}"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\{#CompanyName}"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; ValueName: "InstallPath"; ValueType: String; ValueData: "{app}\"; Flags: uninsdeletevalue 

[UninstallDelete]
Type: dirifempty; Name: "{app}\"; 

[Code]
////////////////////////////////////////
// Important global constant definitions
////////////////////////////////////////

type TPluginFolder = record
  ProductName    : string;
  Version        : string;
  IsSixtyFourBit : Boolean;
  Folder         : string;
end;

type TArrayOfPluginFolders = array of TPluginFolder;

const sLineBreak = #13#10;

var
  pluginFolders: TArrayOfPluginFolders;
  externalProgramsAdded: Boolean;
  CustomDirPage: TInputDirWizardPage;

#include "common/detect.iss"
#include "common/install.iss"

/////////////////////////////////////////////////////////////////////////////
/// Innosetup Install Control Functions
/////////////////////////////////////////////////////////////////////////////

//---------------------------------------------------------------------------
// Add the detected plugins to the task list
procedure GenerateTaskList();
var
  I: Integer;
begin
  if externalProgramsAdded = False then
  begin
    // Check and disable the top (install) task
    WizardForm.TasksList.Checked[1]     := True;
    WizardForm.TasksList.ItemEnabled[1] := False;

    // Now add all the graphics programs we found installed
    for I := 0 to GetArrayLength(pluginFolders) - 1 do
    begin
      WizardForm.TasksList.AddCheckBox(pluginFolders[I].ProductName, '', 0, true, true, false, false, nil);
    end;
  end;
  externalProgramsAdded := True;
end;

//---------------------------------------------------------------------------
// Add checked plugin tasks to the list of tasks reported will be installed
// Also adds the directory name of the customdir, if checked
procedure ShowPluginTasks();
var
  I: Integer;
  CustomPluginFolder: TPluginFolder;
begin
  #ifdef CustomDirectory
    // Add the directory path if customdir is used
    if IsTaskSelected('CustomDirTask') and not (CustomDirPage.Values[0] = '') then
    begin
      Wizardform.ReadyMemo.Lines.Add(StringOfChar(' ', 4 * 3) + CustomDirPage.Values[0]);
    end;
  #endif

  // Add the plugins
  for I := 0 to GetArrayLength(pluginFolders) - 1 do
  begin
    if WizardForm.TasksList.Checked[I + 1] then
    begin
      Wizardform.ReadyMemo.Lines.Add(StringOfChar(' ', 3 * 3) + pluginFolders[I].ProductName);
    end;
  end;

  #ifdef CustomDirectory
    // Add the CustomDir to the list of plugins if used
    if IsTaskSelected('CustomDirTask') and not (CustomDirPage.Values[0] = '') then
    begin
      CustomPluginFolder.IsSixtyFourBit := Is64BitInstallMode;
      CustomPluginFolder.Folder := AddBackslash(CustomDirPage.Values[0]);
      AddToPluginFolders(CustomPluginFolder, pluginFolders);
    end
  #endif
end;

//---------------------------------------------------------------------------
// Add an extra page to ask for a custom directory, after selecting tasks
procedure InitializeWizard();
begin
  GetPluginFolders('');

  #ifdef CustomDirectory
    CustomDirPage := CreateInputDirPage(wpSelectTasks,
      CustomMessage('CustomDirCaption'), CustomMessage('CustomDirDescription'), CustomMessage('CustomDirSubCaption'),
      False, '');
    CustomDirPage.Add('');
    CustomDirPage.Values[0] := GetPreviousData('CustomDir', ExpandConstant('{pf}\{#ProductName} {#MajorVersion}'));
  #endif
end;

//---------------------------------------------------------------------------
// Register the customdir for uninstalling
procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  #ifdef CustomDirectory
    SetPreviousData(PreviousDataKey, 'CustomDir', CustomDirPage.Values[0]);
  #endif
end;

//---------------------------------------------------------------------------
// Skip pages depending on developer and/or user choices
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  #ifdef CustomDirectory
    if (PageId = CustomDirPage.id) and not IsTaskSelected('CustomDirTask') then
      Result := True
    else
  #endif

  #ifndef AskInstallDirectory
    if (PageId = wpSelectDir) then
      Result := True
    else
  #endif

  Result := False
end;

//---------------------------------------------------------------------------
// Page flow during install
// Code adapted from http://stackoverflow.com/questions/10490046/how-do-read-and-set-the-value-of-a-checkbox-in-an-innosetup-wizard-page
procedure CurPageChanged(CurPageID: Integer);
begin
  // On the Installing page, check which tasks were checked.
  // We'll need to run code here to install the plugins
  // to their respective folders here (except that goes on wpInstalling)
  case CurPageID of
    // If the user has clicked back to the ProgramGroup screen,
    // the task list has been deleted, so we need to set a flag
    // here so we know to recreate the Tasks list again.
    wpSelectProgramGroup:
      externalProgramsAdded := False;

    wpSelectDir:
      externalProgramsAdded := False;

    wpSelectTasks:
      GenerateTaskList();

    wpReady:
      ShowPluginTasks();

    wpInstalling:
      InstallPlugins();
  end;
end;

//---------------------------------------------------------------------------
// Page flow during uninstall
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of
    usUninstall:
      UninstallPlugins();
  end;
end;

#expr SaveToFile(AddBackslash(SourcePath) + "Debug/preprocessed.iss")