@echo off

where git >NUL
if NOT ["%errorlevel%"]==["0"] (
	echo git not found on PATH
    pause
    exit /b %errorlevel%
)

echo Restoring git submodules
git submodule update --init --recursive --remote --merge
if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)

where dotnet >NUL
if NOT ["%errorlevel%"]==["0"] (
	echo dotnet not found on PATH. Install .NET Core!
    pause
    exit /b %errorlevel%
)

echo building SetupTool.csproj
dotnet build SetupTool/SetupTool/SetupTool.csproj --output "SetupTool/build"

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)

start "" "SetupTool/build/SetupTool.exe"