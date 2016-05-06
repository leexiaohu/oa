package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class FenYeAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SearchDB searchDB;
	private InsertDB insertDB;
	private int currenPage=1;
	//声明页跨度，默认每页显示5条
	private int pageSpan=5;
	private int maxPage;
	private int totalMessage;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public SearchDB getSearchDB(){
		return this.searchDB;
	}
	public void setInsertDB(InsertDB insertDB){
		this.insertDB=insertDB;
	}
	public InsertDB getInsertDB(){
		return this.insertDB;
	}
	public void setCurrenPage(int currenPage){
		this.currenPage=currenPage;
	}
	public int getCurrenPage(){
		
		return this.currenPage;
	}
	public void setPageSpan(int pageSpan){
		this.pageSpan=pageSpan;
		this.getSession().put("pageSpan",pageSpan);
		this.currenPage=1;
	}
	public int getPageSpan(){
		Object obj=this.getSession().get("pageSpan");
		if(obj!=null){
			this.pageSpan=(Integer)obj;
		}
		return this.pageSpan;
	}
	public void setMaxPage(int maxPage){
		this.maxPage=maxPage;
	}
	public int getMaxPage(){
		
		return this.maxPage;
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
