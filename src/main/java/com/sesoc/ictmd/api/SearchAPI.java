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
	// API ������ ���� �⺻ ����.
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	// API�� �����ϴ� �������� ��ü��.
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	
	// ����� EXIF ������ �׸��. Ư�� ������ ���� ������ EXIF �����Ϳ� ���ϱ� ���� �̸� �ʱ�ȭ�صд�.
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
	
	// �����ڰ� ȣ��Ǹ� �ڵ����� ��ü���� �ʱ�ȭ.
	public SearchAPI() {
		init();
	}
	
	// ��ü���� �ʱ�ȭ�ϴ� �޼ҵ�.
	private void init() {
		f = new Flickr(apiKey, sharedSecret, transport);
		i = f.getPhotosInterface();
		p = new SearchParameters();
	}

	// �Ϲ� �˻� �޼ҵ�.
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

	// Ư�� ������ ���� �� ������ ��û���� ��� ȣ��Ǵ� �޼ҵ�1. ���� �ּ�, �±� ���, ���� �� �浵 ������ �����´�.
	public ComplexPhoto getInfo(String id) {
		ComplexPhoto c = new ComplexPhoto();
		try {
			// ���� ��ü�� �������� ID�� �����Ѵ�.
			Photo p = i.getInfo(id, "");
			System.out.println("URL : " + p.getUrl());
			c.setId(id);
			
			// ���� URL�� �����´�.
			if (p.getOriginalSecret().trim().length() == 0) {
				c.setUrl(p.getLargeUrl());
			} else {
				c.setUrl(p.getOriginalUrl());
			}
			
			// ���� �±׸� �����´�.
			ArrayList<String> l = new ArrayList<String>();
			Iterator<Tag> it = p.getTags().iterator();
			while (it.hasNext()) {
				l.add(it.next().getRaw());
			}
			c.setTags(l);
			
			// ���� �� �浵�� �����´�.
			if (p.hasGeoData()) {
				c.setLatitude(p.getGeoData().getLatitude());
				c.setLongitude(p.getGeoData().getLongitude());
			}
		} catch (FlickrException e) {
			System.out.println("Unexpected error occured when getting info.");
		}
		return c;
	}
	
	// Ư�� ������ ���� �� ������ ��û���� ��� ȣ��Ǵ� �޼ҵ�2. EXIF ������ �����´�.
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