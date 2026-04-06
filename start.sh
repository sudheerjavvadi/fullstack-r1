#!/bin/bash
# ===========================================================
# CitizenConnect - Quick Start Script (Mac/Linux)
# ===========================================================

echo ""
echo "========================================================"
echo "   CITIZEN CONNECT - QUICK START GUIDE"
echo "========================================================"
echo ""

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "[ERROR] Java is not installed or not in PATH"
    echo "Please install Java 17 or higher"
    exit 1
fi

echo "[OK] Java is installed"
java -version

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "[ERROR] Node.js is not installed or not in PATH"
    echo "Please install Node.js 18+ from https://nodejs.org/"
    exit 1
fi

echo "[OK] Node.js is installed"
node --version

echo ""
echo "========================================================"
echo "   STEP 1: Database Setup"
echo "========================================================"
echo ""
echo "[ACTION] Setup MySQL Database"
echo "- Ensure MySQL Server is running"
echo "- Create database: frontend"
echo "- Run: database-init.sql"
echo ""
read -p "Press Enter when database is ready..."

echo ""
echo "========================================================"
echo "   STEP 2: Starting Backend"
echo "========================================================"
echo ""

cd backend
if [ ! -d "." ]; then
    echo "[ERROR] backend directory not found"
    exit 1
fi

echo "[INFO] Building backend..."
./mvnw clean package -DskipTests > /dev/null 2>&1

echo "[INFO] Starting Spring Boot application..."
echo "Backend will start on: http://localhost:8080"
echo ""

# Start backend in background
./mvnw spring-boot:run &
BACKEND_PID=$!

echo "[INFO] Waiting for backend to start (10 seconds)..."
sleep 10

cd ..

echo ""
echo "========================================================"
echo "   STEP 3: Starting Frontend"
echo "========================================================"
echo ""

cd frontend

if [ ! -d "node_modules" ]; then
    echo "[INFO] Installing dependencies..."
    npm install
fi

echo "[INFO] Starting Vite development server..."
echo "Frontend will start on: http://localhost:5173"
echo ""

# Start frontend
npm run dev &
FRONTEND_PID=$!

echo ""
echo "========================================================"
echo "   ✅ APPLICATION STARTED SUCCESSFULLY"
echo "========================================================"
echo ""
echo "📦 BACKEND:   http://localhost:8080"
echo "🎨 FRONTEND:  http://localhost:5173"
echo "📚 SWAGGER:   http://localhost:8080/swagger-ui.html"
echo ""
echo "========================================================"
echo "   TEST CREDENTIALS"
echo "========================================================"
echo ""
echo "👑 ADMIN:"
echo "   Email: admin@citizenconnect.com"
echo "   Password: admin123"
echo ""
echo "👤 CITIZEN:"
echo "   Email: amit.citizen@example.com"
echo "   Password: citizen123"
echo ""
echo "🏛️ POLITICIAN:"
echo "   Email: arvind.politician@example.com"
echo "   Password: politician123"
echo ""
echo "🛡️ MODERATOR:"
echo "   Email: rahul.moderator@example.com"
echo "   Password: moderator123"
echo ""
echo "========================================================"
echo ""
echo "[INFO] Running in background"
echo "[INFO] Press CTRL+C to stop all services"
echo "[INFO] Check README.md for detailed documentation"
echo ""

# Wait for processes
wait $BACKEND_PID $FRONTEND_PID
