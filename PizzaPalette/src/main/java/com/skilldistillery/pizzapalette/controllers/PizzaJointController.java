package com.skilldistillery.pizzapalette.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.PizzaJointDAO;
import com.skilldistillery.pizzapalette.data.UserDAO;
import com.skilldistillery.pizzapalette.entities.Address;
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
	
//	@RequestMapping("createAccountPage.do")
//	public String createAccountPage(Model model) {
//		return "createAccount";
//	}
	
	
//	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
//	public String createAccount(Model model, String username, String password, String firstname, String lastname) {
//		PizzaJoint pizzaJoint = new PizzaJoint();
//		pizzaJoint.setEnabled(true);
//		pizzaJoint.setUsername(username);
//		pizzaJoint.setPassword(password);
//		pizzaJoint.setFirstName(firstname);
//		pizzaJoint.setLastName(lastname);
//		pizzaJoint.setRole("User");
//		
//		try {
//			userDao.addUser(user);
//		} catch (Exception e) {
//			return "userNameTaken";
//		}
//		return "loginPage";
//		
//	}
//	
//	@RequestMapping(path = "updateAccountPage.do")
//	public String updateAccountButton(Model model, int updateAccount) {
//		model.addAttribute("user", userDao.findUsername(updateAccount));
//		return "updateAccount";
//	}
//	
//	@RequestMapping(path = "update.do", method = RequestMethod.POST)
//	public String update(Model model, int updateAccount, User updatedUser) {
//		model.addAttribute("loggedInUser", userDao.editUser(updateAccount, updatedUser));
//		return "accountPage";
//	}
	
	
	
}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
