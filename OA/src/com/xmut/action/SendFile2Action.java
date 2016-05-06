package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Transfile;
import org.apache.struts2.*;
import java.io.*;

public class SendFile2Action extends SendFileAction{
	
	private static final long serialVersionUID = 1L;
	private InsertDB insertDB;
	private String info;
	private String touser;
	private String savePath;
	private File myFile;
	private String myFileType;
	private String myFileName;
	private String result="";
	public void setInsertDB(InsertDB insertDB){
		this.insertDB=insertDB;
	}
	public void setInfo(String info){
		this.info=info;
	}
	public void setTouser(String touser){
		this.touser=touser;
	}
	public void setSavePath(String savePath){
		this.savePath=savePath;
	}
	public String getSavePath(){
		return ServletActionContext.getRequest().getRealPath(savePath);
	}                                                                    
	public void setMyFile(File myFile){
		this.myFile=myFile;
	}
	public File getMyFile(){
		return this.myFile;
	}
	public void setMyFileContentType(String myFileType) {
		this.myFileType=myFileType;
	}

	public void setMyFileFileName(String myFileName) {
		this.myFileName=myFileName;
	}
	public String getMyFileContentType() {
		return this.myFileType;
	}
	public String getMyFileFileName() {
		return this.myFileName;
	}
	public String getResult(){
		return this.result;
	}
	public String execute(){
		if(this.myFileName!=null&&!this.myFileName.equals("")){
			String filename=new Long(new Date().getTime()).toString()+this.myFileName.substring(this.myFileName.lastIndexOf("."),this.myFileName.length());//以当前时间为该文件的文字
			FileOutputStream fos=null;
			FileInputStream fis=null;
			try{
					fos=new FileOutputStream(this.getSavePath()+"\\"+filename);//创建文件输出流
					fis=new FileInputStream(this.getMyFile());
					byte[] buffer=new byte[1024];
					int length=0;
					while((length=fis.read(buffer))>0){
						fos.write(buffer,0,length);
					}
				}
				catch(Exception e){
					System.out.println("上传失败");
					return SUCCESS;
				}
				finally{
					try{
						if(fos!=null){
						fos.close();
						}
						if(fis!=null){
							fis.close();
						}
					}
					catch(IOException e){
						e.printStackTrace();
					}
				}
			String[] touserarray=this.touser.split(";");
			int size=touserarray.length;
			List userlist=new ArrayList();
			for(int i=0;i<size;i++){
				Transfile tf=new Transfile();
				tf.setFileName(filename);
				tf.setFileRealname(this.myFileName);
				tf.setFromUser((String)this.getSession().get("user"));
				tf.setToUser(touserarray[i].trim());
				tf.setTransTime(new Date());
				tf.setFileInfo(this.info);
				tf.setFileType(this.myFileType);
				userlist.add(tf);
			}
			this.insertDB.saveTransFile(userlist);
		}
		this.result="文件传送成功！";
		return "success";
	}
	public Map getSession(){
		return ActionContext.getContext().getSession();
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}