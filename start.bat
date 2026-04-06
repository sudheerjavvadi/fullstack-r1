@echo off
REM ===========================================================
REM CitizenConnect - Quick Start Script (Windows)
REM ===========================================================

setlocal enabledelayedexpansion

echo.
echo ========================================================
echo    CITIZEN CONNECT - QUICK START GUIDE
echo ========================================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java is not installed or not in PATH
    echo Please install Java 17 or higher and add it to PATH
    exit /b 1
)

echo [OK] Java is installed
java -version

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js is not installed or not in PATH
    echo Please install Node.js 18+ from https://nodejs.org/
    exit /b 1
)

echo [OK] Node.js is installed
node --version

echo.
echo ========================================================
echo    STEP 1: Database Setup
echo ========================================================
echo.
echo [ACTION] Setup MySQL Database
echo - Ensure MySQL Server is running
echo - Create database: frontend
echo - Run: database-init.sql
echo.
echo Press any key to continue when database is ready...
pause >nul

echo.
echo ========================================================
echo    STEP 2: Starting Backend
echo ========================================================
echo.

cd backend
if errorlevel 1 (
    echo [ERROR] backend directory not found
    exit /b 1
)

echo [INFO] Building backend...
call .\mvnw.cmd clean package -DskipTests >nul 2>&1

echo [INFO] Starting Spring Boot application...
echo Backend will start on: http://localhost:8080
echo.
echo Starting in new window...

REM Start backend in new window
start "CitizenConnect Backend" cmd /k ".\mvnw.cmd spring-boot:run"

echo [INFO] Waiting for backend to start (10 seconds)...
timeout /t 10 /nobreak

cd ..

echo.
echo ========================================================
echo    STEP 3: Starting Frontend
echo ========================================================
echo.

cd frontend

if not exist "node_modules" (
    echo [INFO] Installing dependencies...
    call npm install
)

echo [INFO] Starting Vite development server...
echo Frontend will start on: http://localhost:5173
echo.

start "CitizenConnect Frontend" cmd /k "npm run dev"

echo.
echo ========================================================
echo    ✅ APPLICATION STARTED SUCCESSFULLY
echo ========================================================
echo.
echo 📦 BACKEND:   http://localhost:8080
echo 🎨 FRONTEND:  http://localhost:5173
echo 📚 SWAGGER:   http://localhost:8080/swagger-ui.html
echo.
echo ========================================================
echo    TEST CREDENTIALS
echo ========================================================
echo.
echo 👑 ADMIN:
echo    Email: admin@citizenconnect.com
echo    Password: admin123
echo.
echo 👤 CITIZEN:
echo    Email: amit.citizen@example.com
echo    Password: citizen123
echo.
echo 🏛️ POLITICIAN:
echo    Email: arvind.politician@example.com
echo    Password: politician123
echo.
echo 🛡️ MODERATOR:
echo    Email: rahul.moderator@example.com
echo    Password: moderator123
echo.
echo ========================================================
echo.
echo [INFO] All windows will close when you press CTRL+C
echo [INFO] Check README.md for detailed documentation
echo.
pause

endlocal
