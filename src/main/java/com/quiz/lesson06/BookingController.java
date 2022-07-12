package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	// POST / GET / PUT DELETE RESTFUL API
	// AJAX 통신
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id){
		
		//db delete
		int deleteRow = bookingBO.delBookByPhoneNumber(id);
		Map<String, Object> map = new HashMap<>();
		if(deleteRow > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		
		//성공 여부 map-> json
		return map;
	}
	
	
	@PostMapping("/delete_booking1")
	@ResponseBody
	public Map<String, Object> deleteBooking1(
			@RequestParam("phoneNumber")int id){
		
			int deleteRow = bookingBO.delBookByPhoneNumber(id);
			Map<String, Object> map = new HashMap<>();
			if(deleteRow > 0) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		
			return map;
		
	}
	
	// http://localhost/lesson06/book
		@RequestMapping("/book")
		public String book() {
			return "/lesson06/bookView";
		}
		
		// http://localhost/lesson06/booking
		@ResponseBody
		@PostMapping("/booking")
		public Map<String, Object> booking(
				@RequestParam("name") String name
				,@RequestParam("headcount") int headcount
				,@RequestParam("day") int day
				,@RequestParam("date") Date date
				,@RequestParam(value = "phoneNumber", required = false) String phoneNumber
				) {
			
			int deleteRow = bookingBO.addBooking(name, headcount, day, date, phoneNumber);
			Map<String, Object> map = new HashMap<>();
			
			if(deleteRow > 0) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
			
			return map;
		}
		
		// http://localhost/lesson06/check_booking
		@RequestMapping("/check_booking")
		public String check_book() {
			
			return "/lesson06/checkBooking";
		}
	
}
