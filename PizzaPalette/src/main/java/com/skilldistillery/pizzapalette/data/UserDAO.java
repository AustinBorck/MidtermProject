package com.skilldistillery.pizzapalette.data;

import com.skilldistillery.pizzapalette.entities.User;

public interface UserDAO {
	
	
	User findById(int userId);
	
}
