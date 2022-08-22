package com.skilldistillery.pizzapalette.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.pizzapalette.data.WebsiteDAO;
import com.skilldistillery.pizzapalette.entities.PizzaJoint;
import com.skilldistillery.pizzapalette.entities.User;

@Controller
public class WebsiteController {

	@Autowired
	private WebsiteDAO websiteDao;

	@RequestMapping(path = { "/", "index.do" })
	public String home(Model model) {
		return "index";
	}

	@RequestMapping("searchKeyword.do")
	public String searchByKeyword(Model model, String keyword) {
		List<PizzaJoint> pizzajoints = websiteDao.findPizzaJoint(keyword);
		if(pizzajoints.size() > 0) {
		model.addAttribute("results", pizzajoints);
		return "restaurantResults";
		}else {
			return "noRestaurantResults";
		}
	}
	

	@RequestMapping(path = {"contacted.do" })
	public String contacted(Model model) {
		return "index";
	}
	
	@RequestMapping(path = {"contact.do" })
	public String contact(Model model) {
		return "contact";
	}
	
	@RequestMapping(path = {"about.do" })
	public String about(Model model) {
		return "about";
	}
	
}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
