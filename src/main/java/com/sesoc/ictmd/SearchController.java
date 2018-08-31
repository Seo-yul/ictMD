package com.sesoc.ictmd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.api.ImageRekognition;
import com.sesoc.ictmd.api.SearchAPI;
import com.sesoc.ictmd.function.CreateImg;
import com.sesoc.ictmd.vo.ComplexPhoto;
import com.sesoc.ictmd.vo.SimplePhoto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	SearchAPI api;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 검색어를 문자열 배열로 입력받아 검색 후 결과를 반환하는 메소드
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list(String[] tags) {
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();

		ArrayList<SimplePhoto> list = api.search(tags);
		if (list != null) {
			result.put("list", list);
		}

		return result;
	}

	// 임의의 사진 하나를 클릭했을 때 해당 사진에 대한 모든 정보를 가져오는 메소드
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> detail(String id, HttpServletRequest request) {
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();

		ComplexPhoto photo = api.getInfo(id);
		HashMap<String, String> exifs = api.getExif(id);
		
		
		CreateImg creatimg = new CreateImg(photo.getUrl(), request);
		ImageRekognition imgRekog = new ImageRekognition(creatimg); // api콜
		creatimg.start();
		imgRekog.start();
		
		
		result.put("photo", photo);
		result.put("exifs", exifs);
		return result;
	}

}