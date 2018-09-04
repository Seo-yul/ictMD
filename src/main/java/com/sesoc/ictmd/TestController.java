package com.sesoc.ictmd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class TestController {

	@RequestMapping(value = "/kenMain", method = RequestMethod.GET)
	public String index() {
		return "kenMain";
	}

	
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery() {
		return "menu/gallery";
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog() {
		return "menu/blog";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		return "menu/contact";
	}
	
	@RequestMapping(value = "/single", method = RequestMethod.GET)
	public String single() {
		return "menu/single";
	}
	
	@RequestMapping(value = "/works", method = RequestMethod.GET)
	public String works() {
		return "menu/works";
	}
	
	
	
}