package com.quiz.lesson05.bo;

import org.springframework.beans.factory.annotation.Autowired;

import com.quiz.lesson05.dao.WeatherhistoryDAO;
import com.quiz.lesson05.model.Weatherhistory;

public class WeatherhistoryBO {
	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;  
	
	public Weatherhistory getWeatherhistory() {
		return weatherhistoryDAO.selectWheterhistory();  
	}
}
