package com.xmut.action;
import java.util.*;

import com.opensymphony.xwork2.ActionContext;
public class DocProAction{
	private SearchDB searchDB;
	private List firstList;
	private List secondList;
	private String topic;
	private int type;
	private int state;
	private String docnum;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setDocnum(String docnum){
		this.docnum=docnum;
	}
	public String getTopic(){
		return this.topic;
	}
	public List getFirstList(){
		return this.firstList;
	}
	public List getSecondList(){
		return this.secondList;
	}
	public int getType(){
		return this.type;
	}
	public int getState(){
		return this.state;
	}
	public String execute(){
		String sql1="select doc_title,doc_type,doc_state from oa_doc where "+
				"doc_num='"+this.docnum+"'";
		List list=this.searchDB.getArrayList(sql1);
		Object[] o=(Object[])list.get(0);
		this.topic=(String)o[0];
		this.type=(Integer)o[1];
		this.state=(Integer)o[2];
		firstList=new ArrayList();
		String sql2="select oa_dept.dept_name,oa_docdept.dept_state from "+
				"oa_dept,oa_docdept where oa_docdept.doc_num='"+this.docnum+"' "+
				"and oa_dept.dept_number=oa_docdept.dept_num and oa_docdept.doc_type=1";
		list=this.searchDB.getArrayList(sql2);
		int size=list.size();
		for(int i=0;i<size;i++){
			Object[] o1=(Object[])list.get(i);
			DocDept dd=new DocDept((String)o1[0],(Integer)o1[1]);
			firstList.add(dd);
		}
		if(this.type==2){
			this.secondList=new ArrayList();
			sql2="select oa_dept.dept_name,oa_docdept.dept_state from "+
				"oa_dept,oa_docdept where oa_docdept.doc_num='"+this.docnum+"' "+
				"and oa_dept.dept_number=oa_docdept.dept_num and oa_docdept.doc_type=2";
			list=this.searchDB.getArrayList(sql2);
			size=list.size();
			for(int i=0;i<size;i++){
				Object[] o2=(Object[])list.get(i);
				DocDept dd=new DocDept((String)o2[0],(Integer)o2[1]);
				secondList.add(dd);
			}
		}
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}