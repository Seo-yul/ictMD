package com.sesoc.ictmd.api;

import java.util.HashSet;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.Transport;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

public class SearchAPI {
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	private static HashSet<String> e;
	
	public SearchAPI() {
	}

}