package com.example.online_store.controller;

import com.example.online_store.entity.UserEntity;
import com.example.online_store.exception.UserAlreadyExistException;
import com.example.online_store.exception.UserNotFoundException;
import com.example.online_store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public ResponseEntity getUser(@RequestParam String email) {
        try {
            return ResponseEntity.ok(userService.getUserByEmail(email));
        } catch (UserNotFoundException e) {
            return ResponseEntity.badRequest().body("User not found");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }

    @PostMapping("/save")
    public ResponseEntity saveUser(@RequestBody UserEntity user) {
        try {
            userService.addUser(user);
            return ResponseEntity.ok("Saved");
        } catch (UserAlreadyExistException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }

    @DeleteMapping("/delete")
    public ResponseEntity deleteUser(@RequestParam String string) {
        try {
            return ResponseEntity.ok(userService.deleteUser(string));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }
}
