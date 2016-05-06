package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.ShareFile;
import com.xmut.entity.ShareType;

import java.math.*;
public class ViewShareAction extends FenYeAction{
	
	private static final long serialVersionUID = 1L;
	private String shareType="40000";
	String hql="from ShareType";
	public List getShareFileList(){
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();
		int end=this.getCurrenPage()*this.getPageSpan();
		String usernumber=(String)this.getSession().get("user");
		String typeSql="";
		if(!this.getShareType().equals("40000")){
			typeSql="and oa_sharefile.share_type='"+this.getShareType()+"' ";
		}
		String sql="select numbers,name,realname,username,sizes,time,title,type,rn from("+
				"select top 100 percent ROW_NUMBER() OVER (ORDER BY numbers asc) AS rn,numbers,name,realname,username,sizes,time,title,type from("+
				"select top 100 percent oa_sharefile.share_number numbers,oa_sharefile.share_name name,oa_sharefile.share_realname realname,"+
				"oa_user.user_realname username,oa_sharefile.share_size sizes,oa_sharefile.share_time time,"+
				"oa_sharefile.share_title title,oa_sharetype.type_name type from oa_user,oa_sharetype,oa_sharefile "+
				"where oa_sharefile.share_fromuser=oa_user.user_number and "+
				"oa_sharefile.share_type=oa_sharetype.type_number "+typeSql+"order by oa_sharefile.share_time"+
				" desc)st)st where rn>"+begin+" and rn<="+end;
		List list=this.getSearchDB().getArrayList(sql);
		int size=list.size();
		List filelist=new ArrayList();
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			ShareFile sf=new ShareFile((String)o[0],(String)o[1],(String)o[2],(String)o[3],
			((BigDecimal)o[4]).intValue(),(Date)o[5],(String)o[6],(String)o[7]);
			filelist.add(sf);
		}
		return filelist;
	}
	public List getShareTypeList(){
		List list=this.getSearchDB().getInstanceList(hql);
		list.add(0,new ShareType("40000","全部资源"));
		return list;
	}
	public void setShareType(String shareType){
		this.shareType=shareType;
		this.getSession().put("shareType",shareType);
	}
	public String getShareType(){
		String typetemp=(String)this.getSession().get("shareType");
		if(typetemp!=null){
			this.shareType=typetemp;
		}
		return this.shareType;
	}
	public String execute(){
		this.updateInfo();
		return "success";
	}
	public void updateInfo(){
		String typeSql="";
		if(!this.getShareType().equals("40000")){
			typeSql="where oa_sharefile.share_type='"+this.getShareType()+"' ";
		}
		String sql="select count(*) from oa_sharefile "+typeSql;
		List list=this.getSearchDB().getArrayList(sql);
		int total=(Integer) list.get(0);
		System.out.println(total);
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
