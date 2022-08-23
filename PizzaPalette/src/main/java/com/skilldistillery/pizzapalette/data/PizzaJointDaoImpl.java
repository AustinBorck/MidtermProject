package com.skilldistillery.pizzapalette.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.Category;
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
	public PizzaJoint updatePizzaJoint(HttpSession session, Model model, int id, String name, String imageUrl, String website, String description, String street, String state, String city, String phone,
			String zip, String[] attributes) {
		PizzaJoint pizzaJoint = em.find(PizzaJoint.class, id);
		List<Attribute> newAtts = new ArrayList<>();
		for (String ids : attributes) {
			Attribute att = new Attribute();
			att.setId(Integer.parseInt(ids));
			newAtts.add(att);
		}
		Address newAddy = new Address();
		newAddy.setStreet(street);
		newAddy.setCity(city);
		newAddy.setState(state);
		newAddy.setZip(zip);
		newAddy.setPhoneNumber(phone);
		pizzaJoint.setAddress(newAddy);
		pizzaJoint.setName(name);
		pizzaJoint.setApproved(true);
		pizzaJoint.setAttributes(newAtts);
		pizzaJoint.setImage(imageUrl);
		pizzaJoint.setWebsite(website);
		pizzaJoint.setDescription(description);
		pizzaJoint.setDateAdded(LocalDateTime.now());
		User user = (User) session.getAttribute("loggedInUser");
		
		pizzaJoint.setAddedByUser(user);
		em.persist(newAddy);
		em.persist(pizzaJoint);
		return pizzaJoint;
	}

	@Override
	public PizzaJoint findSinglePizzaJoint(int id){
		return em.find(PizzaJoint.class, id);
	}
	
	@Override
	public PizzaJoint addPizzaJoint(PizzaJoint name, Address newAddy) {
		em.persist(newAddy);
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
	public boolean reactivatePizzaJoint(int id) {
		boolean successfulReac = false;
		PizzaJoint deacPizzaJoint = em.find(PizzaJoint.class, id);
		
		if (deacPizzaJoint != null) {
			deacPizzaJoint.setApproved(true);
			successfulReac = true;
		}
		
		return successfulReac;
	}

	@Override
	public List<Review> findPizzaJointReviews(int id) {
		PizzaJoint pizzaJoint = em.find(PizzaJoint.class, id);
		List<Review> reviews = pizzaJoint.getReviews();
		return reviews;
	}
	@Override
	public void addReview (String comments, int pizzaJointId, int userId, int userRating, String userPicUrl) {
		Review newReview = new Review();
		ReviewImage ri = new ReviewImage();;
		ri.setImageUrl(userPicUrl);
		newReview.setComments(comments);
		newReview.setPizzaJoint(em.find(PizzaJoint.class, pizzaJointId));
		newReview.setRating(userRating);
		newReview.setReviewDate(LocalDateTime.now());
		newReview.setUserReview(em.find(User.class, userId));
		em.persist(newReview);
		
	}

	
	public List<PizzaJoint> topThree() {
		String jpql = "SELECT p FROM PizzaJoint p";
		return em.createQuery(jpql, PizzaJoint.class).getResultList();
	}

	@Override
	public List<PizzaJoint> topRated(int howMany) {

		String jpql = "SELECT p, AVG(r.rating)  FROM PizzaJoint p JOIN p.reviews r GROUP BY p ORDER BY AVG(r.rating) DESC ";
		List<Object[]> result = em.createQuery(jpql, Object[].class).getResultList();
		List<PizzaJoint> joints = new ArrayList<>();
		for (int i = 0; i < result.size() && i< howMany; i++) {
			joints.add((PizzaJoint) result.get(i)[0]);
		}
		return joints;
				
	}

	@Override
	public boolean deleteReview(int reviewId) {
		boolean worked = false;
		Review deleteReview = em.find(Review.class, reviewId);
		if (deleteReview != null) {
			em.remove(deleteReview);
			worked = !em.contains(deleteReview);
		} 
		return worked;
	}	
	
}
