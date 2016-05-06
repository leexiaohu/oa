package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.ActionContext;
import com.xmut.entity.Alarm;

public class AlarmDetailAction{
	private SearchDB searchDB;
	private InsertDB insertDB;
	private String alarmNumber;
	private Alarm alarm;
	private int currenPage;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setInsertDB(InsertDB insertDB){
		this.insertDB=insertDB;
	}
	public void setAlarmNumber(String alarmNumber){
		this.alarmNumber=alarmNumber.trim();
	}
	public Alarm getAlarm(){
		return this.alarm;
	}
	public void setCurrenPage(int currenPage){
		this.currenPage=currenPage;
	}
	public int getCurrenPage(){
		return this.currenPage;
	}
	public String execute(){
		String sql1="update oa_alarm set alarm_state=1 where alarm_number='"+this.alarmNumber+"'";
		this.insertDB.update(sql1);
		String sql2="select oa_alarm.alarm_title,oa_alarm.alarm_time,"+
					"oa_user.user_realname,oa_dept.dept_name,"+
					"oa_alarm.alarm_detail from "+
					"oa_alarm,oa_user,oa_dept where oa_alarm.alarm_fromuser="+
					"oa_user.user_number and oa_alarm.alarm_dept=oa_dept.dept_number "+
					"and oa_alarm.alarm_number='"+this.alarmNumber+"'";
		List list=this.searchDB.getArrayList(sql2);
		Object[] o=(Object[])list.get(0);
		alarm=new Alarm((String)o[0],(Date)o[1],(String)o[2],
						(String)o[3],(String)o[4]);
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}