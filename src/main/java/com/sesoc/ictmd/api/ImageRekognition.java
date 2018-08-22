package com.sesoc.ictmd.api;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;

/**
 * 
 * @author yoon seoyul
 * LABEL_DETECTION                     //   사진속 요소찾기
 * LANDMARK_DETECTION            //   사진속 랜드마크 (특정 건물이나 중요한 건물)
 * WEB_DETECTION                        //   사진을 바탕으로한 연관검색어
 * 
 */
public class ImageRekognition {
	
	private static final String TARGET_URL = "https://vision.googleapis.com/v1/images:annotate?"; //REST API TARGET URL
	private static final String API_KEY = "key=AIzaSyCV2X6B5-Di_ubLyaMALNBSg4pBH3LkN2k"; //API사용을 위한키
	private static final String OUR_DOMAIN = "http://203.233.199.203";  //우리의 도메인입니다.
	private String imageFile = null; //사용자로부터 이미지 경로를 얻는다.
	private String imageTmp = null; //얻은 이미지가 저장된 서버의 웹에서의 임시 경로
	private String imageTmpFile = null;
	private HttpServletRequest request=null;
	
	public ImageRekognition(String imageFile, HttpServletRequest request) {
		super();
		this.request = request;
		this.imageFile = imageFile;
		
		System.out.println("imageFile 생성");
		System.out.println("주소 : " + imageFile);
		String initUrl =  imageFile;
		try {	
			URL url=new URL(initUrl);
			imageTmpFile = request.getSession().getServletContext().getRealPath("/resources/img/1.png");
			InputStream fis = url.openStream();
			File file = new File(imageTmpFile);
			OutputStream os = new FileOutputStream(file);
			FileCopyUtils.copy(fis, os);
			fis.close();
			os.close();
			imageTmp = OUR_DOMAIN+request.getContextPath()+"/resources/img/1.png";
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public void fileClear() {
		File file = new File(imageTmpFile);
		if(file.exists())
			file.delete();
	}
	public String doLabelDetection() {
		try {
			URL serverUrl = new URL(TARGET_URL + API_KEY);
			URLConnection urlConnection = serverUrl.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) urlConnection;
			httpConnection.setRequestMethod("POST");
			httpConnection.setRequestProperty("Content-Type", "application/json");
			httpConnection.setDoOutput(true);
			BufferedWriter httpRequestBodyWriter = new BufferedWriter(
					new OutputStreamWriter(httpConnection.getOutputStream()));
			httpRequestBodyWriter.write("{\"requests\":  [{ \"features\":  [ {\"type\": \"LABEL_DETECTION\"	}],"
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
					"{\"requests\":  [{ \"features\":  [ {\"type\": \"LANDMARK_DETECTION\",\"maxResults\": \"5\"	}],"
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
			httpRequestBodyWriter.write(
					"{ \"requests\": [ { \"features\": [ { \"type\": \"WEB_DETECTION\", \"maxResults\": 5 } ],"
					+ " \"image\": { \"source\": { \"imageUri\": \""+imageTmp+"\" } } } ] }");
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
	
	
	
	
}
