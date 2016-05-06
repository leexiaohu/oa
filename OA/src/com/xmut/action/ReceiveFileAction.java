package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

import com.xmut.entity.Transfile;


public class ReceiveFileAction extends FenYeAction{
	private static final long serialVersionUID = 1L;
	public List getMyFileList(){
		
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();
		int end=this.getCurrenPage()*this.getPageSpan();
		String usernumber=(String)this.getSession().get("user");
		
		String sql="select filename,realname,fromuser,touser,filetime,fileinfo,username,filenumber from("+
		"select top 100 percent ROW_NUMBER() OVER (ORDER BY filenumber asc) AS rn,filename,realname,fromuser,touser,filetime,fileinfo,username,filenumber from ("+
		"select top 100 percent oa_transfile.transfile_name filename,"+
		"oa_transfile.transfile_realname realname,oa_transfile.transfile_fromuser fromuser,"+
		"oa_transfile.transfile_touser touser,Cast(oa_transfile.transfile_time as nvarchar) filetime,"+
		"oa_transfile.transfile_info fileinfo,oa_user.user_realname username,oa_transfile.transfile_number filenumber"+
		" from oa_transfile,oa_user where oa_transfile.transfile_fromuser="+
		"oa_user.user_number and oa_transfile.transfile_touser='"+usernumber.trim()+"' "+
		"order by oa_transfile.transfile_time desc)st)st where rn>"+begin+" and rn<="+end;
		
		List list=this.getSearchDB().getArrayList(sql);
		
		int size=list.size();
		
		List filelist=new ArrayList();
		
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			Transfile tf=new Transfile((String)o[0],(String)o[1],(String)o[2],(String)o[3],
			(String)o[4],(String)o[5],(String)o[6],(String)o[7]);
			filelist.add(tf);
		}
		return filelist;
	}
	public String execute(){
		this.updateInfo();
		return "success";
	}
	public void updateInfo(){
		String usernumber=(String)this.getSession().get("user");
		String sql="select count(*) from oa_transfile where transfile_touser='"+usernumber.trim()+"'";
		List list=this.getSearchDB().getArrayList(sql);
		Integer total= (Integer) list.get(0);
		System.out.println("总数为："+total);
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));//更新总页数
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
