-- ============================================================================
-- CitizenConnect Database Initialization Script
-- ============================================================================
-- Run this SQL in your MySQL database to initialize with sample users

-- Create Database (if not exists)
-- CREATE DATABASE IF NOT EXISTS frontend;
-- USE frontend;

-- ============================================================================
-- USERS TABLE - All Portals Users
-- ============================================================================

INSERT INTO users (full_name, email, password, phone, constituency, role, enabled, created_at, updated_at)
VALUES 
-- ADMIN User
('Admin User', 'admin@citizenconnect.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9000000000', NULL, 'ADMIN', true, NOW(), NOW()),

-- CITIZEN Users
('Amit Kumar', 'amit.citizen@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9876543210', 'North Delhi', 'CITIZEN', true, NOW(), NOW()),
('Priya Singh', 'priya.citizen@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9876543211', 'South Delhi', 'CITIZEN', true, NOW(), NOW()),
('Rajesh Patel', 'rajesh.citizen@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9876543212', 'East Delhi', 'CITIZEN', true, NOW(), NOW()),

-- POLITICIAN Users
('Dr. Arvind Kejriwal', 'arvind.politician@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9888000001', 'New Delhi', 'POLITICIAN', true, NOW(), NOW()),
('Amit Malviya', 'amit.politician@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9888000002', 'North Delhi', 'POLITICIAN', true, NOW(), NOW()),
('Sonia Gandhi', 'sonia.politician@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9888000003', 'Indira Nagar', 'POLITICIAN', true, NOW(), NOW()),

-- MODERATOR Users
('Rahul Sharma', 'rahul.moderator@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9777000001', NULL, 'MODERATOR', true, NOW(), NOW()),
('Anjali Verma', 'anjali.moderator@example.com', '$2a$10$slYQmyNdGzIn9KqvoN0jJ.vK1QvxJ8Q9dD5qF5vJ5tLxJ5vJ5tLx', '+91-9777000002', NULL, 'MODERATOR', true, NOW(), NOW());

-- ============================================================================
-- SAMPLE ISSUES (Reported by Citizens)
-- ============================================================================

INSERT INTO issues (title, description, category, location, image_url, status, citizen_id, assigned_politician_id, created_at, updated_at)
VALUES 
('Road Damaged in Sector 5', 'Multiple potholes on Main Street affecting traffic flow and causing accidents', 'Infrastructure', 'Sector 5, North Delhi', NULL, 'OPEN', 2, NULL, NOW(), NOW()),
('Street Light Not Working', 'Street light near market is not functioning creating security concerns', 'Public Safety', 'Market Area, South Delhi', NULL, 'IN_PROGRESS', 3, 6, NOW(), NOW()),
('Water Supply Issue', 'No water supply in the area for last 3 days affecting residents', 'Utilities', 'East Delhi', NULL, 'OPEN', 4, NULL, NOW(), NOW()),
('Inefficient Waste Management', 'Garbage is not being collected regularly in the colony', 'Sanitation', 'North Delhi', NULL, 'RESOLVED', 2, 5, NOW(), NOW()),
('Public Park Renovation Needed', 'Park needs maintenance and new equipment for children', 'Recreation', 'Subhash Park, New Delhi', NULL, 'IN_PROGRESS', 3, 7, NOW(), NOW());

-- ============================================================================
-- SAMPLE UPDATES (Posted by Politicians)
-- ============================================================================

INSERT INTO updates (title, description, category, politician_id, created_at, updated_at)
VALUES 
('Infrastructure Development Initiative', 'We are launching a comprehensive infrastructure development program focus on road maintenance and public utilities across all constituencies.', 'Announcement', 5, NOW(), NOW()),
('Welfare Scheme for Senior Citizens', 'New welfare scheme introduced for senior citizens including health insurance and pension benefits', 'Welfare', 7, NOW(), NOW()),
('Community Development Project', 'Starting a community development initiative to build better public spaces and recreational areas', 'Development', 6, NOW(), NOW()),
('Public Health Campaign', 'Launching a public health awareness campaign focusing on hygiene and sanitation', 'Health', 5, NOW(), NOW());

-- ============================================================================
-- SAMPLE FEEDBACK
-- ============================================================================

INSERT INTO feedback (title, description, rating, citizen_id, politician_id, created_at, updated_at)
VALUES 
('Great Response to Water Issue', 'The politician responded quickly to my water supply complaint. Issue was resolved within a week. Excellent service!', 5, 3, 6, NOW(), NOW()),
('Poor Communication', 'Submitted a complaint about street lights but received no followup or communication for 2 months.', 2, 4, NULL, NOW(), NOW()),
('Helpful and Cooperative', 'Politician was very helpful and cooperative in resolving my road damage complaint. Recommended!', 5, 2, 5, NOW(), NOW());

-- ============================================================================
-- VIEW: Verify Data
-- ============================================================================

SELECT '==== USERS IN SYSTEM ====' AS info;
SELECT id, full_name, email, phone, role, constituency, enabled FROM users ORDER BY role, id;

SELECT '' AS '';
SELECT '==== USER STATISTICS ====' AS info;
SELECT role, COUNT(*) as count FROM users GROUP BY role;

SELECT '' AS '';
SELECT '==== ISSUES REPORTED ====' AS info;
SELECT id, title, status, category, citizen_id, assigned_politician_id FROM issues ORDER BY created_at DESC;

SELECT '' AS '';
SELECT '==== UPDATES POSTED ====' AS info;
SELECT id, title, category, politician_id FROM updates ORDER BY created_at DESC;

SELECT '' AS '';
SELECT '==== FEEDBACK GIVEN ====' AS info;
SELECT id, title, rating, citizen_id, politician_id FROM feedback ORDER BY created_at DESC;

-- ============================================================================
-- TEST LOGIN CREDENTIALS
-- ============================================================================
-- Password for all users: citizen123 (plain text - use in login)
-- Note: Actual stored passwords are bcrypt hashed

-- ADMIN PORTAL
-- Email: admin@citizenconnect.com | Password: admin123

-- CITIZEN PORTAL
-- Email: amit.citizen@example.com | Password: citizen123
-- Email: priya.citizen@example.com | Password: citizen123
-- Email: rajesh.citizen@example.com | Password: citizen123

-- POLITICIAN PORTAL
-- Email: arvind.politician@example.com | Password: politician123
-- Email: amit.politician@example.com | Password: politician123
-- Email: sonia.politician@example.com | Password: politician123

-- MODERATOR PORTAL
-- Email: rahul.moderator@example.com | Password: moderator123
-- Email: anjali.moderator@example.com | Password: moderator123

-- ============================================================================
