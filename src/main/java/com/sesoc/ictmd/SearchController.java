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
	public @ResponseBody Map<String, Object> detail(String id) {
		api = new SearchAPI();
		Map<String, Object> result = new HashMap<String, Object>();

		ComplexPhoto photo = api.getInfo(id);
		HashMap<String, String> exifs = api.getExif(id);
		
		result.put("photo", photo);
		result.put("exifs", exifs);
		return result;
	}
	
	@RequestMapping(value = "/recognize", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> recognize(HttpServletRequest request) {
		// 이미지 인식 ---
		ImageRekognition imgRekog = new ImageRekognition("사진주소", request); // api콜
		JSONParser pJson = new JSONParser();
		// 요소인식
		System.out.println("======탐지된 요소=======");
		String getLabelDetection = imgRekog.doLabelDetection();
		if (getLabelDetection != null) {
			try {
				JSONObject jobj = (JSONObject) pJson.parse(getLabelDetection);
				JSONArray jarry = (JSONArray) jobj.get("responses");
				jobj = (JSONObject) jarry.get(0);
				jarry = (JSONArray) jobj.get("labelAnnotations");
				if (jarry != null) {
					ArrayList<JSONObject> arryJSONObject = new ArrayList<>();
					for (int i = 0; i < jarry.size(); i++) {
						arryJSONObject.add((JSONObject) jarry.get(i));
					}
					ArrayList<String> el = new ArrayList<>();
					// 사진에서 탐지된 요소를 0개~2개를 출력합니다. (최대 수는 콜에서 설정가능. 현재값 2개)
					for (JSONObject JSONobj : arryJSONObject) {
						el.add((String) JSONobj.get("description"));
					}
					System.out.println(el); // 요소 두개들어있습니다.
				} else {
					System.out.println("분석 실패 or 분석 할 것 없음");
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
			}
		}

		// System.out.println("======랜드마크=======");
		// imgRekog.doLandmarkDetection();

		System.out.println("======관련어=======");
		String getWebDetection = imgRekog.doWebDetection();
		if (getWebDetection != null) {
			try {
				JSONObject jobj = (JSONObject) pJson.parse(getWebDetection);
				JSONArray jarry = (JSONArray) jobj.get("responses");
				jobj = (JSONObject) jarry.get(0);
				jobj = (JSONObject) jobj.get("webDetection");
				if (jobj != null) {
					jarry = (JSONArray) jobj.get("webEntities");
					JSONObject jobjtmp = (JSONObject) jarry.get(0);
					String aa = (String) jobjtmp.get("description"); // 사진 명사 인식?
					System.out.println(aa);
					
					jarry = (JSONArray) jobj.get("bestGuessLabels");
					jobjtmp = (JSONObject) jarry.get(0);
					String bb = (String) jobjtmp.get("label"); // 사진설명느낌?
					
					
					if(!(bb.equals(aa))) {
					System.out.println(bb);
					}
				} else {
					System.out.println("분석 실패 or 분석 할 것 없음");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			System.out.println("없음");
		}
		imgRekog.fileClear();
		// 이미지 인식 끝
		return null;
	}
}