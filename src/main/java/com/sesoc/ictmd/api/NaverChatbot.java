package com.sesoc.ictmd.api;

import java.util.Collections;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class NaverChatbot {
	private String clientId = "y7OdqHdyaguUohbi0RXi"; // X-Naver-Client-Id
	private String clientSecret = "1CxLYNpFZU"; //X-Naver-Client-Secret
	private String src_lang; // 시작언어
	private String target_lang; // 번역언어
	private String query; // 번역내용
	private String url = "https://openapi.naver.com/v1/language/translate"; // kakao API 주소

	public NaverChatbot(String src_lang, String target_lang, String query) {
		super();
		this.src_lang = src_lang;
		this.target_lang = target_lang;
		this.query = query;
		System.out.println("생성자 생성");
	}

//	public String doTranslation() {
//		System.out.println("변환시작");
//		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
////		Map<String, String> params = new HashMap<String, String>();
//		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
//
//		parameters.add("text", query);
//		parameters.add("source", src_lang);
//		parameters.add("target", target_lang);
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED));
//		headers.add("X-Naver-Client-Id", clientId);
//		headers.add("X-Naver-Client-Secret", clientSecret);
//		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String,String>>(parameters,headers);
////		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
//		System.out.println(entity);
//		try {
//			ResponseEntity<String> translation = client.exchange(url, HttpMethod.POST, entity, String.class);
//			System.out.println(translation.getBody());
//			return translation.getBody();
//		} catch (Exception e) {
//			System.out.println("에러");
//			return null;
//		}
//	}
}
