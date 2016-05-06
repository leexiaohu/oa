package com.xmut.action;

import java.util.Date;
import java.util.Random;

import com.opensymphony.xwork2.ActionContext;
import com.xmut.entity.ShareFile;

public class ScanDoc2Action extends ScanDocAction {
	private InsertDB insertDB;
	private String type;
	private String title;
	private String fileName;
	int size=new Random().nextInt(1000)+50;
	public void setInsertDB(InsertDB insertDB){
		
		this.insertDB=insertDB;
	}
	public void setFileName(String fileName){
		
		this.fileName=fileName;
		
	}	
	public void setType(String type){
		
		this.type=type;
	}
	
	public void setTitle(String title){
		
		this.title=title;
	}
		
	public String execute(){
		if(this.fileName!=null&&!this.fileName.equals("")){
			
			ShareFile sf=new ShareFile();
			sf.setName(this.fileName);
			System.out.println(this.fileName);
			sf.setRealname(this.title+".pdf");
			sf.setFromuser((String)this.getSession().get("user"));
			sf.setTime(new Date());
			sf.setTitle(this.title);
			sf.setInfo("нч");
			sf.setSize(size);
			sf.setFiletype("application/pdf");
			sf.setType(this.type);
			this.insertDB.saveShareFile(sf);			
		}
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
