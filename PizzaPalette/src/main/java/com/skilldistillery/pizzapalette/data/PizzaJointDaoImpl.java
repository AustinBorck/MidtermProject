package com.skilldistillery.pizzapalette.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.Review;
import com.skilldistillery.pizzapalette.entities.ReviewImage;
import com.skilldistillery.pizzapalette.entities.User;

@Service
@Transactional
public class PizzaJointDaoImpl implements PizzaJointDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public PizzaJoint findSinglePizzaJoint(int id){
		return em.find(PizzaJoint.class, id);
	}
	
	@Override
	public PizzaJoint addPizzaJoint(PizzaJoint name) {
		em.persist(name);
		return name;
	}

	@Override
	public PizzaJoint editPizzaJoint(int id, PizzaJoint pizzaJoint) {
		PizzaJoint updtdPizzaJoint = em.find(PizzaJoint.class, id);

		if (updtdPizzaJoint != null) {
			updtdPizzaJoint.setImage(pizzaJoint.getImage());
			updtdPizzaJoint.setName(pizzaJoint.getName());
			updtdPizzaJoint.setWebsite(pizzaJoint.getWebsite());
			updtdPizzaJoint.setDescription(pizzaJoint.getDescription());
			updtdPizzaJoint.setAddress(pizzaJoint.getAddress());
			updtdPizzaJoint.setAttributes(pizzaJoint.getAttributes());
		}
		return updtdPizzaJoint;
	}

	@Override
	public boolean deactivatePizzaJoint(int id) {
		boolean successfulDeac = false;
		PizzaJoint deacPizzaJoint = em.find(PizzaJoint.class, id);

		if (deacPizzaJoint != null) {
			deacPizzaJoint.setApproved(false);
			successfulDeac = true;
		}

		return successfulDeac;
	}

	@Override
	public List<Review> findPizzaJointReviews(int id) {
		PizzaJoint pizzaJoint = em.find(PizzaJoint.class, id);
		List<Review> reviews = pizzaJoint.getReviews();;
		return reviews;
	}
	
	public void addReview (String comments, int pizzaJointId, int userId, int userRating, ReviewImage userPicUrl) {
		Review newReview = null;
		List<ReviewImage> reviewImages = null;
		reviewImages.add(userPicUrl);
		newReview.setComments(comments);
		newReview.setReviewImages(null);
		newReview.setRating(userRating);
		newReview.setReviewDate(LocalDateTime.now());
		newReview.setUserReview(em.find(User.class, userId));
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
