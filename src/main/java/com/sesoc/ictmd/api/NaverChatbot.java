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
	static final String USER_ID="Ub921d38db10576c26befbd863df9bb35";
	static final String CHANNEL_ACCESS_TOKEN="cbPghUsPN/6wh8HaJI55FZJNDktxdUyxvZz5lRfPoFqbNLmOEGAmIs59QliMYMmaUCNJzaBBnRIjCj6726JgLruHm/XWEeXK1gkvGginq2RaCHqWIUsJ79km3TeBgKPupRde/lrPGUUHCXn+IyJHMQdB04t89/1O/w1cDnyilFU=";
	static final String URL = "https://api.line.me/v2/bot/message/reply";

	
	public static String sendMessag(String sendtxt) {
		System.out.println("변환시작");
		RestTemplate client = new RestTemplate(); // RestTemplate으로 파싱하기 위함
//		Map<String, String> params = new HashMap<String, String>();
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		
		sendtxt = "안녕";
		
		String sendmsg = "{\"type\": \"text\", \"text\" : "+sendtxt+"}";
		parameters.add("replyToken", "text");
		parameters.add("messages", sendmsg);

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		headers.add("Authorization", "Bearer"+CHANNEL_ACCESS_TOKEN);
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String,String>>(parameters,headers);
		System.out.println(entity);
		try {
			ResponseEntity<String> chatbot = client.exchange(URL, HttpMethod.POST, entity, String.class);
			System.out.println(chatbot.getBody());
			return chatbot.getBody();
		} catch (Exception e) {
			System.out.println("에러");
			return null;
		}
	}
}
