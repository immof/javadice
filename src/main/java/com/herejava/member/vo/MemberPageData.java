package com.herejava.member.vo;

import java.util.ArrayList;

public class MemberPageData {
	private ArrayList<Member> list;
	private String pageNavi;
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPageData(ArrayList<Member> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
