package com.jacksonsexchangeagency.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtil {
    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    // Hashes the password
    public static String hashPassword(String plainPassword) {
        return encoder.encode(plainPassword);
    }

    // Verifies the password
    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        return encoder.matches(plainPassword, hashedPassword);
    }
}
