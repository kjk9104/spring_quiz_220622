package com.quiz.lesson04.bo;

import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;
@Service
public class SellerBO {
	private SellerDAO sellerDAO;
	public int addSeller(Seller seller) {
		return sellerDAO.insertSeller(seller);
	}
	
}
