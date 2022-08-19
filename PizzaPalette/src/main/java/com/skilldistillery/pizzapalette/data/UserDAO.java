package com.skilldistillery.pizzapalette.data;

import java.util.List;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.User;

public interface UserDAO {
	
	User findUsername(String username);
	
	List<PizzaJoint> findName(String name);
	
	List<Address> findCity(String city);
	
	List<Address> findState(String state);
	
	List<Address> findZip(String zip);
	
	List<Attribute> findAttribute(String name);
	
	//////////////////////////////////////////////////////////
	
	public User login(String username, String password);
	
	public User addUser(int id);
	
	public User editUser(int id);

	public boolean deactivateUser(int id);
	
	public PizzaJoint addPizzaJoint();
	
	public PizzaJoint editPizzaJoint();
	
	public PizzaJoint deactivatePizzaJoint();
	
	public Review addRating();
	
	public Review addComments();
	
	public Review deactivateRating();
	
	public Review deactivateComments();
	
}
