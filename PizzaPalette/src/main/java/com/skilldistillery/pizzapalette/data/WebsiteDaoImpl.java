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
public class WebsiteDaoImpl implements WebsiteDAO {
	
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
	
}
