package com.skilldistillery.pizzapalette.data;

import java.util.List;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.ReviewImage;
import com.skilldistillery.pizzapalette.entities.User;

public interface PizzaJointDAO {
	
	public PizzaJoint findSinglePizzaJoint(int id);
	
	public PizzaJoint addPizzaJoint(PizzaJoint name);
	
	public PizzaJoint editPizzaJoint(int id, PizzaJoint pizzaJoint);
	
	public boolean deactivatePizzaJoint(int id);
	
	public List<Review> findPizzaJointReviews(int id);
	
	public void addReview (String comments, int pizzaJointId, int userId, int userRating, ReviewImage userPicUrl);
	
}
