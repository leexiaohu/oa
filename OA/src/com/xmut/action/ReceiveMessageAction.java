package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.SendMsg;

public class ReceiveMessageAction extends FenYeAction{
	
	private static final long serialVersionUID = 1L;
	public List getMessageList(){
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();
		int end=this.getCurrenPage()*this.getPageSpan();
		String usernumber=(String)this.getSession().get("user");
		String sql="select msgnumber,fromuser,msginfo,msgtime from("+
		"select top 100 percent ROW_NUMBER() OVER (ORDER BY msgnumber asc) AS rn,msgnumber,fromuser,msginfo,msgtime from ("+
		"select top 100 percent oa_message.message_number msgnumber,"+
		"oa_user.user_realname fromuser,oa_message.message_info msginfo,"+
		"Cast(oa_message.message_time as nvarchar) msgtime"+
		" from oa_message,oa_user where oa_message.message_fromuser="+
		"oa_user.user_number and oa_message.message_touser='"+usernumber.trim()+"' "+
		"order by oa_message.message_time desc)st)st where rn>"+begin+" and rn<="+end;
		System.out.println(sql);
		List list=this.getSearchDB().getArrayList(sql);
		int size=list.size();
		List filelist=new ArrayList();
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			SendMsg msg=new SendMsg((String)o[0],(String)o[1],(String)o[2],(String)o[3]);
			
			filelist.add(msg);
		}
		return filelist;
	}
	public String execute(){
		this.updateInfo();
		return "success";
	}
	public void updateInfo(){
		String usernumber=(String)this.getSession().get("user");
		String sql="select count(*) from oa_message where message_touser='"+usernumber.trim()+"'";
		List list=this.getSearchDB().getArrayList(sql);
		int total=(Integer) list.get(0);
		System.out.println("Ò³Âë×ÜÊıÎª£º"+total);
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
