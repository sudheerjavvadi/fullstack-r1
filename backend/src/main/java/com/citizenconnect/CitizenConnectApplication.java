package com.citizenconnect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class CitizenConnectApplication {

    public static void main(String[] args) {
        SpringApplication.run(CitizenConnectApplication.class, args);
    }
}
