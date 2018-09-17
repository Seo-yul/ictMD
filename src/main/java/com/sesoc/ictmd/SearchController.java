package com.sesoc.ictmd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.Interface.ModelDetailDAO;
import com.sesoc.ictmd.api.SearchAPI;
import com.sesoc.ictmd.function.CreateImg;
import com.sesoc.ictmd.vo.ComplexPhoto;
import com.sesoc.ictmd.vo.ModelDetail;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	@Autowired
	SqlSession session;
	
	SearchAPI api;
	CreateImg creatimg;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 검색어를 문자열 배열로 입력받아 검색 후 결과를 반환하는 메소드
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list(String[] tags, HttpSession ss) {
		// 검색 API와 리턴 객체를 초기화
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 분석 데이터로 쓰기 위해 검색어를 세션에 저장
		ss.removeAttribute("tags");
		ss.setAttribute("tags", tags);
		
		// 검색 결과를 리턴 객체에 저장
		result.put("list", api.search(tags));
		
		// 검색어가 카메라 모델명인지 검사
		HashMap<String, String[]> tagsMap = new HashMap<>();
		tagsMap.put("tags", tags);
		ModelDetailDAO mdDAO = session.getMapper(ModelDetailDAO.class);
		ArrayList<ModelDetail> model = mdDAO.searchModelDetail(tagsMap);
		if (model != null) {
			result.put("model", model);
		}

		return result;
	}

	// 임의의 사진 하나를 클릭했을 때 해당 사진에 대한 모든 정보를 가져오는 메소드
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> detail(String id, HttpServletRequest request, HttpSession ss) {
		// 검색 API와 리턴 객체를 초기화
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 상세 검색 결과를 요청
		ComplexPhoto p = api.getInfo(id);
		HashMap<String, String> e = api.getExif(id);
		
		// 검색 결과를 리턴 객체에 저장
		result.put("photo", p);
		result.put("exif", e);
		
		// 분석 데이터로 쓰기 위한 데이터들을 이미지 생성 객체에 전달
		String[] tags = (String[]) ss.getAttribute("tags");
		String make = "";
		String model = "";
		if (e.containsKey("Make")) {
			make = e.get("Make");
		}
		if (e.containsKey("Model")) {
			model = e.get("Model");
		}
		creatimg = new CreateImg(p.getUrl(), request, tags, make, model, session);
		creatimg.start();
		
		return result;
	}
}