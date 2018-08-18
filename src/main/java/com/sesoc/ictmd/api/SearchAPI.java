package com.sesoc.ictmd.api;

import java.util.ArrayList;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.Transport;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;
import com.sesoc.ictmd.vo.SimplePhoto;

public class SearchAPI {
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	
	public SearchAPI () {
		init ();
	}
	
	private void init () {
		f = new Flickr(apiKey, sharedSecret, transport);
		i = f.getPhotosInterface();
		p = new SearchParameters();
	}
	
	public ArrayList<SimplePhoto> search (String[] tags) {
		ArrayList<SimplePhoto> result = new ArrayList<SimplePhoto>();
		p.setTags(tags);
		try {
			PhotoList<Photo> l = i.search(p, 100, 0);
			for (Photo p : l) {
				result.add(new SimplePhoto(p.getId(), p.getSquareLargeUrl()));
			}
		} catch (FlickrException e1) {
			System.out.println("Unexpected error occured when initializing photoList.");
		}
		return result;
	}
	
	public void read (String id) {
		
	}
}