package com.quiz.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;

@Service
public class FavoriteBO {
	@Autowired
	private FavoriteDAO favoriteDAO;
	 public void addFavorit(String name, String url) {
		 favoriteDAO.insertFavorit(name, url);
	 }
}
