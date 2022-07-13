package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson06.bo.NewReviewBO;
import com.quiz.lesson06.model.NewReview;

@Controller
@RequestMapping("/lesson06")
public class ReviewController {
	@Autowired
	private NewReviewBO newReviewBO;
	private StoreBO storeBO;
	
	// http://localhost/lesson06/quiz_review_list
	// http://localhost/lesson06/quiz_review_list?storeId=1
		@RequestMapping("quiz_review_list")
		public String quiz_review_list(
				@RequestParam("storeId") int storeId
				,Model model
				) {
			
				List<NewReview> reviewList = newReviewBO.getNewReviewByStoreId(storeId);
				String storeName = storeBO.getStoreById(storeId);
				
				model.addAttribute("storeName",storeName);
				
				if(reviewList == null) {
					model.addAttribute("reviewList", "");
				}else{
					model.addAttribute("reviewList", reviewList);
				}
				
				
			return "/lesson06/reviewListView";
		}
	
}
