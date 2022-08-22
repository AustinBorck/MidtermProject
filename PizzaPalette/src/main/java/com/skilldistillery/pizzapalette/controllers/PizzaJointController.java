package com.skilldistillery.pizzapalette.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.PizzaJointDAO;
import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.Attribute;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.User;

@Controller
public class PizzaJointController {

	@Autowired
	private PizzaJointDAO pizzaDao;

	@RequestMapping("singleResult.do")
	public String singleResult(Model model, int id) {
		PizzaJoint pizzaJoint = null;
		pizzaJoint = pizzaDao.findSinglePizzaJoint(id);
		model.addAttribute("pizzaJoint", pizzaJoint);
		model.addAttribute("reviews", pizzaDao.findPizzaJointReviews(id));
			return "pizzaJointPage";
		}
	
	@RequestMapping(path = "addReview.do", method = RequestMethod.POST)
	public String addReviewToPizzaJoint(HttpSession session, Model model, String comments, int pizzaJointId, String userId, int userRating, String imageUrl) {
			if(userId == "") {
				return "loginPage";
			}else {
				int userID = Integer.parseInt(userId);
				User user = (User) session.getAttribute("loggedInUser");
				pizzaDao.addReview(comments, pizzaJointId, userID, userRating, imageUrl);
				PizzaJoint pizzaJoint = pizzaDao.findSinglePizzaJoint(pizzaJointId);
				model.addAttribute("pizzaJoint", pizzaJoint);
				model.addAttribute("reviews", pizzaDao.findPizzaJointReviews(pizzaJointId));
				return "pizzaJointPage";
			}
		
	}
	
	@RequestMapping("createPizza.do")
	public String createPizzaJoint(Model model) {
		return "createPizzaJoint";
	}
	
	
	@RequestMapping(path = "createPizzaJoint.do", method = RequestMethod.POST)
	public String createAccount(HttpSession session, Model model, String name, String imageUrl, String website, String description, String street, String state, String city, String phone,
			String zip, String[] attributes) {
		List<Attribute> newAtts = new ArrayList<>();
		for (String id : attributes) {
			Attribute att = new Attribute();
			att.setId(Integer.parseInt(id));
		}
		PizzaJoint pizzaJoint = new PizzaJoint();
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
		try {
			pizzaDao.addPizzaJoint(pizzaJoint, newAddy);
		} catch (Exception e) {
			return "pizzaJointAlreadyExists";
		}
		return "index";
	}
	
	@RequestMapping(path= "pizzaJointById.do")
	public String getPizzaPageById(Model model, int pizzaJointId) {
		PizzaJoint pizzaJoint = pizzaDao.findSinglePizzaJoint(pizzaJointId);
		model.addAttribute("pizzaJoint", pizzaJoint);
		model.addAttribute("reviews", pizzaDao.findPizzaJointReviews(pizzaJointId));
		return "adminPizzaJointPage";
	}
	
	@RequestMapping(path="deactivatePizzajoint.do", method=RequestMethod.POST)
	public String deactivatePizzaJoint(Model model, int id) {
		pizzaDao.deactivatePizzaJoint(id);
		return "index";
	}
	@RequestMapping(path="reactivatePizzajoint.do", method=RequestMethod.POST)
	public String reactivatePizzaJoint(Model model, int id) {
		pizzaDao.deactivatePizzaJoint(id);
		return "index";
	}
	@RequestMapping(path="updatePizzaJoint.do")
	public String updatePizzaJoint (Model model, int updatePizzaJoint) {
		PizzaJoint updateMe = pizzaDao.findSinglePizzaJoint(updatePizzaJoint);
		model.addAttribute("pizzaJoint", updateMe);
		return "updatePizzaJoint";
	}
	
	
	
	@RequestMapping(path = "updatePizza.do", method = RequestMethod.POST)
	public String updateThisPizzaJoint(HttpSession session, Model model, int id, String name, String imageUrl, String website, String description, String street, String state, String city, String phone,
			String zip, String[] attributes) {
		try {
			pizzaDao.updatePizzaJoint(session, model, id, name, imageUrl, website, description, street, state, city, phone,
					zip, attributes);
		} catch (Exception e) {
			e.printStackTrace();
			return "pizzaJointAlreadyExists";
		}
		return "index";
	}
	
}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
