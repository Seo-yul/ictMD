package com.sesoc.ictmd.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NaverChatbotController {
			
	@RequestMapping(value = "/webhook", method = RequestMethod.GET)
	public String webhook(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
	
	
	
	
	
	
//	function send(channelAccessToken, replyToken_, messages_) {
//	var headers = {
//			'Content-type':'application/json',
//			'Authorization':'Bearer ' + channelAccessToken
//		};
//
//		var options = {
//			url: 'https://api.line.me/v2/bot/message/reply',
//			method: 'POST',
//			headers: headers,
//			json: {
//				replyToken : replyToken_,
//				messages : messages_
//			}
//		};
//
//		request(options, function(error, response, body) {
//			console.log('error:', error); // Print the error if one occurred 
//			console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received 
//	  		console.log('body:', body); // Print the HTML for the Google homepage. 
//			console.log('response', response.statusCode);
//		});
//	};
//
//	app.post('/webhook', (req, res) => {
//		var eventObj = req.body.events[0];
//		var source = eventObj.source;
//		var message = eventObj.message;
//		console.log('======================', new Date() ,'======================');
//		console.log('[request]', req.body);
//		console.log('[request source] ', source);
//		console.log('[request message]', message);
//		console.log('[request text]', message.text);
//		if(message.type == "text") {
//			var message = [{"type": "text", "text" : message.text}];
//			send(CHANNEL_ACCESS_TOKEN, eventObj.replyToken, message);
//		}
//		res.sendStatus(200);
//	});
//
//	module.exports = app;
	
	@RequestMapping(value ="/helo", method=RequestMethod.GET, produces = "application/json; charset=utf8")
	public String go() {
		
		return null;
	}
	
}
