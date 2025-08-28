@echo off
setlocal

REM Clone repositories
echo Cloning repositories...
git clone "https://github.com/zen-browser/desktop" "temp/zen-browser" || (echo Error: Failed to clone zen-browser/desktop && exit /b 1)
git clone "https://github.com/brave/brave-browser" "temp/brave-browser" || (echo Error: Failed to clone brave/brave-browser && exit /b 1)
git clone "https://github.com/brave/brave-core" "temp/brave-core" || (echo Error: Failed to clone brave/brave-core && exit /b 1)

REM Copy directories
echo Copying directories...
xcopy "temp\zen-browser\app" "src\app\" /E /I /H /Y
xcopy "temp\brave-browser\app" "src\brave_app\" /E /I /H /Y
xcopy "temp\brave-core\app" "src\brave_core_app\" /E /I /H /Y

REM Clean up
echo Cleaning up...
rmdir /S /Q temp

REM Verify
echo Verifying...
if exist "src\app" (echo Verified: src\app exists.) else (echo Error: src\app does not exist. && exit /b 1)
if exist "src\brave_app" (echo Verified: src\brave_app exists.) else (echo Error: src\brave_app does not exist. && exit /b 1)
if exist "src\brave_core_app" (echo Verified: src\brave_core_app exists.) else (echo Error: src\brave_core_app does not exist. && exit /b 1)

echo All repositories cloned and organized successfully.
endlocal
