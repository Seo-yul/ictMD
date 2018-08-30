package com.sesoc.ictmd.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class ComplexPhoto {
	private String id;
	private String url;
	private ArrayList<String> tags;
	private float latitude;
	private float longitude;
	
	public ComplexPhoto() {
		// TODO Auto-generated constructor stub
	}

	public ComplexPhoto(String id, String url, ArrayList<String> tags, float latitude, float longitude) {
		super();
		this.id = id;
		this.url = url;
		this.tags = tags;
		this.latitude = latitude;
		this.longitude = longitude;
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

	@Override
	public String toString() {
		return "ComplexPhoto [id=" + id + ", url=" + url + ", tags=" + tags + ", latitude=" + latitude + ", longitude="
				+ longitude + "]";
	}
}