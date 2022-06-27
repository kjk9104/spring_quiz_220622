package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	
	public RealEstate selectRealEstate(@Param("renrPrice")int renrPrice);
	
	public List<RealEstate> selectRealEstateListByAreaAndPrice(
			@Param("area")int area,  //=> @Param => 파라미터들을 map으로 만든다
			@Param("price")int price);
	
	public int insertRealEstate(RealEstate realEstate);
	public int insertRealEstateField(
			@Param("realtorId") int realtorId,
			@Param("address") String address ,
			@Param("area") int area , 
			@Param("type") String type ,
			@Param("price") int price , 
			@Param("rentPrice") Integer rentPrice
			);
	
}

	
