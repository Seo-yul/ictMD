package com.sesoc.ictmd.Interface;

import java.util.ArrayList;

import com.sesoc.ictmd.vo.BasicAnalysisData;

public interface AnalysisDAO {
	public int write(BasicAnalysisData bad);

	public ArrayList<BasicAnalysisData> readAll();
}