package com.quiz.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.StoreBO;

@Controller
@RequestMapping("/lesson06")
public class StoreController {
	@Autowired
	private StoreBO storeBO;
	
	
	// http://localhost/lesson06/quiz_store_list
	@RequestMapping("/quiz_store_list")
	public String quiz_store_list(Model model) {
		
		
		model.addAttribute("storeList",storeBO.getStoreList());
		
		return "/lesson06/storeListView";
	}
	
	// http://localhost/lesson06/quiz_review_list
	@RequestMapping("quiz_review_list")
	public String quiz_review_list() {
		
			
		return "/lesson06/reviewListView";
	}
}
