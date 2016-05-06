package com.xmut.action;
import com.opensymphony.xwork2.*;
public class SendMessageAction extends SendFileAction{
	
	private static final long serialVersionUID = 1L;
	public String execute(){
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}