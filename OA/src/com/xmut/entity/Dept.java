package com.xmut.entity;
public class Dept{
	private String deptNumber;
	private String deptName;
	public Dept(){
	}
	public Dept(String deptNumber,String deptName){
		this.deptNumber=deptNumber;
		this.deptName=deptName;
	}
	public void setDeptNumber(String deptNumber){
		this.deptNumber=deptNumber;
	}
	public String getDeptNumber(){
		return this.deptNumber;
	}
	public void setDeptName(String deptName){
		this.deptName=deptName;
	}
	public String getDeptName(){
		return this.deptName;
	}
}