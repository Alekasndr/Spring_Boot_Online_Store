package com.example.online_store.service;

import com.example.online_store.entity.UserEntity;
import com.example.online_store.exception.UserAlreadyExistException;
import com.example.online_store.model.User;

import java.util.NoSuchElementException;

public interface UserService {
    public UserEntity registration(UserEntity userEntity) throws UserAlreadyExistException;

    public User getUser(Long id) throws NoSuchElementException;

    public Long delete(Long id);
}
