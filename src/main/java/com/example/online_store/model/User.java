package com.example.online_store.model;

import com.example.online_store.entity.UserEntity;

public class User {
    private int id;
    private String email;

    public static User getModel(UserEntity entity) {
        return new User(entity.getId(), entity.getEmail());
    }

    public User() {
    }

    public User(int id, String email) {
        this.id = id;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
