package com.skilldistillery.pizzapalette.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.pizzapalette.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
}
