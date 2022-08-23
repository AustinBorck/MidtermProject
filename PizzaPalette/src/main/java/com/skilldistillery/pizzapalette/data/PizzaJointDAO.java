package com.skilldistillery.pizzapalette.data;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.ReviewImage;
import com.skilldistillery.pizzapalette.entities.User;

public interface PizzaJointDAO {
	
	public PizzaJoint findSinglePizzaJoint(int id);
	
	public PizzaJoint addPizzaJoint(PizzaJoint name, Address newAddy);
	
	public PizzaJoint editPizzaJoint(int id, PizzaJoint pizzaJoint);
	
	public boolean deactivatePizzaJoint(int id);
	
	public List<Review> findPizzaJointReviews(int id);
	
	public void addReview (String comments, int pizzaJointId, int userId, int userRating, String imageUrl);
	
	public List<PizzaJoint> topRated (int howMany);
	
	public boolean reactivatePizzaJoint(int id);
	
	public PizzaJoint updatePizzaJoint(HttpSession session, Model model, int id, String name, String imageUrl, String website, String description, String street, String state, String city, String phone,
			String zip, String[] attributes);
		
	public boolean deleteReview(int reviewId);
}
