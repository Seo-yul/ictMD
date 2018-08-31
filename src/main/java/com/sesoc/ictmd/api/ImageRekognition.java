package com.sesoc.ictmd.api;

import java.io.BufferedWriter;
import java.io.File;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sesoc.ictmd.function.CreateImg;

/**
 * 
 * @author yoon seoyul
 * LABEL_DETECTION 사진속 요소찾기
 *  LANDMARK_DETECTION 사진속 랜드마크 (특정 건물이나 중요한 건물)
 *  WEB_DETECTION 사진을 바탕으로한 관련검색어
 * 
 */
public class ImageRekognition extends Thread {

	private static final String TARGET_URL = "https://vision.googleapis.com/v1/images:annotate?"; // REST API TARGET URL
	private static final String API_KEY = "key=AIzaSyCV2X6B5-Di_ubLyaMALNBSg4pBH3LkN2k"; // API사용을 위한키
	private String imageTmp; // 얻은 이미지가 저장된 서버의 웹에서의 임시 경로
	private String resultLabelDetection; //요소검색 결과
	private String resultWebDetection; //관련검색어 결과
	private String resultLandmarkDetection; //랜드마크검사 결과
	private CreateImg creatimg; //분석할 이미지의 경로를 담은 객체
	@Override
	public void run() {
		int mst = 0;
		while(true) {
			if(creatimg.getImageTmp()!=null)break;
			System.out.println("이미지 생성 기다리는중..  "+mst);
			mst++;
		}
		this.imageTmp = creatimg.getImageTmp();
		
		resultLabelDetection = doLabelDetection();
		resultWebDetection = doWebDetection();
//		resultLandmarkDetection = doLandmarkDetection();
		
		JSONParser pJson = new JSONParser();
		// 요소인식
		System.out.println("======탐지된 요소=======");
		if (resultLabelDetection != null) {
			try {
				JSONObject jobj = (JSONObject) pJson.parse(resultLabelDetection);
				JSONArray jarry = (JSONArray) jobj.get("responses");
				System.out.println(jarry);
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
				System.out.println("ImageRekognition.java resultLabelDetection 오류(seoyul)");
				// TODO Auto-generated catch block
			}
		}

		// System.out.println("======랜드마크=======");
		// doLandmarkDetection();

		System.out.println("======관련어=======");
		if (resultWebDetection != null) {
			try {
				JSONObject jobj = (JSONObject) pJson.parse(resultWebDetection);
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
					System.out.println(jarry);
					System.out.println("분석 실패 or 분석 할 것 없음");
				}
			} catch (Exception e) {
				System.out.println("ImageRekognition.java resultWebDetection 오류(seoyul)");
			}
		} else {
			System.out.println("없음");
		}
		// 이미지 인식 끝
		super.run();
	}
	
	public ImageRekognition(CreateImg creatimg) {
		super();
		this.creatimg = creatimg;
	}
	

	/**
	 * doLabelDetection
	 * 가져온 값을 String 타입으로 줄줄 써서 나열
	 * return resp;
	 */
	
	public String doLabelDetection () {
		try {
			URL serverUrl = new URL(TARGET_URL + API_KEY);
			URLConnection urlConnection = serverUrl.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) urlConnection;
			httpConnection.setRequestMethod("POST");
			httpConnection.setRequestProperty("Content-Type", "application/json");
			httpConnection.setDoOutput(true);
			BufferedWriter httpRequestBodyWriter = new BufferedWriter(
					new OutputStreamWriter(httpConnection.getOutputStream()));
			httpRequestBodyWriter.write("{\"requests\":  [{ \"features\":  [ {\"type\": \"LABEL_DETECTION\",\"maxResults\": \"2\"	}],"
					+ " \"image\": {\"source\": { \"imageUri\": \"" + imageTmp + "\"}}}]}");
			httpRequestBodyWriter.close();
			String response = httpConnection.getResponseMessage();
//			System.out.println(response); //ok
			if (httpConnection.getInputStream() == null) {
				System.out.println("No stream");
				return null;
			}

			Scanner httpResponseScanner = new Scanner(httpConnection.getInputStream());
			String resp = "";
			ArrayList<String> descriptionList = new ArrayList<String>();
			while (httpResponseScanner.hasNext()) {
				String line = httpResponseScanner.nextLine();
				resp += line;
//				System.out.println(line); // response
			}
			httpResponseScanner.close();
			return resp;
		} catch (Exception e) {
			return null;
		}

	}

	public String doLandmarkDetection() {
		try {
			URL serverUrl = new URL(TARGET_URL + API_KEY);
			URLConnection urlConnection = serverUrl.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) urlConnection;
			httpConnection.setRequestMethod("POST");
			httpConnection.setRequestProperty("Content-Type", "application/json");
			httpConnection.setDoOutput(true);
			BufferedWriter httpRequestBodyWriter = new BufferedWriter(
					new OutputStreamWriter(httpConnection.getOutputStream()));
			httpRequestBodyWriter.write(
					"{\"requests\":  [{ \"features\":  [ {\"type\": \"LANDMARK_DETECTION\",\"maxResults\": \"2\"	}],"
							+ " \"image\": {\"source\": { \"imageUri\": \"" + imageTmp + "\"}}}]}");
			httpRequestBodyWriter.close();
			String response = httpConnection.getResponseMessage();
			if (httpConnection.getInputStream() == null) {
				System.out.println("No stream");
				return null;
			}

			Scanner httpResponseScanner = new Scanner(httpConnection.getInputStream());
			String resp = "";
			while (httpResponseScanner.hasNext()) {
				String line = httpResponseScanner.nextLine();
				resp += line;
				System.out.println(line); // response
			}
			httpResponseScanner.close();
			return resp;
		} catch (Exception e) {
			return null;
		}

	}

	public String doWebDetection() {
		try {
			URL serverUrl = new URL(TARGET_URL + API_KEY);
			URLConnection urlConnection = serverUrl.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) urlConnection;
			httpConnection.setRequestMethod("POST");
			httpConnection.setRequestProperty("Content-Type", "application/json");
			httpConnection.setDoOutput(true);
			BufferedWriter httpRequestBodyWriter = new BufferedWriter(
					new OutputStreamWriter(httpConnection.getOutputStream()));
			httpRequestBodyWriter
					.write("{ \"requests\": [ { \"features\": [ { \"type\": \"WEB_DETECTION\", \"maxResults\": 1 } ],"
							+ " \"image\": { \"source\": { \"imageUri\": \"" + imageTmp + "\" } } } ] }");
			httpRequestBodyWriter.close();
			String response = httpConnection.getResponseMessage();
			if (httpConnection.getInputStream() == null) {
				System.out.println("No stream");
				return null;
			}

			Scanner httpResponseScanner = new Scanner(httpConnection.getInputStream());
			String resp = "";
			
			
			while (httpResponseScanner.hasNext()) {
				String line = httpResponseScanner.nextLine();
				resp += line;
//				System.out.println(line); // response
			}
			httpResponseScanner.close();
			return resp;
		} catch (Exception e) {
			return null;
		}

	}

}
