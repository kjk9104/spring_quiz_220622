package com.quiz.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;

@RequestMapping("/lesson06")
@Controller
public class FavoriteController {
	@Autowired
	FavoriteBO favoriteBO;
	
	// http://localhost/lesson06/add_favorite_view
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavoriteView";
	}
	
	@ResponseBody
	@PostMapping("/add_favorite")
	public String addFavorite(
			@RequestParam("name")String name,
			@RequestParam("url")String url
			) {
		
		
		favoriteBO.addFavorit(name, url);
		return "입력 성공";
		
	}
}
