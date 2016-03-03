; Simple install script for a Windows Photoshop Plugin
; Written for the FilterMeister plugin community
; by Kohan Ikin / namesuppressed.com
; syneryder@namesuppressed.com

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

; Change these to the name of your 32-bit & 64-bit 8BF plugin files.
; If you don't have one of these lines, you can just delete it.
#define ThirtyTwoBit8BFFile  "example32.8bf"
#define SixtyFourBit8BFFile  "example64.8bf"

; If your project has more plugins, you'll need to modify the
; InstallPlugins and UninstallPlugins functions below to account
; for your additional plugin files & uninstalling them correctly.

; If you don't want a License or ReadMe, just delete these lines.
#define LicenseFileName "Files\license.txt"
#define ReadMeFile      "Files\readme.txt"

; If you don't want a background, delete this line.
#define UseInstallBackground "USEBACKGROUND"

; Support for additional files (data files etc) isn't included in
; this example.  You will need to figure this out for yourself, but
; you can start by adding these files to the [Files] section of the
; script below.

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
DefaultDirName={code:GetPluginFolders}\{#ProductName} {#MajorVersion}
DefaultGroupName={#ProductName} {#MajorVersion}
OutputBaseFilename={#InstallName}
Compression=lzma

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
#ifdef LicenseFileName
  LicenseFile = {#LicenseFilename}
#endif

; Keep all blank for 32-bit only install. Set to x64 for 64-bit (non-Itanium) installs.
; Remember that x86 is 32-bit, x64 is 64-bit!
ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64




[Files]
#ifdef ThirtyTwoBit8BFFile
  Source: "Files\{#ThirtyTwoBit8BFFile}"; DestDir: "{app}"; Flags: ignoreversion
#endif
#ifdef SixtyFourBit8BFFile
  Source: "Files\{#SixtyFourBit8BFFile}"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
#endif
#ifdef ReadMeFile
  Source: "{#ReadMeFile}"; DestDir: "{app}"; Flags: isreadme
#endif
; You might need to insert your own files here if you have additional
; support files to be installed.  You might need to work on this on
; your own or wait for the FilterMeister Mailing List folks to update
; this to add support for extra files.



[Tasks]
Name: "installplugins"; Description: "Install Folder and Graphics Programs"; GroupDescription: "Install plug-ins into:";

[Registry]
Root: HKCU; Subkey: "Software\{#CompanyName}"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\{#CompanyName}"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\{#CompanyName}\{#ProductName} {#MajorVersion}"; ValueName: "InstallPath"; ValueType: String; ValueData: "{app}\"; Flags: uninsdeletevalue 

[UninstallDelete]
Type: dirifempty; Name: "{app}\"; 

[CustomMessages]
english.NameAndVersion=%1 version %2
english.AdditionalIcons=Additional icons:
english.CreateDesktopIcon=Create a &desktop icon
english.CreateQuickLaunchIcon=Create a &Quick Launch icon
english.ProgramOnTheWeb=%1 on the Web
english.UninstallProgram=Uninstall %1
english.LaunchProgram=Launch %1
english.AssocFileExtension=&Associate %1 with the %2 file extension
english.AssocingFileExtension=Associating %1 with the %2 file extension...
brazilianportuguese.NameAndVersion=%1 vers�o %2
brazilianportuguese.AdditionalIcons=�cones adicionais:
brazilianportuguese.CreateDesktopIcon=Criar um �cone na &�rea de Trabalho
brazilianportuguese.CreateQuickLaunchIcon=Criar um �cone na &Barra de Inicializa��o R�pida
brazilianportuguese.ProgramOnTheWeb=%1 na Internet
brazilianportuguese.UninstallProgram=Desinstalar %1
brazilianportuguese.LaunchProgram=Executar %1
brazilianportuguese.AssocFileExtension=&Associar %1 com a extens�o de arquivo %2
brazilianportuguese.AssocingFileExtension=Associando %1 com a extens�o de arquivo...
catalan.NameAndVersion=%1 versi� %2
catalan.AdditionalIcons=Icones addicionals:
catalan.CreateDesktopIcon=Crea una icona a l'&Escriptori
catalan.CreateQuickLaunchIcon=Crea una icona a la &Barra de tasques
catalan.ProgramOnTheWeb=%1 a Internet
catalan.UninstallProgram=Desinstal�la %1
catalan.LaunchProgram=Obre %1
catalan.AssocFileExtension=&Associa %1 amb l'extensi� de fitxer %2
catalan.AssocingFileExtension=Associant %1 amb l'extensi� de fitxer %2...
czech.NameAndVersion=%1 verze %2
czech.AdditionalIcons=Dal�� z�stupci:
czech.CreateDesktopIcon=Vytvo�it z�stupce na &plo�e
czech.CreateQuickLaunchIcon=Vytvo�it z�stupce na panelu &Snadn� spu�t�n�
czech.ProgramOnTheWeb=Aplikace %1 na internetu
czech.UninstallProgram=Odinstalovat aplikaci %1
czech.LaunchProgram=Spustit aplikaci %1
czech.AssocFileExtension=Vytvo�it &asociaci mezi soubory typu %2 a aplikac� %1
czech.AssocingFileExtension=Vytv��� se asociace mezi soubory typu %2 a aplikac� %1...
danish.NameAndVersion=%1 version %2
danish.AdditionalIcons=Ekstra ikoner:
danish.CreateDesktopIcon=Lav ikon p� &skrivebordet
danish.CreateQuickLaunchIcon=Lav &hurtigstart-ikon
danish.ProgramOnTheWeb=%1 p� internettet
danish.UninstallProgram=Afinstaller (fjern) %1
danish.LaunchProgram=K�r %1
danish.AssocFileExtension=&Sammenk�d %1 med filtypen %2
danish.AssocingFileExtension=Sammenk�der %1 med filtypen %2...
dutch.NameAndVersion=%1 versie %2
dutch.AdditionalIcons=Extra snelkoppelingen:
dutch.CreateDesktopIcon=Maak een snelkoppeling op het &bureaublad
dutch.CreateQuickLaunchIcon=Maak een snelkoppeling op de &Snel starten werkbalk
dutch.ProgramOnTheWeb=%1 op het Web
dutch.UninstallProgram=Verwijder %1
dutch.LaunchProgram=&Start %1
dutch.AssocFileExtension=&Koppel %1 aan de %2 bestandsextensie
dutch.AssocingFileExtension=Bezig met koppelen van %1 aan de %2 bestandsextensie...
finnish.NameAndVersion=%1 versio %2
finnish.AdditionalIcons=Lis�kuvakkeet:
finnish.CreateDesktopIcon=Luo kuvake &ty�p�yd�lle
finnish.CreateQuickLaunchIcon=Luo kuvake &pikak�ynnistyspalkkiin
finnish.ProgramOnTheWeb=%1 Internetiss�
finnish.UninstallProgram=Poista %1
finnish.LaunchProgram=K�ynnist� %1
finnish.AssocFileExtension=&Yhdist� %1 tiedostop��tteeseen %2
finnish.AssocingFileExtension=Yhdistet��n %1 tiedostop��tteeseen %2 ...
french.NameAndVersion=%1 version %2
french.AdditionalIcons=Ic�nes suppl�mentaires :
french.CreateDesktopIcon=Cr�er une ic�ne sur le &Bureau
french.CreateQuickLaunchIcon=Cr�er une ic�ne dans la barre de &Lancement rapide
french.ProgramOnTheWeb=Page d'accueil de %1
french.UninstallProgram=D�sinstaller %1
french.LaunchProgram=Ex�cuter %1
french.AssocFileExtension=&Associer %1 avec l'extension de fichier %2
french.AssocingFileExtension=Associe %1 avec l'extension de fichier %2...
german.NameAndVersion=%1 Version %2
german.AdditionalIcons=Zus�tzliche Symbole:
german.CreateDesktopIcon=&Desktop-Symbol erstellen
german.CreateQuickLaunchIcon=Symbol in der Schnellstartleiste erstellen
german.ProgramOnTheWeb=%1 im Internet
german.UninstallProgram=%1 entfernen
german.LaunchProgram=%1 starten
german.AssocFileExtension=&Registriere %1 mit der %2-Dateierweiterung
german.AssocingFileExtension=%1 wird mit der %2-Dateierweiterung registriert...
hebrew.NameAndVersion=%1 ����� %2
hebrew.AdditionalIcons=�������� ������:
hebrew.CreateDesktopIcon=��� ����� ��� �� &����� ������
hebrew.CreateQuickLaunchIcon=��� ������ ����� ����� ������
hebrew.ProgramOnTheWeb=%1 ����
hebrew.UninstallProgram=��� �� %1
hebrew.LaunchProgram=���� %1
hebrew.AssocFileExtension=&��� �� %1 �� ����� ����� %2
hebrew.AssocingFileExtension=���� �� %1 �� ����� ����� %2
hungarian.NameAndVersion=%1 %2 verzi�
hungarian.AdditionalIcons=Tov�bbi ikonok:
hungarian.CreateDesktopIcon=Ikon l�trehoz�sa az &Asztalon
hungarian.CreateQuickLaunchIcon=Ikon l�trehoz�sa a &Gyorsind�t�s eszk�zt�ron
hungarian.ProgramOnTheWeb=%1 a weben
hungarian.UninstallProgram=%1 elt�vol�t�sa
hungarian.LaunchProgram=%1 elind�t�sa
hungarian.AssocFileExtension=A(z) %1 &t�rs�t�sa a(z) %2 f�jlkiterjeszt�ssel
hungarian.AssocingFileExtension=A(z) %1 t�rs�t�sa a(z) %2 f�jlkiterjeszt�ssel...
italian.NameAndVersion=%1 versione %2
italian.AdditionalIcons=Icone aggiuntive:
italian.CreateDesktopIcon=Crea un'icona sul &desktop
italian.CreateQuickLaunchIcon=Crea un'icona nella barra &Avvio veloce
italian.ProgramOnTheWeb=%1 sul Web
italian.UninstallProgram=Disinstalla %1
italian.LaunchProgram=Avvia %1
italian.AssocFileExtension=&Associa l'estensione %2 a %1
italian.AssocingFileExtension=Associazione dell'estensione %2 a %1 in corso...
japanese.NameAndVersion=%1 �o�[�W���� %2
japanese.AdditionalIcons=�A�C�R����ǉ�����:
japanese.CreateDesktopIcon=�f�X�N�g�b�v��ɃA�C�R�����쐬����(&d)
japanese.CreateQuickLaunchIcon=&Quick Launch �A�C�R�����쐬����
japanese.ProgramOnTheWeb=%1 on the Web
japanese.UninstallProgram=%1 ���A���C���X�g�[������
japanese.LaunchProgram=%1 �����s����
japanese.AssocFileExtension=%2 �t�@�C���g���� %1���֘A�t���܂��B
japanese.AssocingFileExtension=%2 �� %1���֘A�t���܂��B
norwegian.NameAndVersion=%1 versjon %2
norwegian.AdditionalIcons=Ekstra-ikoner:
norwegian.CreateDesktopIcon=Lag ikon p� &skrivebordet
norwegian.CreateQuickLaunchIcon=Lag et &Hurtigstarts-ikon
norwegian.ProgramOnTheWeb=%1 p� nettet
norwegian.UninstallProgram=Avinstaller %1
norwegian.LaunchProgram=Kj�r %1
norwegian.AssocFileExtension=&Koble %1 med filetternavnet %2
norwegian.AssocingFileExtension=Kobler %1 med filetternavnet %2...
polish.NameAndVersion=%1 wersja %2
polish.AdditionalIcons=Dodatkowe ikony:
polish.CreateDesktopIcon=Utw�rz ikon� na &pulpicie
polish.CreateQuickLaunchIcon=Utw�rz ikon� na pasku &szybkiego uruchamiania
polish.ProgramOnTheWeb=Strona WWW programu %1
polish.UninstallProgram=Deinstalacja programu %1
polish.LaunchProgram=Uruchom program %1
polish.AssocFileExtension=&Przypisz program %1 do rozszerzenia pliku %2
polish.AssocingFileExtension=Przypisywanie programu %1 do rozszerzenia pliku %2...
portuguese.NameAndVersion=%1 vers�o %2
portuguese.AdditionalIcons=�cones adicionais:
portuguese.CreateDesktopIcon=Criar �cone no Ambiente de &Trabalho
portuguese.CreateQuickLaunchIcon=&Criar �cone na barra de Inicia��o R�pida
portuguese.ProgramOnTheWeb=%1 na Web
portuguese.UninstallProgram=Desinstalar o %1
portuguese.LaunchProgram=Executar o %1
portuguese.AssocFileExtension=Associa&r o %1 aos ficheiros com a extens�o %2
portuguese.AssocingFileExtension=A associar o %1 aos ficheiros com a extens�o %2...
russian.NameAndVersion=%1, ������ %2
russian.AdditionalIcons=�������������� ������:
russian.CreateDesktopIcon=������� ������ �� &������� �����
russian.CreateQuickLaunchIcon=������� ������ � &������ �������� �������
russian.ProgramOnTheWeb=���� %1 � ���������
russian.UninstallProgram=���������������� %1
russian.LaunchProgram=��������� %1
russian.AssocFileExtension=��&����� %1 � �������, �������� ���������� %2
russian.AssocingFileExtension=���������� %1 � ������� %2...
slovenian.NameAndVersion=%1 razli�ica %2
slovenian.AdditionalIcons=Dodatne ikone:
slovenian.CreateDesktopIcon=Ustvari ikono na &namizju
slovenian.CreateQuickLaunchIcon=Ustvari ikono za &hitri zagon
slovenian.ProgramOnTheWeb=%1 na spletu
slovenian.UninstallProgram=Odstrani %1
slovenian.LaunchProgram=Odpri %1
slovenian.AssocFileExtension=&Pove�i %1 s pripono %2
slovenian.AssocingFileExtension=Povezujem %1 s pripono %2...
spanish.NameAndVersion=%1 versi�n %2
spanish.AdditionalIcons=Iconos adicionales:
spanish.CreateDesktopIcon=Crear un icono en el &escritorio
spanish.CreateQuickLaunchIcon=Crear un icono de Inicio R�pido
spanish.ProgramOnTheWeb=%1 en la Web
spanish.UninstallProgram=Desinstalar %1
spanish.LaunchProgram=Ejecutar %1
spanish.AssocFileExtension=&Asociar %1 con la extensi�n de archivo %2
spanish.AssocingFileExtension=Asociando %1 con la extensi�n de archivo %2...
greek.NameAndVersion=%1 ������ %2
greek.AdditionalIcons=�������� ���������:
greek.CreateDesktopIcon=���������� ���� &���������� ���� ��������� ��������
greek.CreateQuickLaunchIcon=���������� ���� ���������� ��� &������� ��������
greek.ProgramOnTheWeb=�� %1 ��� Internet
greek.UninstallProgram=������������� ��� %1
greek.LaunchProgram=�������� ��� %1
greek.AssocFileExtension=%������������ ��� %1 �� ��� %2 �������� �������
greek.AssocingFileExtension=������� ������������ ��� %1 �� ��� %2 �������� �������...


[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "english"; MessagesFile: "compiler:Default.isl"; 
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"; 
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"; 
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"; 
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"; 
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"; 
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"; 
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"; 
Name: "french"; MessagesFile: "compiler:Languages\French.isl"; 
Name: "german"; MessagesFile: "compiler:Languages\German.isl"; 
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"; 
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"; 
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"; 
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"; 
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"; 
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"; 
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"; 
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"; 
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"; 
Name: "serbiancyrillic"; MessagesFile: "compiler:Languages\SerbianCyrillic.isl";
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl";
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"; 
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"; 
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"; 





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



#include "common/detect.iss"



procedure InstallPlugins();
var
  I: Integer;
  ok: Boolean;
  folderPath: String;
begin
  // How do we decide if we should only install the 32-bit
  // version, 64-bit version, or both?
  #ifdef ThirtyTwoBit8BFFile
    ExtractTemporaryFile('{#ThirtyTwoBit8BFFile}')
  #endif
  #ifdef SixtyFourBit8BFFile
    ExtractTemporaryFile('{#SixtyFourBit8BFFile}')
  #endif
  for I := 0 to GetArrayLength(pluginFolders) - 1 do
  begin
    if WizardForm.TasksList.Checked[I + 1] then
    begin
      // This next line necessary with Paint Shop Pro X2, which doesn't
      // create its own default PlugIns folder automatically!
      If Not DirExists(pluginFolders[I].Folder) Then CreateDir(pluginFolders[I].Folder);
      folderPath := pluginFolders[I].Folder + '\{#ProductName} {#MajorVersion}'
      CreateDir(folderPath);
      ok := DirExists(folderPath);
      If ok Then
      Begin
        #ifdef ThirtyTwoBit8BFFile
        If Not pluginFolders[I].IsSixtyFourBit then
          FileCopy(ExpandConstant('{tmp}\{#ThirtyTwoBit8BFFile}'), folderPath + '\{#ThirtyTwoBit8BFFile}', False);
        #endif
        #ifdef SixtyFourBit8BFFile
        if (Is64BitInstallMode And pluginFolders[I].IsSixtyFourBit) then
          FileCopy(ExpandConstant('{tmp}\{#SixtyFourBit8BFFile}'), folderPath + '\{#SixtyFourBit8BFFile}', False);
        #endif
        RegWriteStringValue(HKLM, 'Software\{#CompanyName}\{#ProductName} {#MajorVersion}', 'Install' + IntToStr(I), AddBackslash(pluginFolders[I].Folder))
      End
      Else MsgBox('Unable to install in ' + pluginFolders[I].ProductName + #13#13 + 'Unable to create folder: ' + folderPath, mbInformation, mb_Ok);
    end;
  end;
end;



procedure UninstallPlugins();
var
	TempString: String;
	I: Integer;
  FolderPath: String;
  FileName: String;
begin

  // We can do better than a magic number hard-coded for-loop here!
  // We should be able to inspect all the sub-keys beginning with
  // Install and work from those instead of this weird limit on 30
  // graphics programs.

  for I := 0 To 29 do
  begin
    if RegQueryStringValue(HKLM, 'Software\{#CompanyName}\{#ProductName} {#MajorVersion}', 'Install' + IntToStr(I), TempString) then
  	begin
      // Can either of these lines cause problems if TempString is blank?
      FolderPath := TempString + '{#ProductName} {#MajorVersion}\'
      //MsgBox(FolderPath, mbInformation, mb_Ok);
      #ifdef ThirtyTwoBit8BFFile
        FileName := FolderPath + '{#ThirtyTwoBit8BFFile}';
        //If FileExists(FileName) Then MsgBox('File Exists: ' + FileName, mbInformation, mb_Ok);
        DeleteFile(FileName);
        //MsgBox(FileName, mbInformation, mb_Ok);
      #endif
      #ifdef SixtyFourBit8BFFile
        FileName := FolderPath + '{#SixtyFourBit8BFFile}';
        //If FileExists(FileName) Then MsgBox('File Exists: ' + FileName, mbInformation, mb_Ok);
        DeleteFile(FileName);
        //MsgBox(FileName, mbInformation, mb_Ok);
      #endif
      // Delete folder, but only if empty, and do not delete recursively.
      DelTree(folderPath, True, False, False); 
  	end;
	RegDeleteValue(HKLM, 'Software\{#CompanyName}\{#ProductName} {#MajorVersion}', 'Install' + IntToStr(I));
  end;
end;


procedure GenerateTaskList();
var
  I: Integer;
begin
  if externalProgramsAdded = False then
  begin
    if GetArrayLength(pluginFolders) = 0 then
    begin
      // This situation should be dealt with some other way. Perhaps a prompt for a directory
      WizardForm.TasksList.ItemCaption[1] := ExpandConstant('{app}');
      WizardForm.TasksList.Checked[1]     := false;
      WizardForm.TasksList.ItemEnabled[1] := false;
    end
    else
    begin
      // Now add all the graphics programs we found installed
      for I := 0 to GetArrayLength(pluginFolders) - 1 do
      begin
        if I = 0 then
        begin
          WizardForm.TasksList.ItemCaption[1] := pluginFolders[I].ProductName;
          WizardForm.TasksList.Checked[1]     := True;
        end
        else
          WizardForm.TasksList.AddCheckBox(pluginFolders[I].ProductName, '', 0, true, true, false, false, nil);
      end;
    end;
  end;
  externalProgramsAdded := True;
end;



/////////////////////////////////////////////////////////////////////////////
/// Innosetup Install Control Functions
/////////////////////////////////////////////////////////////////////////////

procedure InitializeWizard();
begin
  // This is where custom wizard pages are defined.
end;


/////////////////////////////////////////////
///  Code adapted from http://stackoverflow.com/questions/10490046/how-do-read-and-set-the-value-of-a-checkbox-in-an-innosetup-wizard-page
/////////////////////////////////////////////

procedure CurPageChanged(CurPageID: Integer);
begin

  // On the Installing page, check which tasks were checked.
  // We'll need to run code here to install the plugins
  // to their respective folders here (except that goes on wpInstalling)
  case CurPageID of
    wpReady:
    begin
      InstallPlugins();
    end;

    // If the user has clicked back to the ProgramGroup screen,
    // the task list has been deleted, so we need to set a flag
    // here so we know to recreate the Tasks list again.
    wpSelectProgramGroup:
    begin
      externalProgramsAdded := False
    end;

    wpSelectDir:
    begin
      externalProgramsAdded := False
    end;

    wpSelectTasks:
    begin
      GenerateTaskList();
    end;

    else
    begin
      // Ignore
    end;
  end;
end;


procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of
    usUninstall:
      begin
        UninstallPlugins();
      end;
  end;
end;