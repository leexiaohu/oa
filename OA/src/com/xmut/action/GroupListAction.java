package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Groups;

public class GroupListAction{
	private SearchDB searchDB;
	private String dept;
	private List groupList;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setDept(String dept){
		this.dept=dept;
	}
	public List getGroupList(){
		System.out.println("********"+this.groupList.size());
		this.groupList.add(0,new Groups("","Ñ¡Ôñ×é"));
		return this.groupList;	
	}
	public String execute(){
		String hql="from Groups g where g.deptNumber='"+dept+"'";
		this.groupList=this.searchDB.getInstanceList(hql);
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
