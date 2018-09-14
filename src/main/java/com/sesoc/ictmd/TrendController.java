package com.sesoc.ictmd;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.Interface.TrendDAO;
import com.sesoc.ictmd.Interface.UserDAO;
import com.sesoc.ictmd.vo.BasicTrendData;
import com.sesoc.ictmd.vo.UserBase;
import com.sesoc.ictmd.vo.UserDetail;

@Controller
public class TrendController {

	@Autowired
	SqlSession session;

	@RequestMapping(value = "importBasicMakeData", method = RequestMethod.POST)
	public @ResponseBody List<BasicTrendData> importBasicMakeData() {

		TrendDAO tDAO = session.getMapper(TrendDAO.class);
		
		int allDataCount = tDAO.allDataCount();
		System.out.println("전체데이터개수 : " + allDataCount);
		List<BasicTrendData> BasicMakeData = tDAO.BasicMakeChart();
		System.out.println(BasicMakeData);
		
		return BasicMakeData;
	}
	
	@RequestMapping(value = "importBasicModelData", method = RequestMethod.POST)
	public @ResponseBody List<BasicTrendData> importBasicModelData() {
		
		TrendDAO tDAO = session.getMapper(TrendDAO.class);
		
		List<BasicTrendData> BasicModelData = tDAO.BasicModelChart();
		System.out.println(BasicModelData);
		
		return BasicModelData;
	}
	
	@RequestMapping(value = "importBasicTagsData", method = RequestMethod.POST)
	public @ResponseBody List<BasicTrendData> importBasicTagsData() {
		
		TrendDAO tDAO = session.getMapper(TrendDAO.class);
		
		List<BasicTrendData> BasicTagChart = tDAO.BasicTagChart();
		System.out.println(BasicTagChart);
		
		return BasicTagChart;
	}
	
	


}
