@echo off
REM Set variables for project paths
set REACT_PATH=..\admin-task-manager
set SPRING_BOOT_PATH=..\task-manager
set DOCKER_TAG_VERSION=v1.0.0

echo Setting up project paths...
echo React path: %REACT_PATH%
echo Spring Boot path: %SPRING_BOOT_PATH%
echo Docker tag version: %DOCKER_TAG_VERSION%

REM Java and Maven setup (manual step required on Windows)
echo Ensure JAVA_HOME and MAVEN_HOME are properly set in system environment variables.
REM NOTE: sdkman does not work on Windows.
REM You must manually configure JAVA_HOME and Maven paths in your environment variables.

REM Build admin-task-manager (React)
echo 1. Building admin-task-manager (React)...
cd %REACT_PATH%
call npm run build
if errorlevel 1 (
    echo Failed to build React app. Exiting...
    exit /b 1
)

REM Clear task-manager static folder
echo 2. Cleaning old static and build folders...
cd %SPRING_BOOT_PATH%
rmdir /s /q src\main\resources\static
mkdir src\main\resources\static
rmdir /s /q build
mkdir build

REM Copy React build to Spring Boot static folder
echo 3. Copying React build to Spring Boot static folder...
xcopy /E /I /Y %REACT_PATH%\build\* %SPRING_BOOT_PATH%\src\main\resources\static\
xcopy /E /I /Y %REACT_PATH%\build\* %SPRING_BOOT_PATH%\build\

REM Build task-manager (Spring Boot)
echo 4. Building task-manager (Spring Boot)...
cd %SPRING_BOOT_PATH%
call mvn clean package -DskipTests
if errorlevel 1 (
    echo Spring Boot build failed. Exiting...
    exit /b 1
)

echo All tasks completed successfully.
