package com.sesoc.ictmd;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.Transport;
import com.flickr4java.flickr.photos.Exif;
import com.flickr4java.flickr.photos.GeoData;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	
	private String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private String sharedSecret = "75bc08daeb7fc1dd";
	private Transport transport = new REST();
	Flickr f = new Flickr(apiKey, sharedSecret, transport);
	PhotosInterface photoInterface = f.getPhotosInterface();
	SearchParameters params = new SearchParameters();
	
	private static final HashSet<String> extras = new HashSet<String>();
	{
		extras.add("description"); // Ό³Έν
		extras.add("license"); // Creative Common?
		extras.add("date_upload"); // getDatePosted()?
		extras.add("date_taken");
		extras.add("owner_name");
		extras.add("icon_server");
		extras.add("original_format");
		extras.add("geo");
		extras.add("tags");
		extras.add("machine_tags");
		extras.add("o_dims");
		extras.add("views");
		extras.add("media");
		extras.add("path_alias");
		extras.add("url_sq");
		extras.add("url_t");
		extras.add("url_s");
		extras.add("url_q");
		extras.add("url_m");
		extras.add("url_n");
		extras.add("url_z");
		extras.add("url_c");
		extras.add("url_l"); // large url
		extras.add("url_o"); // original url
	}
    
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String toSearch() {
		return "search";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> search(String[] tags) throws FlickrException {
		params.setExtras(extras);
		params.setTags(tags);
		PhotoList<Photo> photoList = photoInterface.search(params, 100, 0);
		ArrayList<String> arr = new ArrayList<String>();
		for (Photo temp : photoList) {
			arr.add(temp.getSquareLargeUrl());
		}
		return arr;
	}
}