package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	private FavoriteBO favoriteBO;
	
	// http://localhost/lesson06/add_favorite_view
	// 즐겨찾기 추가하기 뷰 화면
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavoriteView";
	}
	
	//AJAX로 들어온 용청은 반드시 @ResponseBody가 붙어있어야 하고, String을 리턴해야 한다.
	// 즐겨찾기 데이터 추가 - AJAX로 들어오는 요청
	// {"name":"kyu" } => JSON String
	@ResponseBody
	@PostMapping("/add_favorite")
	public Map<String, Object> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			){
		// insert db
		favoriteBO.addFavorite(name, url);

		// 성공 여부를 map에 담는다.
		//{"result" : "success"}
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("result_code", 1);
		
		// return map
		return result;
	
	}
	
	
	// 즐겨찾기 목록 화면
	// http://localhost/lesson06/favorite_list
	@RequestMapping("/favorite_list")
	public String favoriteList(Model model) {
		// select db
		List<Favorite> favoriteList = new ArrayList<>();
		favoriteList = favoriteBO.getFavorite();
		
		model.addAttribute("favoriteList",favoriteList);
		
		return "/lesson06/favoriteList";
	}
	
	// url 중복 확인 -AJAX로 온 요청
	
	@ResponseBody
	@PostMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url")String url){
			
			//결과를 map -> JSON string
			Map<String, Boolean> result = new HashMap<>();
			result.put("is_duplication", false);
			
			// db select  -> 중복 확인
//			boolean isDuplication = favoriteBO.existFavoriteByUrl(url);
			Favorite favorite = favoriteBO.getFavoriteByUrl(url);
			if (favorite != null) {
				// 중복일 때
				result.put("is_duplication", true);
			}
			
			//return map
			return result;
			
	}
	
	//삭제 
	// http://localhost/lesson06/delete
	@PostMapping("/delete_favorite")
	@ResponseBody
	public Map<String, Object> deleteFavorite(
			@RequestParam("id")int id) {
		
		int deleteRow = favoriteBO.deleteFavoriteById(id);
		
		Map<String, Object> map = new HashMap<>();
		if(deleteRow > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		
		return map;
	}
}
