package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class UserUniqueAction{
	private SearchDB searchDB;
	private String name;
	private String flag;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getFlag(){
		return this.flag;
	}
	public String execute(){
		String sql="select user_name from oa_user where user_name='"+this.name+"'";
		List list=this.searchDB.getArrayList(sql);
		if(list.isEmpty()){
			this.flag="ok";
		}
		else{
			this.flag="no";
		}
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
