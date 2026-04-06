# 🏛️ CitizenConnect - Civic Engagement Platform

## Complete Setup & Configuration Guide

A full-stack web application for citizen-politician interaction, enabling citizens to report issues, politicians to respond, and admins to manage the system.

---

## 📋 TABLE OF CONTENTS

1. [Project Overview](#project-overview)
2. [Technology Stack](#technology-stack)
3. [Database Setup](#database-setup)
4. [Backend Setup](#backend-setup)
5. [Frontend Setup](#frontend-setup)
6. [Test Users & Credentials](#test-users--credentials)
7. [API Endpoints](#api-endpoints)
8. [Running the Application](#running-the-application)
9. [Features by Role](#features-by-role)
10. [Troubleshooting](#troubleshooting)

---

## 🎯 Project Overview

**CitizenConnect** is a platform that facilitates:
- Citizens to report infrastructure issues and problems
- Politicians to respond and update on resolutions
- Admin to manage users and monitor platform activities
- Moderators to maintain community discussions

### Multi-Role System
- **👤 CITIZEN** - Report issues, track status, give feedback
- **🏛️ POLITICIAN** - Respond to issues, post updates, engage citizens
- **👑 ADMIN** - Manage users, view analytics, control platform
- **🛡️ MODERATOR** - Monitor discussions, handle flagged content

---

## 🛠️ Technology Stack

### Backend
- **Framework**: Spring Boot 3.2.1
- **Language**: Java 17
- **Security**: JWT, Spring Security
- **Database**: MySQL 8.0+
- **Build Tool**: Maven
- **API Documentation**: Springdoc OpenAPI (Swagger UI)

### Frontend
- **Framework**: React 18.2
- **Build Tool**: Vite 5.0
- **Styling**: Tailwind CSS
- **State Management**: Redux Toolkit
- **HTTP Client**: Axios
- **Icons**: React Icons
- **Notifications**: React Toastify

### Database
- **MySQL** 8.0+
- **Database Name**: `frontend`

---

## 🔧 DATABASE SETUP

### Prerequisites
- MySQL Server 8.0 or higher installed
- MySQL Client or GUI (MySQL Workbench, DataGrip, etc.)

### Step 1: Create Database
```sql
CREATE DATABASE IF NOT EXISTS frontend;
USE frontend;
```

### Step 2: Initialize with Sample Data

Run the SQL initialization script located at:
```
backend/database-init.sql
```

**Option A: Using MySQL CLI**
```bash
mysql -u root -p frontend < database-init.sql
```

**Option B: Using MySQL Workbench**
1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open the `database-init.sql` file
4. Execute it

### Step 3: Verify Database
After running the script, verify the data:
```sql
SELECT * FROM users;           -- See all users
SELECT * FROM issues;          -- See all issues
SELECT * FROM updates;         -- See all updates
SELECT * FROM feedback;        -- See all feedback
```

---

## 🚀 BACKEND SETUP

### Prerequisites
- Java 17 or higher
- Maven 3.9.0+

### Step 1: Navigate to Backend
```bash
cd backend
```

### Step 2: Configure Application Properties
Edit `src/main/resources/application.yml`:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/frontend?createDatabaseIfNotExist=true
    username: root                    # Change if different
    password: your_mysql_password    # Change to your MySQL password
    driver-class-name: com.mysql.cj.jdbc.Driver
  
  jpa:
    hibernate:
      ddl-auto: update              # Creates tables automatically
```

### Step 3: Build the Backend
```bash
./mvnw clean package -DskipTests
```

Or if using Maven directly:
```bash
mvn clean package -DskipTests
```

### Step 4: Run the Backend
```bash
./mvnw spring-boot:run
```

Or:
```bash
java -jar target/citizen-connect-backend-1.0.0.jar
```

**Backend will start on**: `http://localhost:8080`

### Step 5: Access API Documentation
- **Swagger UI**: `http://localhost:8080/swagger-ui.html`
- **API Docs**: `http://localhost:8080/v3/api-docs`

---

## 💻 FRONTEND SETUP

### Prerequisites
- Node.js 18+ and npm

### Step 1: Navigate to Frontend
```bash
cd frontend
```

### Step 2: Install Dependencies
```bash
npm install
```

### Step 3: Configure API URL
Create a `.env.local` file (if needed):
```
VITE_API_URL=http://localhost:8080/api
```

Or add to `vite.config.js`:
```javascript
server: {
  proxy: {
    '/api': {
      target: 'http://localhost:8080',
      changeOrigin: true
    }
  }
}
```

### Step 4: Start Development Server
```bash
npm run dev
```

**Frontend will start on**: `http://localhost:5173`

### Step 5: Build for Production
```bash
npm run build
```

---

## 👥 TEST USERS & CREDENTIALS

### Important: All Test Passwords (plain text)
- **Citizens**: `citizen123`
- **Politicians**: `politician123`
- **Moderator**: `moderator123`
- **Admin**: `admin123`

> **Note**: These are just for testing. In production, use strong passwords!

### 👑 ADMIN PORTAL
- **Email**: `admin@citizenconnect.com`
- **Password**: `admin123`
- **Capabilities**: Manage users, view analytics, control system

### 👤 CITIZEN PORTAL
| Email | Password | Constituency |
|-------|----------|--------------|
| amit.citizen@example.com | citizen123 | North Delhi |
| priya.citizen@example.com | citizen123 | South Delhi |
| rajesh.citizen@example.com | citizen123 | East Delhi |

**Capabilities**: Report issues, track status, give feedback

### 🏛️ POLITICIAN PORTAL
| Email | Password | Constituency |
|-------|----------|--------------|
| arvind.politician@example.com | politician123 | New Delhi |
| amit.politician@example.com | politician123 | North Delhi |
| sonia.politician@example.com | politician123 | Indira Nagar |

**Capabilities**: Respond to issues, post updates, engage citizens

### 🛡️ MODERATOR PORTAL
| Email | Password |
|-------|----------|
| rahul.moderator@example.com | moderator123 |
| anjali.moderator@example.com | moderator123 |

**Capabilities**: Monitor discussions, handle flagged content

---

## 📡 API ENDPOINTS

### Authentication
```
POST   /api/auth/login              - Login user
POST   /api/auth/register           - Register citizen
POST   /api/auth/register/admin     - Register with role (Admin only)
GET    /api/auth/me                 - Get current user
```

### Users
```
GET    /api/users                   - Get all users (Admin)
GET    /api/users/{id}              - Get user by ID
GET    /api/users/role/{role}       - Get users by role
GET    /api/users/politicians       - Get all politicians
PUT    /api/users/{id}              - Update user profile
PUT    /api/users/{id}/role         - Update user role (Admin)
```

### Issues
```
GET    /api/issues                  - Get all issues
GET    /api/issues/my-issues        - Get my issues (Citizen)
GET    /api/issues/assigned         - Get assigned issues (Politician)
POST   /api/issues                  - Create new issue (Citizen)
GET    /api/issues/{id}             - Get issue details
PUT    /api/issues/{id}/assign      - Assign to politician
PUT    /api/issues/{id}/respond     - Respond to issue (Politician)
PUT    /api/issues/{id}/status      - Update issue status
```

### Updates
```
GET    /api/updates                 - Get all updates
POST   /api/updates                 - Create update (Politician)
GET    /api/updates/my-updates      - Get my updates (Politician)
GET    /api/updates/{id}            - Get update details
```

### Feedback
```
POST   /api/feedback                - Submit feedback
GET    /api/feedback/received       - Get received feedback (Politician)
GET    /api/feedback/my-feedback    - Get given feedback (Citizen)
GET    /api/feedback/politician/{id}/stats - Get politician stats
```

### Comments
```
GET    /api/comments/issue/{id}     - Get issue comments
POST   /api/comments/issue/{id}     - Add comment
GET    /api/comments/flagged        - Get flagged comments (Moderator)
PUT    /api/comments/{id}/flag      - Flag comment
```

---

## ▶️ RUNNING THE APPLICATION

### Complete Startup Sequence

**Terminal 1 - Backend:**
```bash
cd backend
./mvnw spring-boot:run
# Wait for: "Tomcat started on port(s): 8080"
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
# Wait for: "http://localhost:5173/"
```

### Access the Application
Open your browser and go to:
- **Frontend**: `http://localhost:5173`
- **Backend API**: `http://localhost:8080/api`
- **Swagger Docs**: `http://localhost:8080/swagger-ui.html`

---

## 🎭 FEATURES BY ROLE

### 👤 CITIZEN PORTAL
✅ Register / Login  
✅ Report Issues (with image upload & location)  
✅ Track Issue Status (Open → In Progress → Resolved)  
✅ View Politician Responses  
✅ Give Feedback to Politicians  
✅ View Public Updates from Politicians  
✅ Discussions & Comments  
✅ My Dashboard with Statistics  

### 🏛️ POLITICIAN PORTAL
✅ Login  
✅ View Assigned Issues by Constituency  
✅ Respond to Citizen Issues  
✅ Post Updates & Announcements  
✅ Track Resolution Progress  
✅ View Feedback & Ratings  
✅ Statistics Dashboard  

### 👑 ADMIN PORTAL
✅ User Management (Add/Remove/Assign Roles)  
✅ View All Users & Roles  
✅ System Statistics & Analytics  
✅ Issue Monitoring & Control  
✅ Settings & Configuration  
✅ Report Generation  

### 🛡️ MODERATOR PORTAL
✅ Monitor Discussions  
✅ View Flagged Comments  
✅ Resolve Conflicts  
✅ Issue Warnings  
✅ Remove Inappropriate Content  
✅ Activity Tracking  

---

## 🆘 TROUBLESHOOTING

### Backend Issues

**1. Port 8080 already in use**
```bash
# Kill process using port 8080
# On Windows:
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# On Mac/Linux:
lsof -ti:8080 | xargs kill -9
```

**2. Database connection error**
- Check MySQL is running
- Verify username/password in `application.yml`
- Ensure database `frontend` exists
- Run: `mysql -u root -p -e "SHOW DATABASES;"`

**3. Build fails**
```bash
# Clean and rebuild
./mvnw clean install -DskipTests
```

### Frontend Issues

**1. Port 5173 already in use**
```bash
npm run dev -- --port 3000
```

**2. CORS errors**
- Ensure backend is running on port 8080
- Check API URL configuration in `.env`

**3. Dependencies not installing**
```bash
rm -rf node_modules package-lock.json
npm install
```

### Login Issues

**1. Invalid credentials**
- Verify user exists in database
- Check password (case-sensitive)
- Ensure user is enabled (`enabled = true`)

**2. Token expired**
- Clear browser localStorage:  
  `localStorage.clear()`
- Login again

**3. CORS during login**
- Backend must be running
- Check `SecurityConfig.java` CORS setup

---

## 📊 DATABASE SCHEMA

### Users Table
```
id          - Primary Key
full_name   - User Full Name
email       - Email (Unique)
password    - Hashed Password
phone       - Phone Number
constituency - Constituency (for Politicians)
role        - ADMIN, CITIZEN, POLITICIAN, MODERATOR
enabled     - Account Status
created_at  - Creation Timestamp
updated_at  - Last Update Timestamp
```

### Issues Table
```
id                  - Primary Key
title               - Issue Title
description         - Description
category            - Category
location            - Location
status              - OPEN, IN_PROGRESS, RESOLVED
citizen_id          - Foreign Key to Citizen
assigned_politician_id - Foreign Key to Politician
created_at          - Creation Timestamp
updated_at          - Last Update Timestamp
```

### Updates Table
```
id          - Primary Key
title       - Update Title
description - Description
politician_id - Foreign Key to Politician
created_at  - Creation Timestamp
```

---

## 📞 SUPPORT

For issues or questions:
1. Check the troubleshooting section
2. Review logs:
   - Backend: `target/logs/`
   - Frontend: Browser console (F12)
3. Check database:
   - Run verification queries
   - Use MySQL Workbench

---

## ✅ VERIFICATION CHECKLIST

- [ ] MySQL is running
- [ ] Database `frontend` created
- [ ] `database-init.sql` executed
- [ ] Backend running on `localhost:8080`
- [ ] Frontend running on `localhost:5173`
- [ ] Can access Swagger UI at `localhost:8080/swagger-ui.html`
- [ ] Can login with test credentials
- [ ] Can see users in database
- [ ] Can create issues (as Citizen)
- [ ] Can respond to issues (as Politician)
- [ ] Admin can view all users

---

**Happy Coding! 🚀**

