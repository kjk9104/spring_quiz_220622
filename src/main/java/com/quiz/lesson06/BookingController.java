package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
	
	// http://localhost/lesson06/addbook
		@RequestMapping("/addbook")
		public String book() {
			return "/lesson06/addBookView";
		}
		
		// http://localhost/lesson06/booking
		@ResponseBody
		@PostMapping("/booking")
		public Map<String, Object> booking(
				@RequestParam("name") String name
				,@RequestParam("headcount") int headcount
				,@RequestParam("day") int day
				,@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date
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
		
		@ResponseBody
		@PostMapping("/find_booking")
		public Map<String, Object> find_booking(
				@RequestParam("name") String name
				,@RequestParam("phoneNumber") String phoneNumber
				){
//					bookingBO.getBookingBynameAndPhoneNumber(name, phoneNumber);
					
					//name, phoneNumber 디비 조회
					Booking booking = bookingBO.getBookingBynameAndPhoneNumber(name, phoneNumber);
					
				
					Map<String, Object> result = new HashMap<>();
					if(booking != null) {
						result.put("result", "success");
						result.put("booking", booking);
					}else {
						result.put("result", null);
					}
					
					
					return result;
		}
//		public Booking find_booking(
//				@RequestParam("name") String name
//				,@RequestParam("phoneNumber") String phoneNumber
//				) {
//			
//			Booking result = bookingBO.getBookingBynameAndPhoneNumber(name, phoneNumber);
//			
//			return result;
//		}
	
}
