package com.example.online_store.service;

import com.example.online_store.entity.UserEntity;
import com.example.online_store.exception.UserAlreadyExistException;
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
    public UserEntity registration(UserEntity user) throws UserAlreadyExistException {
        if (userRepo.findByEmail(user.getEmail()) != null) {
            throw new UserAlreadyExistException("User already exist");
        }
        return userRepo.save(user);
    }

    @Override
    public User getUser(Long id) throws NoSuchElementException {
        UserEntity userEntity = userRepo.findById(id).get();
        return User.getModel(userEntity);
    }

    @Override
    public Long delete(Long id) {
        userRepo.deleteById(id);
        return id;
    }
}
