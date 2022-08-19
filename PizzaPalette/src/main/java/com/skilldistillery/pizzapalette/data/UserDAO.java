package com.skilldistillery.pizzapalette.data;

import java.util.List;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.User;

public interface UserDAO {
	
	User findUsername(String username);
	
	List<PizzaJoint> findPizzaJoint(String keyword);
	
//	List<PizzaJoint> findName(String name);
	
//	List<Address> findCity(String keyword);
//	
//	List<Attribute> findAttribute(String name);
	
	//////////////////////////////////////////////////////////
	
	public User login(String username, String password);
	
	public User addUser(User username);
	
	public User editUser(int id, User user);

	public boolean deactivateUser(int id);
	
	public PizzaJoint addPizzaJoint(PizzaJoint name);
	
	public PizzaJoint editPizzaJoint();
	
	public PizzaJoint deactivatePizzaJoint();
	
	public Review addReview(Review review);
	
	
	public Review deactivateRating();
	
	public Review deactivateComments();
	
}
