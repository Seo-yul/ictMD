package com.sesoc.ictmd;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.ictmd.api.ImageRekognition;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//return "home";
		return "loginPage";
	}
	
	@RequestMapping(value = "/goWeather", method = RequestMethod.GET)
	public String goWeather() {
		return "goWeather";
	}
	
	@RequestMapping(value = "/imgtest", method = RequestMethod.GET)
	public String imgtest(){
	
		return "imgtest";	
	}
	
	
	@RequestMapping(value = "/imageRekognition", method = RequestMethod.POST)
	public String imageRekognition(String imgurl, HttpServletRequest request) {
		ImageRekognition i = new ImageRekognition(imgurl, request);

		System.out.println("======요소찾기=======\n");
		i.doLabelDetection();
		System.out.println("======랜드마크=======\n");
		i.doLandmarkDetection();
		System.out.println("======관련검색어=======\n");
		i.doWebDetection();
		i.fileClear();
		return "redirect:/imgtest";
	}
	
	
	
	
	
	
}
