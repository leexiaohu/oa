package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class SendDocAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SearchDB searchDB;
	private List deptList;
	private String hqldept="from Dept";
	private String result="";
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public SearchDB getSearchDB(){
		return this.searchDB;
	}
	public List getDeptList(){
		List list=searchDB.getInstanceList(hqldept);
		return list;
	}
	public void setResult(String result){
		this.result=result;
	}
	public String getResult(){
		return this.result;
	}
	public String execute(){
		return "success";
	}
	public Map getSession(){
		return ActionContext.getContext().getSession();
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}