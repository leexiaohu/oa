package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

import com.xmut.entity.SendMsg;

public class MsgDetailAction{
	private SearchDB searchDB;
	private String msgNumber;
	private SendMsg msg;
	private int currenPage;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setMsgNumber(String msgNumber){
		System.out.println("msgNumber"+msgNumber);
		this.msgNumber=msgNumber;
	}
	public SendMsg getMsg(){
		return this.msg;
	}
	public void setCurrenPage(int currenPage){
		this.currenPage=currenPage;
	}
	public int getCurrenPage(){
		return this.currenPage;
	}
	public String execute(){
		String usernumber=(String)ActionContext.getContext().getSession().get("user");
		String sql="select oa_message.message_number,"+
		"oa_user.user_realname,oa_message.message_info,"+
		"Cast(oa_message.message_time as nvarchar),oa_message.message_content"+
		" from oa_message,oa_user where oa_message.message_fromuser="+
		"oa_user.user_number and oa_message.message_touser='"+usernumber.trim()+"' "+
		"and oa_message.message_number='"+this.msgNumber+"'";
		List list=this.searchDB.getArrayList(sql);
		Object[] o=(Object[])list.get(0);
		System.out.println("msgNumber"+o);
		msg=new SendMsg((String)o[0],(String)o[1],(String)o[2],(String)o[4],(String)o[3]);
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}