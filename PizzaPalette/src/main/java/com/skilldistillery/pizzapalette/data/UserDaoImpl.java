package com.skilldistillery.pizzapalette.data;

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
import com.skilldistillery.pizzapalette.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUsername(int id) {
			return em.find(User.class, id);
	}

	@Override
	public List<PizzaJoint> findPizzaJoint(String keyword) {
		List<PizzaJoint> pizzaJointList = new ArrayList<>();
		String jpql = "SELECT DISTINCT p FROM PizzaJoint p JOIN p.attributes att WHERE p.name LIKE :name OR p.address.city LIKE :city OR p.address.state LIKE :state OR p.address.zip LIKE :zip OR att.name LIKE :name AND p.approved = true";
		pizzaJointList = em.createQuery(jpql, PizzaJoint.class)
					 .setParameter("name", "%" + keyword + "%") 
					 .setParameter("city", "%" + keyword + "%")
					 .setParameter("state", "%" + keyword + "%")
					 .setParameter("zip", "%" + keyword + "%")
					 .setParameter("name", "%" + keyword + "%")
					 .getResultList();
		return pizzaJointList;
	}
	
	@Override
	public User login(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :u AND u.password = :p AND u.enabled = true";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("u", username)
					.setParameter("p", password)
					.getSingleResult();
		} catch (Exception e) {
			System.out.println("Invalid login");
		}
		return user;
	}

	@Override
	public User addUser(User username) {
		em.persist(username);
		return username;
	}

	@Override
	public User editUser(int id, User user) {
		User updtdUser = em.find(User.class, id);

		if (updtdUser != null) {
			updtdUser.setUsername(user.getUsername());
			updtdUser.setPassword(user.getPassword());
			updtdUser.setFirstName(user.getFirstName());
			updtdUser.setLastName(user.getLastName());
		}
		return updtdUser;
	}

	@Override
	public boolean deactivateUser(int id) {
		boolean successfulDeac = false;
		User deacUser = em.find(User.class, id);

		if (deacUser != null) {
			deacUser.setEnabled(false);
			successfulDeac = true;
		}

		return successfulDeac;
	}

	@Override
	public PizzaJoint addPizzaJoint(PizzaJoint name) {
		em.persist(name);
		return name;
	}

	public PizzaJoint findSinglePizzaJoint(int id){
		return em.find(PizzaJoint.class, id);
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
	public Review addReview(Review review) {
		em.persist(review);
		return review;
	}

	@Override
	public boolean deactivateReview(int id) {
		boolean successfulDeac = false;
		Review deacReview = em.find(Review.class, id);

		if (deacReview != null) {
			deacReview.setActive(false);
			successfulDeac = true;
		}

		return successfulDeac;
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT u FROM User u";
		return em.createQuery(jpql, User.class).getResultList();
	}

	
}
