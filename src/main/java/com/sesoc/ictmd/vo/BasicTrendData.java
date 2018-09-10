package com.sesoc.ictmd.vo;

public class BasicTrendData {

	private String dataName;
	private String dataNum;

	public BasicTrendData() {
	}

	public BasicTrendData(String dataName, String dataNum) {
		super();
		this.dataName = dataName;
		this.dataNum = dataNum;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataNum() {
		return dataNum;
	}

	public void setDataNum(String dataNum) {
		this.dataNum = dataNum;
	}

	@Override
	public String toString() {
		return "BasicTrendData [dataName=" + dataName + ", dataNum=" + dataNum + "]";
	}

}
