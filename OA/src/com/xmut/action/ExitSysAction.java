package com.xmut.action;
import com.opensymphony.xwork2.*;

public class ExitSysAction{

	public String execute(){
		ActionContext.getContext().getSession().clear();
		return "success";
	}	
}