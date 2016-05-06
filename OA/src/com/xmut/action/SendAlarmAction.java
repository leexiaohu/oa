package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Alarm;

import dojox.cometd.*;
public class SendAlarmAction extends SendAlarm1Action{
	/** 
	 */
	private static final long serialVersionUID = 1L;
	private InsertDB insertDB;
	private String title;
	private String detail;
	private String result;
	private String deptNumber;
	public void setInsertDB(InsertDB insertDB){
		this.insertDB=insertDB;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return this.title;
	}
	public void setDeptNumber(String deptNumber){
		this.deptNumber=deptNumber;
	}
	public String getDeptNumber(){
		return this.deptNumber;
	}
	public void setDetail(String detail){
		this.detail=detail;
	}
	public String getDetail(){
		return this.detail;
	}
	public String getResult(){
		return this.result;
	}
	public String execute(){
		String fromuser=((String)this.getSession().get("user")).trim();
		Alarm alarm=new Alarm();
		alarm.setTitle(this.title);
		alarm.setDetail(this.detail);
		alarm.setTime(new Date());
		alarm.setFromuser(fromuser);
		alarm.setDeptNumber(this.deptNumber);
		this.insertDB.saveAlarm(alarm);
		this.result="·¢ËÍ³É¹¦";
		alarmComet();
		return "success";
	}
	public Map getSession(){
		return ActionContext.getContext().getSession();
	}
	private void alarmComet(){
		Bayeux b=(Bayeux)ActionContext.getContext().getApplication().get(Bayeux.DOJOX_COMETD_BAYEUX);
		Channel c= b.getChannel("/Alarm",true);
		Map<String,String> message = new HashMap<String,String>();
		message.put("deptNumber",this.deptNumber);
		c.publish(
			        b.newClient("server_user"),
			        message,
			        "new_server_message" 
			     );
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}