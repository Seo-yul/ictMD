package com.sesoc.ictmd;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class HomeController {
	// 처음 구동 시 메인 화면으로 이동하는 메소드
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String init() {
		return "redirect:/main";
	}*/
	
	// 메인 화면으로 이동하는 메소드
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String gomain() {
		
		return "main";
	}
	
	// 사진 검색 화면으로 이동하는 메소드
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}
	
	// 트렌드 분석 화면으로 이동하는 메소드
	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public String analysis() {
		return "analysis";
	}
	
	// 날씨 및 가격 정보 화면으로 이동하는 메소드
	@RequestMapping(value = "/weatherNshopping", method = RequestMethod.GET)
	public String goWeather() {
		return "weatherNshopping";
	}
}