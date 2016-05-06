package com.xmut.action;

import com.opensymphony.xwork2.ActionContext;

public class DocDept{
	private String deptName;
	private int deptState;
	public DocDept(){
	}
	public DocDept(String deptName,int deptState){
		this.deptName=deptName;
		this.deptState=deptState;
	}
	public String getDeptName(){
		return this.deptName;
	}
	public int getDeptState(){
		return this.deptState;
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}