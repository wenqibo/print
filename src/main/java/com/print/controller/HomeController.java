package com.print.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request){
		return "index";
	}

	@RequestMapping(value = "/reactjs", method = RequestMethod.GET)
	public String reactjs(HttpServletRequest request){
		return "reactjs";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request){

		return "test";
	}
}
