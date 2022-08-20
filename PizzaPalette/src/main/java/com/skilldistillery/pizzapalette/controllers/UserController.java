package com.skilldistillery.pizzapalette.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.UserDAO;
import com.skilldistillery.pizzapalette.entities.Address;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

//	@RequestMapping(path = { "/", "index.do" })
//	public String home(Model model) {
//		return "index";
//	}

	@RequestMapping(path = "loginButton.do", method = RequestMethod.GET)
	public String goToLoginFrom(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			return "userHome";
		} else {
			return "loginPage";
		}
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String logInUser(HttpSession session, Model model, String username, String password) {
		User user = userDao.login(username, password);
		if (user == null) {
			return "loginPage";
		} else {
			session.setAttribute("loggedInUser", user);
			return "userHome";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "index";
	}

//	@RequestMapping("searchKeyword.do")
//	public String searchByKeyword(Model model, String keyword) {
//		List<PizzaJoint> pizzajoints = userDao.findPizzaJoint(keyword);
//		if(pizzajoints.size() > 0) {
//		model.addAttribute("results", pizzajoints);
//		return "result";
//		}else {
//			return "noResults";
//		}
//	}
//	@RequestMapping("singleResult.do")
//	public String singleResult(Model model, int id) {
//		PizzaJoint pizzaJoint = null;
//		pizzaJoint = userDao.findSinglePizzaJoint(id);
//		model.addAttribute("pizzaJoint", pizzaJoint);
//			return "pizzaJointPage";
//		}
	
	@RequestMapping("createAccountPage.do")
	public String createAccountPage(Model model) {
		return "createUser";
	}
	
	
	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount(Model model, String username, String password, String firstname, String lastname) {
		User user = new User();
		user.setEnabled(true);
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setRole("User");
		
		try {
			userDao.addUser(user);
		} catch (Exception e) {
			return "userNameTaken";
		}
		return "loginPage";
		
	}
	
	@RequestMapping(path = "updateAccountPage.do")
	public String updateAccountButton(Model model, int updateAccount) {
		model.addAttribute("user", userDao.findUsername(updateAccount));
		return "updateUser";
	}
	
	@RequestMapping(path = "update.do", method = RequestMethod.POST)
	public String update(Model model, int updateAccount, User updatedUser, HttpSession session) {
		model.addAttribute("loggedInUser", userDao.editUser(updateAccount, updatedUser));
		session.removeAttribute("loggedInUser");
		updatedUser = userDao.findUsername(updateAccount);
		session.setAttribute("loggedInUser", updatedUser);

		return "userHome";
	}
	
	@RequestMapping(path = "deactivateAccount.do", method = RequestMethod.POST)
	public String deactivate(Model model, int deactivateAccount, HttpSession session) {
		User user = userDao.findUsername(deactivateAccount);
		session.removeAttribute("loggedInUser");
		userDao.deactivateUser(deactivateAccount);
		return "index";
	}
	
}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
