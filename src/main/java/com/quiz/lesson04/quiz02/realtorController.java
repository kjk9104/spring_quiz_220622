package com.quiz.lesson04.quiz02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.quiz02.bo.RealtorBO;
import com.quiz.lesson04.quiz02.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class realtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	// http://localhost/lesson04/quiz02/1
	
	@GetMapping("/1")
	public String addRealtorView() {
		return "/lesson04/addRealtorView";
	}
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String add_realtor(
			@ModelAttribute Realtor realtor,
			Model model
			) {
		realtorBO.addRealtor(realtor);
		realtor = realtorBO.getRealtor(realtor.getId());
		
		model.addAttribute("realtor", realtor);
		model.addAttribute("subject","공인중개사 정보");
		
		return "lesson04/afterRealtorView";
	}
	
}
