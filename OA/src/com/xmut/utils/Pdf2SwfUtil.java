package com.xmut.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;


public class Pdf2SwfUtil {

	private static String PDF2SWF_PATH = "D:/SWFTools/pdf2swf.exe";
	
	public static boolean convert2SWF(File pdfFile, File swfFile){
		if(!pdfFile.getName().endsWith(".pdf")){
			System.out.println("文件格式非PDF！");
			return false;
		}
		if(!pdfFile.exists()){
			System.out.println("PDF文件不存在！");
			return false;
		}
		if(swfFile.exists()){
			System.out.println("SWF文件已存在！");
			return true;
		}
		String command = PDF2SWF_PATH +" -t \"" + pdfFile.getAbsolutePath()
				+"\" -s flashversion=9 -o \""+swfFile.getAbsolutePath()+"\"";
		try {
			System.out.println("开始转换文档: "+pdfFile.getName());			
			Process p=Runtime.getRuntime().exec(command);			
			BufferedReader bufferedReader = new BufferedReader( 
					new InputStreamReader(p.getInputStream())); 
					while (bufferedReader.readLine() != null); 
					try { 
					    p.waitFor(); 
					} catch (InterruptedException e) { 
					    // TODO Auto-generated catch block 
					    e.printStackTrace(); 
					} 
			System.out.println("成功转换为SWF文件！");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("转换文档为swf文件失败！");
			return false;
		}
	}
	
}
