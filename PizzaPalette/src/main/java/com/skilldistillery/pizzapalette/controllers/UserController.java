package com.skilldistillery.pizzapalette.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.UserDAO;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "index.do" })
	public String home(Model model) {
		return "index";
	}

	@RequestMapping(path = "loginButton.do", method = RequestMethod.GET)
	public String goToLoginFrom(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			return "accountPage";
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
			return "accountPage";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "index";
	}

	@RequestMapping("searchKeyword.do")
	public String searchByKeyword(Model model, String keyword) {
		List<PizzaJoint> pizzajoints = userDao.findPizzaJoint(keyword);
		if(pizzajoints.size() > 0) {
		model.addAttribute("results", pizzajoints);
		return "result";
		}else {
			return "noResults";
		}
	}
}
