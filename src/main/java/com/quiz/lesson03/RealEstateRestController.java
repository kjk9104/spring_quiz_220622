package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class RealEstateRestController {
	@Autowired 
	private RealEstateBO realEstateBO;
	
	//http://localhost/lesson03/quiz01/1
	//http://localhost/lesson03/quiz01/1?id=3
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01 (
			@RequestParam(value="id") int id) {
		System.out.println("###### id : "+id);
		return realEstateBO.getRealEstate(id);
	}
}
