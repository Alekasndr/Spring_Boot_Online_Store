package com.example.online_store.service;

import com.example.online_store.entity.BasketEntity;
import com.example.online_store.entity.UserEntity;
import com.example.online_store.repository.BasketRepo;
import com.example.online_store.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BasketServiceImpl implements BasketService {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private BasketRepo basketRepo;

    @Override
    public BasketEntity creatBasket(BasketEntity basketEntity, Long userId) {
        UserEntity user = userRepo.findById(userId).get();
        basketEntity.setUserEntity(user);
        return basketRepo.save(basketEntity);
    }
}
