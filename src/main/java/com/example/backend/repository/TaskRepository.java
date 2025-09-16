package com.example.backend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.backend.model.Task;

public interface TaskRepository extends MongoRepository<Task, String> {
    List<Task> findByStatus(String status);
}
