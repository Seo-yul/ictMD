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
import com.sesoc.ictmd.VO.UserDetail;

@Controller
public class UserController {

	@Autowired
	SqlSession session;

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	public @ResponseBody Integer loginCheck(UserBase ub, HttpSession hsession) {

		System.out.println("ub = " + ub);

		UserDAO uDAO = session.getMapper(UserDAO.class);

		UserBase result = uDAO.checkUser(ub);

		if (result != null) {
			hsession.setAttribute("userId", result.getUserId());
			hsession.setAttribute("userName", result.getUserName());
			return 1;
		} else
			return 0;
	}

	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage() {
		return "registerPage";
	}

	@RequestMapping(value = "/fixPage", method = RequestMethod.GET)
	public String fixPage() {
		return "fixPage";
	}

	@RequestMapping(value = "/secesionPage", method = RequestMethod.GET)
	public String secesionPage() {
		return "secesionPage";
	}

	@RequestMapping(value = "/imsi", method = RequestMethod.GET)
	public String imsi() {
		return "imsi";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public @ResponseBody void logout(HttpSession hsession) {

		hsession.invalidate();

		return;
	}

	@RequestMapping(value = "/secesionCheck", method = RequestMethod.POST)
	public @ResponseBody Integer secessionCheck(HttpSession hsession, UserBase ub) {

		System.out.println("�Ѿ�°� : " + ub);
		UserDAO uDAO = session.getMapper(UserDAO.class);

		UserBase result = uDAO.checkUser(ub);
		if (result != null) {
			uDAO.secesionUser(ub);
			hsession.invalidate();
			return 1;
		} else {
			return 0;

		}

	}

	@RequestMapping(value = "/fixUserBase", method = RequestMethod.POST)
	public @ResponseBody void fixUserBase(HttpSession hsession, UserBase ub) {

		System.out.println("�Ѿ�°� : " + ub);
		UserDAO uDAO = session.getMapper(UserDAO.class);
		ub.setUserId((String) hsession.getAttribute("userId"));
		uDAO.fixUserBase(ub);

		return;
	}

	@RequestMapping(value = "/fixUserDetail", method = RequestMethod.POST)
	public @ResponseBody void fixUserDetail(HttpSession hsession, UserDetail ud) {

		System.out.println("�Ѿ�°� : " + ud);
		UserDAO uDAO = session.getMapper(UserDAO.class);
		ud.setUserId((String) hsession.getAttribute("userId"));
		uDAO.fixUserDetail(ud);

		return;
	}

	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public @ResponseBody Boolean emailCheck(UserBase userbase) {
		UserDAO dao = session.getMapper(UserDAO.class);
		UserBase data = dao.checkEmail(userbase);

		if (data != null) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/insertuserBase", method = RequestMethod.POST)
	public @ResponseBody void insertuserBase(UserBase userbase) {
		System.out.println("����... : " + userbase);
		UserDAO dao = session.getMapper(UserDAO.class);

		dao.insertUserBase(userbase);

		return;
	}

	@RequestMapping(value = "/insertuserDetail", method = RequestMethod.POST)
	public @ResponseBody void insertuserDetail(UserDetail userdetail) {
		System.out.println("�ʵ�����... : " + userdetail);
		UserDAO dao = session.getMapper(UserDAO.class);

		dao.insertUserDetail(userdetail);

		return;
	}

	@RequestMapping(value = "/userCheck", method = RequestMethod.POST)
	public @ResponseBody Boolean userCheck(HttpSession hsession, UserBase ub) {

		UserDAO uDAO = session.getMapper(UserDAO.class);

		ub.setUserId((String) hsession.getAttribute("userId"));
		System.out.println(ub);

		UserBase result = uDAO.checkUser(ub);
		if (result == null) {
			return false;
		} else {
			return true;
		}

	}

}
