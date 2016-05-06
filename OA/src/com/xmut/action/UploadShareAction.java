package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class UploadShareAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
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