package com.sesoc.ictmd.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

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
	// API 실행을 위한 기본 값들.
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	// API를 구성하는 실질적인 객체들.
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	
	// 사용할 EXIF 데이터 항목들. 특정 사진에 대해 가져온 EXIF 데이터와 비교하기 위해 미리 초기화해둔다.
	private static final ArrayList<String> l = new ArrayList<String>();
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
	
	// 생성자가 호출되면 자동으로 객체들을 초기화.
	public SearchAPI() {
		init();
	}
	
	// 객체들을 초기화하는 메소드.
	private void init() {
		f = new Flickr(apiKey, sharedSecret, transport);
		i = f.getPhotosInterface();
		p = new SearchParameters();
	}

	// 일반 검색 메소드.
	public ArrayList<SimplePhoto> search(String[] tags) {
		ArrayList<SimplePhoto> result = new ArrayList<SimplePhoto>();
		p.setTags(tags);
		try {
			PhotoList<Photo> l = i.search(p, 99, 0);
			for (Photo p : l) {
				result.add(new SimplePhoto(p.getId(), p.getSquareLargeUrl()));
			}
		} catch (FlickrException e1) {
			System.out.println("Unexpected error occured when initializing photoList.");
		}
		return result;
	}

	// 특정 사진에 대한 상세 정보를 요청했을 경우 호출되는 메소드1. 사진 주소, 태그 목록, 위도 및 경도 정보를 가져온다.
	public ComplexPhoto getInfo(String id) {
		ComplexPhoto c = new ComplexPhoto();
		try {
			// 사진 객체를 가져오고 ID를 설정한다.
			Photo p = i.getInfo(id, "");
			System.out.println("URL : " + p.getUrl());
			c.setId(id);
			
			// 사진 URL을 가져온다.
			if (p.getOriginalSecret().trim().length() == 0) {
				c.setUrl(p.getLargeUrl());
			} else {
				c.setUrl(p.getOriginalUrl());
			}
			
			// 사진 태그를 가져온다.
			ArrayList<String> l = new ArrayList<String>();
			Iterator<Tag> it = p.getTags().iterator();
			while (it.hasNext()) {
				l.add(it.next().getRaw());
			}
			c.setTags(l);
			
			// 위도 및 경도를 가져온다.
			if (p.hasGeoData()) {
				c.setLatitude(p.getGeoData().getLatitude());
				c.setLongitude(p.getGeoData().getLongitude());
			}
		} catch (FlickrException e) {
			System.out.println("Unexpected error occured when getting info.");
		}
		return c;
	}
	
	// 특정 사진에 대한 상세 정보를 요청했을 경우 호출되는 메소드2. EXIF 정보를 가져온다.
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
			System.out.println("Unexpected error occured when getting exif.");
		}
		return result;
	}
}