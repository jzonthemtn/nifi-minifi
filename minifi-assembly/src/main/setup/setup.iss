; Licensed to the Apache Software Foundation (ASF) under one or more
; contributor license agreements.  See the NOTICE file distributed with
; this work for additional information regarding copyright ownership.
; The ASF licenses this file to You under the Apache License, Version 2.0
; (the "License"); you may not use this file except in compliance with
; the License.  You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.

#define MyAppName "Apache MiNiFi"
#define MyAppPublisher "Apache Software Foundation"
#define MyAppURL "https://nifi.apache.org/minifi/"

;Provided by Maven during the build. Uncomment for debug builds in InnoSetup.
;#define MyAppVersion "0.2.1-SNAPSHOT"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{537AE3A9-EB2F-4EF9-8E2B-EFAA5A12D27F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\..\..\target\minifi-{#MyAppVersion}-bin\minifi-{#MyAppVersion}\LICENSE
InfoAfterFile=..\..\..\target\minifi-{#MyAppVersion}-bin\minifi-{#MyAppVersion}\README
OutputDir=..\..\..\target
OutputBaseFilename=apache-minifi-setup
Compression=lzma
SolidCompression=yes
AllowUNCPath=False

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\..\..\target\minifi-{#MyAppVersion}-bin\minifi-{#MyAppVersion}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\bin\install-service.bat"; WorkingDir: "{app}\bin"; Flags: runhidden postinstall; Description: "Install Apache MiNiFi system service."; StatusMsg: "Installing the Apache MiNiFi system service..."; Tasks: service

[UninstallRun]
Filename: {sys}\sc.exe; Parameters: "stop minifi" ; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "delete minifi" ; Flags: runhidden

[Dirs]
Name: "{app}\logs"

[Tasks]
Name: "service"; Description: "Install MiNiFi as a system service."

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[ThirdParty]
UseRelativePaths=True
