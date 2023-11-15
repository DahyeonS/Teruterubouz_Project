package com.myweb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/weather", method = RequestMethod.GET)
	public String Weather() {
		return "weather/weather";
	}
	
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public String Status() {
		return "status/status";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about/about";
	}
	
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String goods() {
		return "goods/goods";
	}
	
	@RequestMapping(value = "/goods/product", method = RequestMethod.GET)
	public String product() {
		return "goods/product";
	}
}
