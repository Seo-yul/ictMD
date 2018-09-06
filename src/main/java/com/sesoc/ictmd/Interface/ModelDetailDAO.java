package com.sesoc.ictmd.Interface;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.ictmd.vo.ModelDetail;

public interface ModelDetailDAO {
	public ArrayList<ModelDetail> searchModelDetail(HashMap<String, String[]> tags);
}