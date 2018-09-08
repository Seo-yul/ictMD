package com.sesoc.ictmd.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.Transport;
import com.flickr4java.flickr.photos.Exif;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;
import com.flickr4java.flickr.tags.Tag;
import com.sesoc.ictmd.vo.ComplexPhoto;
import com.sesoc.ictmd.vo.SimplePhoto;

public class SearchAPI {
	// API를 초기화하여 작동시키는데 필요한 데이터
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	// API를 구성하는 객체들
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	
	// 추가 검색 대상 항목들을 미리 목록화한다.
	private static final Set<String> e = new HashSet<>();
	{
		e.add("date_upload");
		e.add("geo");
		e.add("tags");
		e.add("views");
		e.add("url_sq");
		e.add("url_l");
	}
	
	// 사용할 EXIF 데이터 대상 항목들을 미리 목록화한다.
	private static final ArrayList<String> l = new ArrayList<>();
	{
		l.add("Image Width");
		l.add("Image Height");
		l.add("Make");
		l.add("Model");
		l.add("Orientation");
		l.add("X-Resolution");
		l.add("Y-Resolution");
		l.add("Resolution Unit");
		l.add("Software");
		l.add("Date and Time (Modified)");
		l.add("Copyright");
		l.add("Exposure");
		l.add("Aperture");
		l.add("Exposure Program");
		l.add("ISO Speed");
		l.add("Sensitivity Type");
		l.add("Exif Version");
		l.add("Date and Time (Original)");
		l.add("Date and Time (Digitized)");
		l.add("Exposure Bias");
		l.add("Max Aperture Value");
		l.add("Metering Mode");
		l.add("Flash");
		l.add("Focal Length");
		l.add("Color Space");
		l.add("Color Tone");
		l.add("File Source");
		l.add("Lens");
		l.add("Compression");
		l.add("Format");
	}
	
	// 생성자가 호출되면 객체를 초기화하는 메소드를 실행한다.
	public SearchAPI() {
		init();
	}
	
	// 검색 객체를 초기화하는 메소드
	private void init() {
		f = new Flickr(apiKey, sharedSecret, transport);
		i = f.getPhotosInterface();
	}
	
	// 검색 패러미터를 초기화하는 메소드
	private void initParam(String[] tags) {
		p = new SearchParameters();
		if (tags.length > 1) {
			p.setTags(tags);
		} else {
			p.setText(tags[0]);
		}
		p.setPrivacyFilter(1);
		p.setHasGeo(true);
		p.setExtras(e);
		p.setSafeSearch("2");
	}

	// 사진 검색 메소드
	public ArrayList<SimplePhoto> search(String[] tags) {
		ArrayList<SimplePhoto> result = new ArrayList<SimplePhoto>();
		initParam(tags);
		PhotoList<Photo> l = null;
		try {
			l = i.search(p, 100, 0);
		} catch (FlickrException e) {
			e.printStackTrace();
		}
		if (l != null) {
			for (Photo p : l) {
				String id = p.getId();
				System.out.println("ID : " + id);
				SimplePhoto temp = new SimplePhoto(id, p.getSquareLargeUrl(), 0, 0, 0);
				result.add(temp);
			}
		} else {
			System.out.println("search result 0");
		}
		return result;
	}

	// 임의의 사진 하나를 클릭했을 때 EXIF 데이터를 제외한 해당 사진에 대한 모든 정보를 가져오는 메소드
	public ComplexPhoto getInfo(String id) {
		ComplexPhoto result = new ComplexPhoto();
		try {
			// 사진 고유의 ID를 입력받아 사진 정보를 담은 객체를 가져온다.
			Photo p = i.getInfo(id, "");
			System.out.println("선택한 사진의 원본 글 주소 : " + p.getUrl());
			result.setId(id);
			
			// 사진 주소를 가져온다.
			result.setUrl(p.getLargeUrl());
			
			// 태그 목록을 가져온다.
			ArrayList<String> l = new ArrayList<String>();
			Iterator<Tag> it = p.getTags().iterator();
			while (it.hasNext()) {
				l.add(it.next().getRaw());
			}
			result.setTags(l);
			
			// 위도 및 경도 정보가 있을 경우 가져온다.
			if (p.hasGeoData()) {
				result.setLatitude(p.getGeoData().getLatitude());
				result.setLongitude(p.getGeoData().getLongitude());
			}
		} catch (FlickrException e) {
			System.out.println("경고 : 사진 데이터를 불러오는 중 오류 발생.");
		}
		return result;
	}
	
	// 사진 고유의 ID를 입력받아 EXIF 정보를 반환하는 메소드
	public HashMap<String, String> getExif(String id) {
		HashMap<String, String> result = new HashMap<String, String>();
		try {
			Iterator<Exif> it = i.getExif(id, "").iterator();
			while (it.hasNext()) {
				Exif e = it.next();
				if (l.contains(e.getLabel())) {
					result.put(e.getLabel(), e.getRaw());
				}
			}
		} catch (FlickrException e) {
			System.out.println("알림 : 열람이 금지된 EXIF 정보.");
		}
		return result;
	}
}