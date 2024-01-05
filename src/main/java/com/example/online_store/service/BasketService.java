package com.example.online_store.service;

import com.example.online_store.entity.BasketEntity;

public interface BasketService {
    public BasketEntity creatBasket(BasketEntity basketEntity, Long userId);
}
