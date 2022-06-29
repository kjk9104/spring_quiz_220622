package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04")
@Controller
public class SellerController {
	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost/lesson04/sign_up_view
	@RequestMapping(path ="/sign_up_view",  method = RequestMethod.GET)
	public String signUpView() {
		return "lesson04/seller_view"; //view 경로 => jsp
		
	}
	
	// http://localhost/lesson04/add_seller

	@PostMapping("/add_seller")
	public String addSeller(@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		Seller seller = new Seller();
		seller.setNickname(nickname);
		seller.setProfileImageUrl(profileImageUrl);
		seller.setTemperature(temperature);
		sellerBO.addSeller(seller);
		
		return "lesson04/after_add_seller";
	}
	
	// http://localhost/lesson04/seller_info
	//http://localhost/lesson04/seller_info?id=1
	@RequestMapping("/seller_info")
	public String sellerInfor(
			@RequestParam(value="id", required = false) Integer id,
			Model model
			 ) {
		Seller seller = null;
		
		if (id == null) {
			 seller = sellerBO.getLastSeller();
		}else {
			 seller = sellerBO.getSellerById(id);
		}
		model.addAttribute("seller", seller);
		
		return "lesson04/seller_info";
	}
	
	

}
