package com.sesoc.ictmd.Interface;

import java.util.ArrayList;

import com.sesoc.ictmd.vo.BasicAnalysisData;
import com.sesoc.ictmd.vo.HistoryVO;

public interface AnalysisDAO {
	public int write(BasicAnalysisData bad);

	public ArrayList<BasicAnalysisData> readAll();
	
	public HistoryVO check(String id);
	
	public int view(String id);
	
	public int renew(String id);
	
	public HistoryVO check2(String id);
}