package com.xmut.action;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class ScanDocAction {
	private SearchDB searchDB;
	private String hqltype="from ShareType";
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public List getTypeList(){
		List list=searchDB.getInstanceList(hqltype);
		return list;
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
