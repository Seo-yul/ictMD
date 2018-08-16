package com.sesoc.ictmd;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.Interface.UserDAO;
import com.sesoc.ictmd.VO.UserBase;

@Controller
public class UserController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
	
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public @ResponseBody Integer loginCheck(UserBase ub) {
		
		System.out.println("ub = " + ub);
		
		UserDAO uDAO = session.getMapper(UserDAO.class);
		
		UserBase result = uDAO.checkUser(ub);
		
		if(result != null) 	return 1;		
		else return 0;
	}
	
	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "registerPage";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hsession) {
		
		hsession.invalidate();
		
		//return "home";
		return "loginPage";
	}
	
	
	
	
}
