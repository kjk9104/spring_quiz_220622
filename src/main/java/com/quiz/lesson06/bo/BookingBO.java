package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int delBookByPhoneNumber(int id) {
		return bookingDAO.delBookByPhoneNumber(id);
	}
	
	public int addBooking(
			String name 
			,int headcount 
			,int day 
			,Date date
			,String phoneNumber
			) {
		
		int add = bookingDAO.insertBooking(name, headcount, day, date, phoneNumber);
		return add;
	}
	
	public Booking getBookingBynameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingListBynameAndPhoneNumber(name, phoneNumber);
		if(bookingList.isEmpty()) {
			return null;
		}
		return bookingList.get(0);
	}
}
