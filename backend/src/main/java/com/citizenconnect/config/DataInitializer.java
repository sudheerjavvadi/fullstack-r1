package com.citizenconnect.config;

import com.citizenconnect.entity.Role;
import com.citizenconnect.entity.User;
import com.citizenconnect.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Data Initializer - Seeds the database with sample users on application
 * startup
 */
@Configuration
public class DataInitializer {

    @Bean
    public CommandLineRunner initializeData(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            System.out.println("🔄 Initializing database with sample users...");

            // Always delete and recreate to ensure fresh data
            userRepository.deleteAll();
            System.out.println("📋 Cleared existing users...");

            // Create Admin User
            User admin = new User();
            admin.setFullName("Admin User");
            admin.setEmail("admin@citizenconnect.com");
            admin.setPassword(passwordEncoder.encode("admin123"));
            admin.setPhone("+91-9000000000");
            admin.setRole(Role.ADMIN);
            admin.setEnabled(true);
            userRepository.save(admin);
            System.out.println("✅ Created ADMIN: admin@citizenconnect.com");

            // Create Citizen Users
            User citizen1 = new User();
            citizen1.setFullName("Amit Kumar");
            citizen1.setEmail("amit.citizen@example.com");
            citizen1.setPassword(passwordEncoder.encode("citizen123"));
            citizen1.setPhone("+91-9876543210");
            citizen1.setConstituency("North Delhi");
            citizen1.setRole(Role.CITIZEN);
            citizen1.setEnabled(true);
            userRepository.save(citizen1);
            System.out.println("✅ Created CITIZEN: amit.citizen@example.com");

            User citizen2 = new User();
            citizen2.setFullName("Priya Singh");
            citizen2.setEmail("priya.citizen@example.com");
            citizen2.setPassword(passwordEncoder.encode("citizen123"));
            citizen2.setPhone("+91-9876543211");
            citizen2.setConstituency("South Delhi");
            citizen2.setRole(Role.CITIZEN);
            citizen2.setEnabled(true);
            userRepository.save(citizen2);
            System.out.println("✅ Created CITIZEN: priya.citizen@example.com");

            User citizen3 = new User();
            citizen3.setFullName("Rajesh Patel");
            citizen3.setEmail("rajesh.citizen@example.com");
            citizen3.setPassword(passwordEncoder.encode("citizen123"));
            citizen3.setPhone("+91-9876543212");
            citizen3.setConstituency("East Delhi");
            citizen3.setRole(Role.CITIZEN);
            citizen3.setEnabled(true);
            userRepository.save(citizen3);
            System.out.println("✅ Created CITIZEN: rajesh.citizen@example.com");

            // Create Politician Users
            User politician1 = new User();
            politician1.setFullName("Dr. Arvind Kejriwal");
            politician1.setEmail("arvind.politician@example.com");
            politician1.setPassword(passwordEncoder.encode("politician123"));
            politician1.setPhone("+91-9888000001");
            politician1.setConstituency("New Delhi");
            politician1.setRole(Role.POLITICIAN);
            politician1.setEnabled(true);
            userRepository.save(politician1);
            System.out.println("✅ Created POLITICIAN: arvind.politician@example.com");

            User politician2 = new User();
            politician2.setFullName("Amit Malviya");
            politician2.setEmail("amit.politician@example.com");
            politician2.setPassword(passwordEncoder.encode("politician123"));
            politician2.setPhone("+91-9888000002");
            politician2.setConstituency("North Delhi");
            politician2.setRole(Role.POLITICIAN);
            politician2.setEnabled(true);
            userRepository.save(politician2);
            System.out.println("✅ Created POLITICIAN: amit.politician@example.com");

            User politician3 = new User();
            politician3.setFullName("Sonia Gandhi");
            politician3.setEmail("sonia.politician@example.com");
            politician3.setPassword(passwordEncoder.encode("politician123"));
            politician3.setPhone("+91-9888000003");
            politician3.setConstituency("Indira Nagar");
            politician3.setRole(Role.POLITICIAN);
            politician3.setEnabled(true);
            userRepository.save(politician3);
            System.out.println("✅ Created POLITICIAN: sonia.politician@example.com");

            // Create Moderator Users
            User moderator1 = new User();
            moderator1.setFullName("Rahul Sharma");
            moderator1.setEmail("rahul.moderator@example.com");
            moderator1.setPassword(passwordEncoder.encode("moderator123"));
            moderator1.setPhone("+91-9777000001");
            moderator1.setRole(Role.MODERATOR);
            moderator1.setEnabled(true);
            userRepository.save(moderator1);
            System.out.println("✅ Created MODERATOR: rahul.moderator@example.com");

            User moderator2 = new User();
            moderator2.setFullName("Anjali Verma");
            moderator2.setEmail("anjali.moderator@example.com");
            moderator2.setPassword(passwordEncoder.encode("moderator123"));
            moderator2.setPhone("+91-9777000002");
            moderator2.setRole(Role.MODERATOR);
            moderator2.setEnabled(true);
            userRepository.save(moderator2);
            System.out.println("✅ Created MODERATOR: anjali.moderator@example.com");

            System.out.println("\n✅ Database initialization completed!");
            System.out.println("📊 Total users created: " + userRepository.count());
        };
    }
}
