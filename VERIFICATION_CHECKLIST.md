# 🏛️ CitizenConnect - VERIFICATION CHECKLIST

## ✅ Pre-Flight Checklist

Before running the application, verify all prerequisites are met.

---

## 🔧 PREREQUISITES CHECK

### System Requirements
- [ ] **OS**: Windows 10+, macOS 10.14+, or Linux
- [ ] **RAM**: Minimum 4GB available
- [ ] **Disk Space**: Minimum 5GB available
- [ ] **Internet**: Connection for downloading dependencies

### Required Software

#### Java Development Kit (JDK)
```bash
# Check Java version
java -version

# Expected output:
# openjdk version "17.0.x" 2024-xx-xx LTS
```
- [ ] Java 17 or higher installed
- [ ] `java` command available in terminal/PowerShell
- [ ] `JAVA_HOME` environment variable set (optional but recommended)

#### Node.js and npm
```bash
# Check Node.js version
node --version 

# Check npm version
npm --version

# Expected output:
# v18.0.0 or higher
# 9.0.0 or higher
```
- [ ] Node.js 18+ installed
- [ ] npm installed with Node.js
- [ ] Both commands available in terminal/PowerShell

#### MySQL Database
```bash
# Check MySQL version
mysql --version

# Or test connection
mysql -u root -p

# Expected output:
# Ver 8.0.xx for Linux/Win
```
- [ ] MySQL 8.0+ installed and running
- [ ] MySQL port 3306 accessible
- [ ] MySQL root password known/set
- [ ] Can connect to MySQL server

---

## 📦 INSTALLATION CHECKLIST

### Backend Setup

#### Step 1: Navigate to Backend
- [ ] Can access `backend/` directory
- [ ] `pom.xml` file present
- [ ] `mvnw.cmd` (Windows) or `mvnw` (Unix) present

#### Step 2: Database Configuration
- [ ] Opened `backend/src/main/resources/application.yml`
- [ ] Verified MySQL connection details:
  - [ ] `url` points to correct database
  - [ ] `username` is correct (default: `root`)
  - [ ] `password` is correct
  - [ ] Database name is `frontend`

#### Step 3: Build Backend
- [ ] Ran `./mvnw clean package -DskipTests` successfully
- [ ] No compilation errors
- [ ] `target/` directory created with JAR file

```bash
# Example build command
./mvnw clean package -DskipTests
# Should end with: BUILD SUCCESS
```

### Frontend Setup

#### Step 1: Navigate to Frontend
- [ ] Can access `frontend/` directory
- [ ] `package.json` file present
- [ ] `vite.config.js` file present

#### Step 2: Install Dependencies
- [ ] Ran `npm install` successfully
- [ ] `node_modules/` directory created
- [ ] `package-lock.json` file present
- [ ] No critical vulnerabilities in audit

```bash
# Check for vulnerabilities
npm audit
# Should show 0 vulnerabilities or only low/medium
```

---

## 🗄️ DATABASE SETUP CHECKLIST

### MySQL Server

#### Connection Test
```bash
# Connect to MySQL
mysql -u root -p

# Inside MySQL prompt, run:
SHOW DATABASES;
# Should show list of databases
```
- [ ] Can connect to MySQL server
- [ ] Can see `mysql` and `information_schema` databases
- [ ] No connection refused errors

### Create Database

#### Create frontend database
```sql
CREATE DATABASE IF NOT EXISTS frontend;
USE frontend;
```
- [ ] Database `frontend` created successfully
- [ ] Can select the database

### Initialize Sample Data

#### Run SQL initialization script
```bash
# Windows (PowerShell)
mysql -u root -p frontend < backend\database-init.sql

# Mac/Linux
mysql -u root -p frontend < backend/database-init.sql
```

- [ ] Script executed without errors
- [ ] All tables created successfully
- [ ] Sample data inserted

#### Verify Database Content
```sql
USE frontend;

-- Check tables exist
SHOW TABLES;
-- Should show: users, issues, updates, feedback, comments

-- Check users were created
SELECT COUNT(*) FROM users;
-- Should show: 9

-- Check specific user
SELECT * FROM users WHERE email = 'admin@citizenconnect.com';
-- Should return 1 row
```

- [ ] `users` table exists with 9 records
- [ ] `issues` table exists with 5 records
- [ ] `updates` table exists with 4 records
- [ ] `feedback` table exists with 3 records
- [ ] Admin user exists
- [ ] Citizen users exist
- [ ] Politician users exist
- [ ] Moderator users exist

---

## 🚀 STARTUP CHECKLIST

### Backend Startup

#### Start Spring Boot Application
```bash
cd backend
./mvnw spring-boot:run

# If mvnw fails:
java -jar target/citizen-connect-backend-1.0.0.jar
```

#### Verify Backend Started
```bash
# Check these log messages:
# - "Started CitizenConnectApplication in X seconds"
# - "Tomcat started on port(s): 8080"
# - "✅ Database initialization completed!"
# - "✅ Total users created: 9"
```

- [ ] No compilation errors
- [ ] No database connection errors
- [ ] "Tomcat started on port(s): 8080" message appears
- [ ] "Database initialization completed!" message appears
- [ ] No exceptions in logs

#### Test Backend Connectivity
```bash
# In another terminal, test API
curl http://localhost:8080/api/auth/me

# Or visit in browser
http://localhost:8080/swagger-ui.html
```

- [ ] Backend running on `http://localhost:8080`
- [ ] Swagger UI accessible at `/swagger-ui.html`
- [ ] No CORS errors
- [ ] API responds (401 Unauthorized is expected for `/me`)

### Frontend Startup

#### Start Development Server
```bash
cd frontend
npm run dev

# Expected output:
# > citizen-connect-frontend@1.0.0 dev
# > vite
# VITE v5.0.x ready in XX ms
# ➜  Local:   http://localhost:5173/
```

#### Verify Frontend Started
- [ ] Vite dev server started successfully
- [ ] "Local: http://localhost:5173/" message appears
- [ ] No errors in console

#### Test Frontend Connectivity
```bash
# Visit in browser
http://localhost:5173
```

- [ ] Frontend loads at `http://localhost:5173`
- [ ] CitizenConnect logo and title visible
- [ ] Navigation links visible
- [ ] No 404 errors
- [ ] No blank page

---

## 🔐 LOGIN VERIFICATION CHECKLIST

### Test Admin Login
```
Email: admin@citizenconnect.com
Password: admin123
```
- [ ] Can navigate to login page
- [ ] Form fields visible and functional
- [ ] Can enter email and password
- [ ] Submit button works
- [ ] Login successful message appears
- [ ] Redirected to dashboard
- [ ] Admin dashboard loads
- [ ] User info shows in navbar

### Test Citizen Login
```
Email: amit.citizen@example.com
Password: citizen123
```
- [ ] Login successful
- [ ] Redirected to citizen dashboard
- [ ] Can see "Report Issue" button
- [ ] Dashboard shows statistics
- [ ] Can navigate to issues

### Test Politician Login
```
Email: arvind.politician@example.com
Password: politician123
```
- [ ] Login successful
- [ ] Redirected to politician dashboard
- [ ] Can see assigned issues
- [ ] Can see "Post Update" button
- [ ] Dashboard shows politician-specific stats

### Test Moderator Login
```
Email: rahul.moderator@example.com
Password: moderator123
```
- [ ] Login successful
- [ ] Redirected to moderator dashboard
- [ ] Can see moderation tools
- [ ] Can access flagged content (if any)

---

## 📊 FUNCTIONAL VERIFICATION CHECKLIST

### Public Pages (No Login Required)
- [ ] Home page loads
- [ ] Politicians page loads and shows public profile
- [ ] Updates page loads and shows public updates
- [ ] Can access navbar links

### Citizen Features (Login as Citizen)
- [ ] Can view dashboard
- [ ] Can see issue statistics
- [ ] Can create new issue
- [ ] Can view all issues
- [ ] Can view issue details
- [ ] Can give feedback to politicians
- [ ] Can view profile
- [ ] Can logout successfully

### Politician Features (Login as Politician)
- [ ] Can view dashboard
- [ ] Can see assigned issues
- [ ] Can view issue details
- [ ] Can respond to issues (if implemented)
- [ ] Can post updates
- [ ] Can view feedback received
- [ ] Can logout successfully

### Admin Features (Login as Admin)
- [ ] Can view admin dashboard
- [ ] Can see all users list (if page exists)
- [ ] Can see system statistics
- [ ] Can access user management (if implemented)
- [ ] Can view analytics (if implemented)
- [ ] Can logout successfully

### Moderator Features (Login as Moderator)
- [ ] Can view moderator dashboard
- [ ] Can access flagged content section (if any)
- [ ] Can view discussions
- [ ] Can logout successfully

---

## 🔗 API VERIFICATION CHECKLIST

### Authentication Endpoints
```bash
# Test login
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@citizenconnect.com","password":"admin123"}'
```
- [ ] Login returns token and user data
- [ ] Token is JWT format
- [ ] User info includes role

### User Endpoints
```bash
# Get all users (requires admin token)
curl -X GET http://localhost:8080/api/users \
  -H "Authorization: Bearer <TOKEN>"
```
- [ ] Returns list of users
- [ ] Each user has id, email, role, name
- [ ] Count matches database (9 users)

### Swagger UI
```bash
# Visit Swagger documentation
http://localhost:8080/swagger-ui.html
```
- [ ] Swagger UI loads
- [ ] All API endpoints listed
- [ ] Can expand each endpoint
- [ ] Can see request/response schemas
- [ ] Can try API calls directly

---

## 🎨 UI/UX VERIFICATION CHECKLIST

### Visual Elements
- [ ] Dark theme applied
- [ ] Colors consistent
- [ ] Navbar visible on all pages
- [ ] Sidebar/Menu working (if implemented)
- [ ] Buttons have hover effects
- [ ] Forms are properly styled
- [ ] Cards have proper spacing

### Responsive Design
- [ ] Layout works on desktop (1920x1080)
- [ ] Layout works on tablet (768x1024)
- [ ] Layout works on mobile (375x667)
- [ ] Navigation mobile-friendly

### Notifications & Feedback
- [ ] Success messages appear on login
- [ ] Error messages appear on form submission
- [ ] Toast notifications work
- [ ] Loading states visible
- [ ] Spinner shows during API calls

---

## 🆘 TROUBLESHOOTING VERIFICATION

### If Backend Won't Start
- [ ] Check Java version: `java -version`
- [ ] Check MySQL running: `mysql -u root -p`
- [ ] Check port 8080 free: `netstat -ano | findstr :8080`
- [ ] Check database exists: `mysql -e "SHOW DATABASES;"`
- [ ] Check application.yml syntax
- [ ] Review application logs for errors

### If Frontend Won't Start
- [ ] Check Node version: `node --version`
- [ ] Check npm installed: `npm --version`
- [ ] Check node_modules: `ls node_modules/ | head`
- [ ] Check vite: `npm list vite`
- [ ] Clear cache: `npm cache clean --force`
- [ ] Rebuild: `rm -rf node_modules && npm install`

### If Login Fails
- [ ] Check backend running
- [ ] Check database has users
- [ ] Check email exact match (case-sensitive)
- [ ] Check password correct
- [ ] Check user enabled in database
- [ ] Clear browser localStorage
- [ ] Check browser console for errors

---

## 📝 FINAL VERIFICATION

Before declaring done, verify:

- [ ] All prerequisites installed
- [ ] Backend builds successfully
- [ ] Frontend dependencies installed
- [ ] Database initialized with 9 users
- [ ] Backend starts without errors
- [ ] Frontend starts without errors
- [ ] Can access home page
- [ ] Can login with admin credentials
- [ ] Can see admin dashboard
- [ ] Can logout successfully
- [ ] Can login with citizen credentials
- [ ] Can see citizen dashboard
- [ ] Swagger UI accessible
- [ ] No console errors in browser
- [ ] No errors in backend logs
- [ ] All 4 roles can login successfully
- [ ] Database has all expected tables
- [ ] Sample data visible in database

---

## ✅ STATUS

When all checks are complete, your **CitizenConnect** application is:
- ✅ Fully installed
- ✅ Properly configured
- ✅ Successfully deployed locally
- ✅ Ready for testing
- ✅ Ready for demonstration

---

**Congratulations! Your application is complete and ready to use! 🎉**

