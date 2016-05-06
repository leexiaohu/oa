package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class DelAlarmAction extends ViewAlarmAction{
	
	private static final long serialVersionUID = 1L;
	private List<String> delList;
	private int currenPage;
	public int getCurrenPage(){
		return this.currenPage;
	}
	public void setCurrenPage(int currenPage){
		this.currenPage=currenPage;
	}
	public void setDelList(List delList){
		this.delList=delList;
	}
	public String execute(){
		this.delete();
		return "success";
	}
	public void delete(){
		if(delList!=null){
			this.getInsertDB().delAlarmList(delList);
		}
		
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}

}
