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
	static final String Channel_SECRET="5e2f096e82c7adb9c8c7687fdd5ddc44";
	static final String USER_ID="Ub921d38db10576c26befbd863df9bb35";
	static final String CHANNEL_ACCESS_TOKEN="cbPghUsPN/6wh8HaJI55FZJNDktxdUyxvZz5lRfPoFqbNLmOEGAmIs59QliMYMmaUCNJzaBBnRIjCj6726JgLruHm/XWEeXK1gkvGginq2RaCHqWIUsJ79km3TeBgKPupRde/lrPGUUHCXn+IyJHMQdB04t89/1O/w1cDnyilFU=";


	/*public String sendMessag() {
		System.out.println("변환시작");
		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
//		Map<String, String> params = new HashMap<String, String>();
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();

		parameters.add("text", query);
		parameters.add("source", src_lang);
		parameters.add("target", target_lang);

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED));
		headers.add("X-Naver-Client-Id", clientId);
		headers.add("X-Naver-Client-Secret", clientSecret);
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String,String>>(parameters,headers);
//		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		System.out.println(entity);
		try {
			ResponseEntity<String> translation = client.exchange(url, HttpMethod.POST, entity, String.class);
			System.out.println(translation.getBody());
			return translation.getBody();
		} catch (Exception e) {
			System.out.println("에러");
			return null;
		}
	}*/
}
