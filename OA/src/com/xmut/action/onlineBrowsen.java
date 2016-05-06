package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

import com.xmut.utils.Doc2PdfUtil;
import com.xmut.utils.PathUtil;
import com.xmut.utils.Pdf2SwfUtil;


import java.io.*;
public class onlineBrowsen extends ViewShareAction{
	/**
	 */
	private static final long serialVersionUID = 1L;
	private String fileNumber;	
	private String fileName;
	private String fileRealName;
	private String fileType;
	
	public String getfileRealName(){
		return this.fileRealName;
	}
	public String getfileName(){
		return this.fileName;
	}
	public void setFileNumber(String fileNumber){
		this.fileNumber=fileNumber;
	}
	public String execute(){
		String sql="select share_name,share_realname,share_filetype "+
				"from oa_sharefile where share_number='"+fileNumber+"'";
		List list=this.getSearchDB().getArrayList(sql);
		if(list.size()<=0)
		{
			return "input";
		}
		Object[] o=(Object[])list.get(0);
		this.fileName=tran((String)o[0]);
		this.fileRealName=(String)o[1];
		this.fileType=(String)o[2];
		if(fileType.equals("application/msword")){
			String docPath = PathUtil.getWebRootDirFilePath("sharefile") + "/"+fileName + ".doc";
			File docFile = new File(docPath);
			if(docFile.exists()){				
				String pdfPath = PathUtil.getWebRootDirFilePath("pdf") + "/"+fileName + ".pdf";				
				File pdfFile = new File(pdfPath);				
				if(pdfFile.exists())
					pdfFile.delete();
				Doc2PdfUtil.convert2PDF(docFile, pdfFile);						
				if(pdfFile.exists()){					
					String swfPath = PathUtil.getWebRootDirFilePath("swf") + "/"+fileName + ".swf";
					File swfFile = new File(swfPath);
					if(swfFile.exists())
						swfFile.delete();
					boolean bl = Pdf2SwfUtil.convert2SWF(pdfFile, swfFile);	
					if(bl){
						String s = "{\"path\":\"" + fileName + ".swf\"}";
						System.out.println(s);
					}
				}
			}
		}
		else if(fileType.equals("application/pdf")){
			String pdfPath = PathUtil.getWebRootDirFilePath("sharefile") + "/"+fileName+".pdf";				
			File pdfFile = new File(pdfPath);									
			if(pdfFile.exists()){					
				String swfPath = PathUtil.getWebRootDirFilePath("swf") + "/"+fileName+".swf";
				File swfFile = new File(swfPath);
				if(swfFile.exists())
					swfFile.delete();
				boolean bl = Pdf2SwfUtil.convert2SWF(pdfFile, swfFile);	
				if(bl){
					String s = "{\"path\":\"" + fileName + ".swf\"}";
					System.out.println(s);
				}
			}
		}
			else
				return "input";
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
	public String tran(String str){
		return 	new String(str.substring(0,str.indexOf(".")));
	}
}
