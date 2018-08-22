package com.sesoc.ictmd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.api.SearchAPI;
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
	// 검색 페이지로 연결해주는 메소드.
	@RequestMapping(value = "/toSearch", method = RequestMethod.GET)
	public String toSearch() {
		return "search";
	}
	
	// 검색을 요청했을 경우 호출되는 메소드.
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
	
	// 특정 사진에 대해 상세 정보를 요청했을 경우 호출되는 메소드.
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> detail(String id) {
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();
		
		ComplexPhoto photo = api.getInfo(id);
		photo.setExifs(api.getExif(id));
		result.put("photo", photo);
		
		return result;
	}
}