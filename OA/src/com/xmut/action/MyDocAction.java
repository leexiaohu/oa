package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class MyDocAction extends FenYeAction{
	
	public List getDocList(){
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();
		int end=this.getCurrenPage()*this.getPageSpan();
		String user=((String)this.getSession().get("user")).trim();
		String sql="select docnum,fromuser,deptname,title,Cast(doctime as nvarchar) from ("+
				"select top 100 percent ROW_NUMBER() OVER (ORDER BY docnum asc) AS rn,docnum,fromuser,deptname,title,doctime from("+
				"select top 100 percent oa_doc.doc_num docnum,	oa_user.user_realname fromuser,	oa_dept.dept_name deptname,"+
				"oa_doc.doc_title title,oa_doc.doc_time doctime from oa_doc,oa_user,oa_dept "+
				"where 	oa_user.user_number=oa_doc.doc_from "+
				"and	oa_dept.dept_number="+
				"oa_user.dept_number and oa_doc.doc_from='"+this.getUser()+"'"+
				" order by oa_doc.doc_time desc)st)st where rn>"+begin+" and rn<="+end;
		List list=this.getSearchDB().getArrayList(sql);
		int size=list.size();
		List doclist=new ArrayList();
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			Docs doc=new Docs((Integer)o[0],(String)o[1],(String)o[2],(String)o[3],(String)o[4]);
			doclist.add(doc);
		}
		return doclist;
	}
	public String execute(){
		this.updateInfo();
		return "success";
	}
	public void updateInfo(){
		String sql="select count(*) from("+
				"select top 100 percent oa_doc.doc_num docnum,	oa_user.user_realname fromuser,	oa_dept.dept_name deptname,"+
				"oa_doc.doc_title title,oa_doc.doc_time doctime from oa_doc,oa_user,oa_dept "+
				"where 	oa_user.user_number=oa_doc.doc_from "+
				"and	oa_dept.dept_number="+
				"oa_user.dept_number and oa_doc.doc_from='"+this.getUser()+"')st";
		List list=this.getSearchDB().getArrayList(sql);
		int total=(Integer)list.get(0);
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));
	}
	public String getUser(){
		return ((String)ActionContext.getContext().getSession().get("user")).trim();
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}