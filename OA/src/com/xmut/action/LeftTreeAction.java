package com.xmut.action;
import com.opensymphony.xwork2.*;
public class LeftTreeAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	public String execute(){
		return SUCCESS;
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}