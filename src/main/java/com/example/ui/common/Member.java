package com.example.ui.common;

import java.io.Serializable;
import java.time.LocalDateTime;

public record Member(
        Long id,
        String name,
        String email,
        String auth,
        String status,
        LocalDateTime createdAt) implements Serializable {

    public static Member of(Long id, String name, String email, String auth) {
        return new Member(id, name, email, auth, "Acitve", LocalDateTime.now());
    }

    public Member withName(String newName) {
        return new Member(this.id, newName, this.email, this.auth, this.status, this.createdAt);
    }
}
