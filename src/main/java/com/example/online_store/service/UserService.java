package com.example.online_store.service;

import com.example.online_store.entity.UserEntity;
import com.example.online_store.exception.UserAlreadyExistException;
import com.example.online_store.exception.UserNotFoundException;
import com.example.online_store.model.User;

import java.util.NoSuchElementException;

public interface UserService {
    public UserEntity addUser(UserEntity userEntity) throws UserAlreadyExistException;

    public User getUserByEmail(String email) throws UserNotFoundException;

    public String deleteUser(String string);

    public UserEntity updateUserData(UserEntity userEntity) throws UserNotFoundException;
}
