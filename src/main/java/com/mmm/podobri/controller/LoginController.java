package com.mmm.podobri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController 
{
	@RequestMapping("/login")
	public ModelAndView getLoginForm(@RequestParam(required = false) String authfailed, String logout) 
	{
		String message = "";
		if (authfailed != null) 
		{
			message = "Invalid username of password, try again !";
		} 
		else if (logout != null) 
		{
			message = "Logged Out successfully, login again to continue !";
		}
		return new ModelAndView("login", "message", message);
	}

	@RequestMapping("profile")
	public String geProfilePage() 
	{
		return "profile";
	}
}
