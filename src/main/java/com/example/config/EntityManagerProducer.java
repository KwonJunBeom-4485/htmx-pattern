package com.example.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@ApplicationScoped
public class EntityManagerProducer {
    // persistence.mxl에 정의한 내용을 등록 시켜주는 역할을 함.
    @PersistenceContext(unitName = "myPU")
    private EntityManager em;

    @Produces
    @ApplicationScoped
    public EntityManager produceEntityManager() {
        return em;
    }
}
