package com.sesoc.ictmd.vo;

public class SimplePhoto {
	private String id;
	private String squareImageUrl;
	
	public SimplePhoto() {
		// TODO Auto-generated constructor stub
	}

	public SimplePhoto(String id, String squareImageUrl) {
		super();
		this.id = id;
		this.squareImageUrl = squareImageUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSquareImageUrl() {
		return squareImageUrl;
	}

	public void setSquareImageUrl(String squareImageUrl) {
		this.squareImageUrl = squareImageUrl;
	}

	@Override
	public String toString() {
		return "SimplePhoto [id=" + id + ", squareImageUrl=" + squareImageUrl + "]";
	}
}