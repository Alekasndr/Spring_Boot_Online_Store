package com.example.online_store.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    @GetMapping("/")
    public ResponseEntity getUsers(){
        try{
            return ResponseEntity.ok("All good");
        }
        catch (Exception e){
            return ResponseEntity.badRequest().body("Error");
        }
    }
}
