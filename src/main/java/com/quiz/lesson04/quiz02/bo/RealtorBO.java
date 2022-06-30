package com.quiz.lesson04.quiz02.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.quiz02.dao.RealtorDAO;
import com.quiz.lesson04.quiz02.model.Realtor;

@Service
public class RealtorBO {
	@Autowired
	private RealtorDAO realtorDAO;
	
	public void addRealtor(Realtor realtor) {
		realtorDAO.insertREaltor(realtor);
	}
	public Realtor getRealtor(int id) {
		return realtorDAO.selectRealtor(id);
		
	}
	
}
