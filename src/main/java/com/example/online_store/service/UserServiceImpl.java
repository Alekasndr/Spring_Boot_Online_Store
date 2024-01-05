package com.example.online_store.service;

import com.example.online_store.entity.UserEntity;
import com.example.online_store.exception.UserAlreadyExistException;
import com.example.online_store.exception.UserNotFoundException;
import com.example.online_store.model.User;
import com.example.online_store.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepo userRepo;

    @Override
    public UserEntity addUser(UserEntity user) throws UserAlreadyExistException {
        if (userRepo.findByEmail(user.getEmail()) != null) {
            throw new UserAlreadyExistException("User already exist");
        }
        return userRepo.save(user);
    }

    @Override
    public User getUserByEmail(String email) throws UserNotFoundException {
        UserEntity userEntity = userRepo.findByEmail(email);
        if (userEntity == null) {
            throw new UserNotFoundException("User not found");
        }
        return User.getModel(userEntity);
    }

    @Override
    public String deleteUser(String email) {
        userRepo.deleteByEmail(email);
        return email;
    }

    @Override
    public UserEntity updateUserData(UserEntity user) throws UserNotFoundException {
        if (userRepo.findByEmail(user.getEmail()) == null) {
            throw new UserNotFoundException("User not found");
        }
        return userRepo.save(user);
    }
}
