package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// http://localhost/lesson04/add_seller
		@RequestMapping(path = "/add_seller", method =RequestMethod.GET)
		public String addSeller(
				@RequestParam("nickname") String nickname,
				@RequestParam(value = "profileImageUrl", required=false) String profileImageUrl,
				@RequestParam("temperature") double temperature
				) {
			Seller seller = new Seller();
			seller.setNickname(nickname);
			seller.setProfileImageUrl(profileImageUrl);
			seller.setTemperature(temperature);
			
			return "lesson04/add_seller";
		}

}
