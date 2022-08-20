package com.skilldistillery.pizzapalette.data;

import java.util.List;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.User;

public interface WebsiteDAO {
	
	User findUsername(int id);
	
	List<PizzaJoint> findPizzaJoint(String keyword);
	
}
