package com.skilldistillery.pizzapalette.data;

import java.awt.print.Book;
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
	public List<PizzaJoint> findName(String name) {
		List<PizzaJoint> pizzaJointList = new ArrayList<>();
		String jpql = "SELECT p FROM PizzaJoint p WHERE p.name LIKE :name";
		pizzaJointList = em.createQuery(jpql, PizzaJoint.class)
					 .setParameter("name", "%" + name + "%")
					 .getResultList();
		return pizzaJointList;
	}

	@Override
	public List<Address> findCity(String city) {
		List<Address> pizzaJointList = new ArrayList<>();
		String jpql = "SELECT p FROM Pizza_joint p WHERE p.city LIKE :city";
		pizzaJointList = em.createQuery(jpql, Address.class)
					 .setParameter("city", "%" + city + "%")
					 .getResultList();
		return pizzaJointList;
	}

	@Override
	public List<Address> findState(String state) {
		return null;
	}

	@Override
	public List<Address> findZip(String zip) {
		return null;
	}

	@Override
	public List<Attribute> findAttribute(String name) {
		return null;
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
	public User addUser(int id) {
		return null;
	}

	@Override
	public User editUser(int id) {
		return null;
	}

	@Override
	public boolean deactivateUser(int id) {
		return false;
	}

	@Override
	public PizzaJoint addPizzaJoint() {
		return null;
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
	public Review addRating() {
		return null;
	}

	@Override
	public Review addComments() {
		return null;
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
