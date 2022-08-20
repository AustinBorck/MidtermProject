package com.skilldistillery.pizzapalette.data;

import java.util.List;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.User;

public interface UserDAO {
	
	public List<User> findAllUsers();
	
	public User login(String username, String password);
	
	public User addUser(User username);
	
	public User editUser(int id, User user);

	public boolean deactivateUser(int id);
	
	public Review addReview(Review review);
	
	public boolean deactivateReview(int id);
	
	public User findUsername(int id);
	
}
