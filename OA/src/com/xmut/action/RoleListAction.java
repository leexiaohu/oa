package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Roles;

public class RoleListAction{
	private SearchDB searchDB;
	private String group;
	private List roleList;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setGroup(String group){
		this.group=group;
	}
	public List getRoleList(){
		this.roleList.add(0,new Roles("","ѡ���ɫ"));
		return this.roleList;	
	}
	public String execute(){
		String hql="from Roles r where r.groupNumber='"+group+"'";
		System.out.println(hql);
		this.roleList=this.searchDB.getInstanceList(hql);
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
