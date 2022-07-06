package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.dao.WeatherhistoryDAO;
import com.quiz.lesson05.model.Weatherhistory;

@Service
public class WeatherhistoryBO {
	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;  
	
	public List<Weatherhistory> getWeatherhistory() {
		return weatherhistoryDAO.selectWheterhistory();  
	}
	
	public void addWeatherhistory(
			String date, 
			String weather, 
			double temperatures, 
			double precipitation, 
			String microDust,
			double windSpeed) {
		weatherhistoryDAO.insertWheatherhistory(
				date, 
				weather, 
				temperatures,
				precipitation, 
				microDust, 
				windSpeed);
		
	}
}
