package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area, int price){
		return null;
		
	}
	
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	public int addrealEstateField(int realtorId,String address , int area , String type ,
			int price , Integer rentPrice) {
		return realEstateDAO.insertRealEstateField(realtorId,address,area,type,price,rentPrice);
	}
}
