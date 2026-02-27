package com.example.ui.common;

import java.sql.Timestamp;

public record Member(Long id, String name, String email, String auth, String status, Timestamp createdAt) {
    
}