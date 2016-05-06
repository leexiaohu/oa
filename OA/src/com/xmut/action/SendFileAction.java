package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Dept;

public class SendFileAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SearchDB searchDB;
	private String fromuser;
	private List deptList;
	private String hqldept="from Dept";
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public String getFromuser(){
		String usernumber=(String)this.getSession().get("user");
		this.fromuser=searchDB.getRealNameByUsernumber(usernumber);
		return fromuser;
	}
	public List getDeptList(){
		List list=searchDB.getInstanceList(hqldept);
		list.add(0,new Dept(null,"—°‘Ò≤ø√≈"));
		System.out.println(list);
		return list;
	}
	public String execute(){
		return "success";
	}
	public Map getSession(){
		return ActionContext.getContext().getSession();
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}