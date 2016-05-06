package com.xmut.action;

import com.opensymphony.xwork2.*;
import org.apache.struts2.*;
import java.io.*;

public class DelShareAction extends ViewShareAction{
	
	private static final long serialVersionUID = 1L;
	private String inputPath;
	private String delfile;
	public void setInputPath(String inputPath){
		this.inputPath=inputPath;
	}
	public String getInputPath(){
		return ServletActionContext.getRequest().getRealPath(inputPath);
	}
	public void setDelfile(String delfile){
		this.delfile=delfile;
	}
	public String execute(){ 
		this.delete();
		return "success";
	}
	public void delete(){
		if(delfile!=null){
			this.getInsertDB().delShareFile(this.delfile);
			String realpath=ServletActionContext.getRequest().getRealPath(inputPath);
			File file=new File(realpath+"\\"+delfile);
			if(file!=null){
				file.delete();
			}	
		}
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
