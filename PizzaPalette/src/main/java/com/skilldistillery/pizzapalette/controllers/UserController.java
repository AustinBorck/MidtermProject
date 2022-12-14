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
public class UserController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private PizzaJointDAO pizzaJointDao;


	@RequestMapping(path = "loginButton.do", method = RequestMethod.GET)
	public String goToLoginFrom(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null && user.getRole().contains("admin")) {
			model.addAttribute("review", userDao.findUserReviews(user.getId()));
			return "adminAccountPage";
		} else if (user != null) {
			model.addAttribute("review", userDao.findUserReviews(user.getId()));
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
			User userOn = (User) session.getAttribute("loggedInUser");
		
			if (user.getRole().contains("admin")) {
				model.addAttribute("review", userDao.findUserReviews(userOn.getId()));
				return "adminAccountPage";
			} else {
				model.addAttribute("review", userDao.findUserReviews(userOn.getId()));
				return "userHome";
			}
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("loggedInUser");
		model.addAttribute("top", pizzaJointDao.topRated(3));
		return "index";
	}

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
		if (user.getRole().contains("admin")) {
			return "allUsers";
		} else {
			model.addAttribute("top", pizzaJointDao.topRated(3));
			return "index";
		}
	}

	@RequestMapping(path = "getAllUsers.do")
	public String getAllUsers(Model model, int userId) {
		User user = userDao.findUsername(userId);
		if (user == null) {
			return "noRestaurantResults";
		}
		model.addAttribute("user", user);
		return "allUsers";
	}
	
	
	
	
	@RequestMapping(path = "deleteReviewFromAccount.do", method = RequestMethod.POST)
	public String deleteReviewUserPage(Model model, int reviewId, int userId) {
		User user = userDao.findUsername(userId);
		pizzaJointDao.deleteReview(reviewId);
		model.addAttribute("review", userDao.findUserReviews(userId));
		if(user.getRole().contains("admin")) {
			return "adminAccountPage";
		}
		
		return "userHome";
	}
	
	
	@RequestMapping(path = "deactivateAccountAdmin.do", method = RequestMethod.POST)
	public String deactivateAccountFromAdmin(Model model, int deactivateAccount, HttpSession session) {
		User user = userDao.findUsername(deactivateAccount);
		userDao.deactivateUser(deactivateAccount);
		model.addAttribute("user", user);
			return "allUsers";
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
