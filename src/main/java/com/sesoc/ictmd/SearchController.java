package com.sesoc.ictmd;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.api.SearchAPI;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	SearchAPI api;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/toSearch", method = RequestMethod.GET)
	public String toSearch() {
		return "search";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> search(String[] tags) {
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", api.search(tags));
		
		return result;
	}
}