package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class SendDoc2Action extends SendDocAction{
	
	private static final long serialVersionUID = 1L;
	private InsertDB insertDB;
	private String type;
	private List firstList;//一级审批的部门列表
	private List secondList;//二级审批部门的列表
	private String topic;
	private String content;
	public void setInsertDB(InsertDB insertDB){
		this.insertDB=insertDB;
	}
	public void setType(String type){
		this.type=type.trim();
	}
	public String getType(){
		return this.type;
	}
	public void setFirstList(List firstList){
		this.firstList=firstList;
	}
	public List getFirstList(){
		return this.firstList;
	}
	public void setSecondList(List secondList){
		this.secondList=secondList;
	}
	public List getSecondList(){
		return this.secondList;
	}
	public void setTopic(String topic){
		this.topic=topic;
	}
	public String getTopic(){
		return this.topic;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getContent(){
		return this.content;
	}
	public String execute(){
		int docnum=this.getSearchDB().getDocMax();
		String from=(String)this.getSession().get("user");
		String sql="insert into oa_doc (doc_num,doc_from,doc_title,doc_content,doc_type,doc_time)"+
		" values('"+docnum+"','"+from+"','"+this.topic+"','"+this.content+"',"+this.type+",convert(varchar(19),getdate(),120))";
		boolean b=this.insertDB.saveDoc(sql,docnum,this.firstList,this.secondList,this.type);//插入
		if(b==true){
			this.setResult("发送成功");
		}
		else{
			this.setResult("发送失败");
		}
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}