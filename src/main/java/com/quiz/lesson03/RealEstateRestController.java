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
	
	//http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public RealEstate quiz02 (
			@RequestParam(value="price") int renrPrice) {
		System.out.println("###### price : "+renrPrice);
		return realEstateBO.getRealEstate(renrPrice);
	}
	
//	//http://localhost/lesson03/quiz01/3?area=90&price=130000
//	@RequestMapping("/lesson03/quiz01/3")
//	public RealEstate quiz03 (
//			@RequestParam("area") int area) 
//			@RequestParam("price") int price) {
//		System.out.println("###### price : "+renrPrice);
//		return realEstateBO.getRealEstate(renrPrice);
//	}
//			
	//http://localhost/lesson03/quiz02/1
	@RequestMapping("/lesson03/quiz02/1")
	public String quiz02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		int row = realEstateBO.addRealEstate(realEstate);
		return row > 0 ? row + "성공" : "실패";
	}
	
	// http://localhost/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/lesson03/quiz02/2")
	public String quiz02_2(@RequestParam("realtor_id") int realtorId) {
		int row = realEstateBO.addrealEstateField(5,"썅떼빌리버 오피스텔 814호",45,"월세",  100000, 120);
		return "입력 성공"+row;
	}
}
