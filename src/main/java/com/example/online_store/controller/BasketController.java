package com.example.online_store.controller;

import com.example.online_store.entity.BasketEntity;
import com.example.online_store.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/basket")
public class BasketController {
    @Autowired
    private BasketService basketService;
    @PostMapping
    public ResponseEntity createBasket(@RequestBody BasketEntity basketEntity,
                                       @RequestParam Long userId) {
        try {
            return ResponseEntity.ok(basketService.creatBasket(basketEntity, userId));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }
}
