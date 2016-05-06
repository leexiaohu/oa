package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import com.xmut.entity.RealUser;
public class UserListAction implements Action{
	private SearchDB searchDB;
	private String deptNumber;
	private String userList;
	private String hqluser;
	public void setSearchDB(SearchDB searchDB){
		this.searchDB=searchDB;
	}
	public void setDeptNumber(String deptNumber){
		this.deptNumber=deptNumber;
	}
	public String getUserList(){
		return userList;
	}
	public String execute(){
		hqluser="from RealUser ru where ru.deptNumber='"+deptNumber+"'";
		List list=searchDB.getInstanceList(hqluser);
		int size=list.size();
		StringBuilder result=new StringBuilder();
		result.append("<table width=\"100%\" ><tr><td style=\"width:10\"></td><td><table border=0 width=\"100%\">");
		for(int i=0;i<size;i++){
			RealUser user=(RealUser)list.get(i);
			String unumber=user.getUserNumber();
			String uname=user.getUserName();
			result.append("<tr style=\"height:20px;color:#404040;font-size:14px;\" onmouseout=\"mouseoutcolor('row");
			result.append(i);
			result.append("')\" onmouseover=\"mouseovercolor('row");
			result.append(i);
			result.append("')\" onclick=\"add('");
			result.append(unumber);
			result.append("')\" id=\"row");
			result.append(i);
			result.append("\">");
			result.append("<td align=\"right\"><img src=\"images/usrlist.gif\"></td><td align=\"left\">");
			result.append(uname);
			result.append("<td></tr>");
		}
		result.append("</table></td></tr></table>");
		this.userList=result.toString();
		userList=new MyConverter().escape(userList);
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}
