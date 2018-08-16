package com.sesoc.ictmd;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "registerPage";
	}
	
	
	
	
}
