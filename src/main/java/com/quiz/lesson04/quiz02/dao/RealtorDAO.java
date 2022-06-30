package com.quiz.lesson04.quiz02.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.quiz02.model.Realtor;

@Repository
public interface RealtorDAO {

	public void insertREaltor(Realtor realtor);
	
	public Realtor selectRealtor(int id);
}
