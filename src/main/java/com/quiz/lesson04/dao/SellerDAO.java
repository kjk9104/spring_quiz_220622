package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	
	public int insertSeller(Seller seller);
	
	public Seller selectSeller();
	
	public Seller selectSellerById(int id);
}
