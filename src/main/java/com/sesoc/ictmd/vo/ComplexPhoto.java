package com.sesoc.ictmd.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import com.flickr4java.flickr.photos.Exif;

public class ComplexPhoto {
	private String id;
	private String url;
	private ArrayList<String> tags;
	private float latitude;
	private float longitude;
	private HashMap<String, String> exifs;
	
	public ComplexPhoto() {
		// TODO Auto-generated constructor stub
	}

	public ComplexPhoto(String id, String url, ArrayList<String> tags, float latitude, float longitude,
			HashMap<String, String> exifs) {
		super();
		this.id = id;
		this.url = url;
		this.tags = tags;
		this.latitude = latitude;
		this.longitude = longitude;
		this.exifs = exifs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public ArrayList<String> getTags() {
		return tags;
	}

	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public HashMap<String, String> getExifs() {
		return exifs;
	}

	public void setExifs(HashMap<String, String> exifs) {
		this.exifs = exifs;
	}

	@Override
	public String toString() {
		return "ComplexPhoto [id=" + id + ", url=" + url + ", tags=" + tags + ", latitude=" + latitude + ", longitude="
				+ longitude + ", exifs=" + exifs + "]";
	}
}