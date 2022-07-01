package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/lesson05")
@Controller
public class Lesson05Controller {
	
	// http://localhost/lesson05/quiz01
	@RequestMapping("/quiz01")
	public String quiz01() {
		return "/lesson05/quiz01View";
	}
	
	@RequestMapping("lesson05/ex02")
	public String ex02() {
		return "";
	}
}
