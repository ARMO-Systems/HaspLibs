@echo On
set config=%1
if "%config%" == "" (
   set config=Release
)

set version=
if not "%PackageVersion%" == "" (
   set version=-Version %PackageVersion%
)

cd Packs

set firstPartNuget=%nuget% pack 
set lastPartNuget= -NonInteractive %version%

cmd /c %firstPartNuget%HaspLibs.nuspec%lastPartNuget%
cmd /c %firstPartNuget%HaspGenerateLibs.nuspec%lastPartNuget%
cmd /c %firstPartNuget%HaspRuntime.nuspec%lastPartNuget%