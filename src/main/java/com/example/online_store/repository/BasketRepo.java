package com.example.online_store.repository;

import com.example.online_store.entity.BasketEntity;
import org.springframework.data.repository.CrudRepository;

public interface BasketRepo extends CrudRepository<BasketEntity, Long> {
}
