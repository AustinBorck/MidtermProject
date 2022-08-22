package com.skilldistillery.pizzapalette.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.PizzaJointDAO;
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
	public String createAccount(Model model, String username, String password, String firstname, String lastname) {
		User user = new User();
		user.setEnabled(true);
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setRole("User");
		
		try {
			pizzaDao.addUser(user);
		} catch (Exception e) {
			return "pizzaJointAlreadyExists";
		}
		return "index";
	}
	
//	@RequestMapping(path = "updateAccountPage.do")
//	public String updateAccountButton(Model model, int updateAccount) {
//		model.addAttribute("user", userDao.findUsername(updateAccount));
//		return "updateUser";
//	}
//	
//	@RequestMapping(path = "update.do", method = RequestMethod.POST)
//	public String update(Model model, int updateAccount, User updatedUser, HttpSession session) {
//		model.addAttribute("loggedInUser", userDao.editUser(updateAccount, updatedUser));
//		session.removeAttribute("loggedInUser");
//		updatedUser = userDao.findUsername(updateAccount);
//		session.setAttribute("loggedInUser", updatedUser);
//
//		return "userHome";
//	}
//	
//	@RequestMapping(path = "deactivateAccount.do", method = RequestMethod.POST)
//	public String deactivate(Model model, int deactivateAccount, HttpSession session) {
//		User user = userDao.findUsername(deactivateAccount);
//		session.removeAttribute("loggedInUser");
//		userDao.deactivateUser(deactivateAccount);
//		if(user.getRole().contains("admin")) {
//			return "allUsers";
//		} else {
//		return "index";
//		}
//	}
	
}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
