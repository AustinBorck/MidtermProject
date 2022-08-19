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
	public User findUsername(String username) {
			return em.find(User.class, username);
	}

	@Override
	public List<PizzaJoint> findPizzaJoint(String keyword) {
		List<PizzaJoint> pizzaJointList = new ArrayList<>();
		String jpql = "SELECT p FROM PizzaJoint p WHERE p.name LIKE :name OR p.address.city LIKE :city OR p.address.state LIKE :state OR p.address.zip LIKE :zip OR p.attributes.name LIKE :name";
		pizzaJointList = em.createQuery(jpql, PizzaJoint.class)
					 .setParameter("name", "%" + keyword + "%") 
					 .setParameter("city", "%" + keyword + "%")
					 .setParameter("state", "%" + keyword + "%")
					 .setParameter("zip", "%" + keyword + "%")
					 .setParameter("name", "%" + keyword + "%")
					 .getResultList();
		return pizzaJointList;
	}
	
//	@Override
//	public List<PizzaJoint> findName(String name) {
//		List<PizzaJoint> pizzaJointList = new ArrayList<>();
//		String jpql = "SELECT p FROM PizzaJoint p WHERE p.name LIKE :name";
//		pizzaJointList = em.createQuery(jpql, PizzaJoint.class)
//					 .setParameter("name", "%" + name + "%")
//					 .getResultList();
//		return pizzaJointList;
//	}
//
//	@Override
//	public List<PizzaJoint> findCity(String keyword) {
//		List<PizzaJoint> pizzaJointList = new ArrayList<>();
//		String jpql = "SELECT a FROM Address a WHERE a.city LIKE :city OR a.state LIKE :state OR a.zip LIKE :zip";
//		pizzaJointList = em.createQuery(jpql, PizzaJoint.class)
//					 .setParameter("city", "%" + keyword + "%")
//					 .setParameter("state", "%" + keyword + "%")
//					 .setParameter("zip", "%" + keyword + "%")
//					 .getResultList();
//		return pizzaJointList;
//	}
//
//	@Override
//	public List<PizzaJoint> findAttribute(String name) {
//		List<PizzaJoint> pizzaJointList = new ArrayList<>();
//		String jpql = "SELECT a FROM Attribute a WHERE a.name LIKE :name";
//		pizzaJointList = em.createQuery(jpql, Attribute.class)
//					 .setParameter("name", "%" + name + "%")
//					 .getResultList();
//		return pizzaJointList;
//	}

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
			updtdUser.setAddress(user.getAddress().getStreet());
		}
		return updtdUser;
	}

	@Override
	public boolean deactivateUser(int id) {
		return false;
	}

	@Override
	public PizzaJoint addPizzaJoint(PizzaJoint name) {
		em.persist(name);
		return name;
	}

	@Override
	public PizzaJoint editPizzaJoint() {
		return null;
	}

	@Override
	public PizzaJoint deactivatePizzaJoint() {
		return null;
	}

	@Override
	public Review addReview(Review review) {
		em.persist(review);
		return review;
	}

	@Override
	public Review deactivateRating() {
		return null;
	}

	@Override
	public Review deactivateComments() {
		return null;
	}
	
}
