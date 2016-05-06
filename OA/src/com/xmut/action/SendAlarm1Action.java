package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Dept;
public class SendAlarm1Action extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SearchDB searchDB;
	private List deptList;
	private String hqldept="from Dept";
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public List getDeptList(){
		List list=searchDB.getInstanceList(hqldept);
		list.add(0,new Dept(null,"—°‘Ò≤ø√≈"));
		return list;
	}
	public String execute(){
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}