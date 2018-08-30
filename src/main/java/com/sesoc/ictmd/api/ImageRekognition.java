package com.sesoc.ictmd.api;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;

/**
 * 
 * @author yoon seoyul LABEL_DETECTION // 사진속 요소찾기 LANDMARK_DETECTION // 사진속
 *         랜드마크 (특정 건물이나 중요한 건물) WEB_DETECTION // 사진을 바탕으로한 연관검색어
 * 
 */
public class ImageRekognition {

	private static final String TARGET_URL = "https://vision.googleapis.com/v1/images:annotate?"; // REST API TARGET URL
	private static final String API_KEY = "key=AIzaSyCV2X6B5-Di_ubLyaMALNBSg4pBH3LkN2k"; // API사용을 위한키
	private static final String OUR_DOMAIN = "http://203.233.199.202"; // 우리의 도메인입니다.
	private String imageFile = null; // 사용자로부터 이미지 경로를 얻는다.
	private String imageTmp = null; // 얻은 이미지가 저장된 서버의 웹에서의 임시 경로
	private String imageTmpFile = null;
	private HttpServletRequest request = null;
	private UUID uuid = UUID.randomUUID();
	private String uid = null;
	
	public ImageRekognition(String imageFile, HttpServletRequest request) {
		super();
		this.request = request;
		this.imageFile = imageFile;
		this.uid = uuid.toString();
		this.uid = uid.substring(uid.length()-12, uid.length());
		
		System.out.println("imageFile 생성");
		System.out.println("주소 : " + imageFile);
		String initUrl = imageFile;
		try {
			URL url = new URL(initUrl);
			imageTmpFile = request.getSession().getServletContext().getRealPath("/resources/img/" + uid + ".png");
			InputStream fis = url.openStream();
			File file = new File(imageTmpFile);
			OutputStream os = new FileOutputStream(file);
			FileCopyUtils.copy(fis, os);
			fis.close();
			os.close();

			// imgResize();

			imageTmp = OUR_DOMAIN + request.getContextPath() + "/resources/img/" + uid + ".png";
			System.out.println(imageTmp);
		} catch (Exception e) {
			// e.printStackTrace();
		}
	}

	private void imgResize() {
		String imgOriginalPath = imageTmpFile; // 원본 이미지 파일명
		String imgTargetPath = imageTmpFile; // 새 이미지 파일명
		String imgFormat = "png"; // 새 이미지 포맷. jpg, gif 등
		int newWidth = 600; // 변경 할 넓이
		int newHeight = 700; // 변경 할 높이
		String mainPosition = "W"; // W:넓이중심, H:높이중심, X:설정한 수치로(비율무시)

		Image image;
		int imageWidth;
		int imageHeight;
		double ratio;
		int w;
		int h;

		try {
			// 원본 이미지 가져오기
			image = ImageIO.read(new File(imgOriginalPath));

			// 원본 이미지 사이즈 가져오기
			imageWidth = image.getWidth(null);
			imageHeight = image.getHeight(null);

			if (mainPosition.equals("W")) { // 넓이기준

				ratio = (double) newWidth / (double) imageWidth;
				w = (int) (imageWidth * ratio);
				h = (int) (imageHeight * ratio);

			} else if (mainPosition.equals("H")) { // 높이기준

				ratio = (double) newHeight / (double) imageHeight;
				w = (int) (imageWidth * ratio);
				h = (int) (imageHeight * ratio);

			} else { // 설정값 (비율무시)

				w = newWidth;
				h = newHeight;
			}

			// 이미지 리사이즈
			// Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
			// Image.SCALE_FAST : 이미지 부드러움보다 속도 우선
			// Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
			// Image.SCALE_SMOOTH : 속도보다 이미지 부드러움을 우선
			// Image.SCALE_AREA_AVERAGING : 평균 알고리즘 사용
			Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);

			// 새 이미지 저장하기
			BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImage.getGraphics();
			g.drawImage(resizeImage, 0, 0, null);
			g.dispose();
			ImageIO.write(newImage, imgFormat, new File(imgTargetPath));
			System.out.println("이미지 리사이징 끝");
		} catch (Exception e) {
			// e.printStackTrace();
		}
	}

	public void fileClear() {
		System.out.println("imageFile 삭제");
		File file = new File(imageTmpFile);
		if (file.exists())
			file.delete();
	}

	/**
	 * doLabelDetection
	 * 가져온 값을 String 타입으로 줄줄 써서 나열
	 * return resp;
	 */
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
			httpRequestBodyWriter.write("{\"requests\":  [{ \"features\":  [ {\"type\": \"LABEL_DETECTION\",\"maxResults\": \"2\"	}],"
					+ " \"image\": {\"source\": { \"imageUri\": \"" + imageTmp + "\"}}}]}");
			httpRequestBodyWriter.close();
//			String response = httpConnection.getResponseMessage();
//			System.out.println(response); //ok
			if (httpConnection.getInputStream() == null) {
				System.out.println("No stream");
				return null;
			}

			Scanner httpResponseScanner = new Scanner(httpConnection.getInputStream());
			String resp = "";
//			ArrayList<String> descriptionList = new ArrayList<String>();
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
//			String response = httpConnection.getResponseMessage();
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
//			String response = httpConnection.getResponseMessage();
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