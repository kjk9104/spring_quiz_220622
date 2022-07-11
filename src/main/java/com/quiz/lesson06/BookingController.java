package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
@RequestMapping("/lesson06")
public class BookingController {
	@Autowired
	private BookingBO bookingBO;
	
	
	// http://localhost/lesson06/booking_list
	@RequestMapping("/booking_list")
	public String booking_list(Model model) {
		
		List<Booking> bookinglist = bookingBO.getBookingList();
		
		model.addAttribute("bookinglist",bookinglist);
		
		return "/lesson06/bookingListView";
	}
	
}
