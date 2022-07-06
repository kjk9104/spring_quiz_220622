package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

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
		
		favoriteBO.addFavorite(name, url);
		return "입력 성공";
		
	}
	
	// http://localhost/lesson06/favorite_list
	@RequestMapping("/favorite_list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = new ArrayList<>();
		favoriteList = favoriteBO.getFavorite();
		
		model.addAttribute("favoriteList",favoriteList);
		
		return "/lesson06/favoriteList";
	}
}
