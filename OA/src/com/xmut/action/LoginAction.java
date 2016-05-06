package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import com.xmut.entity.User;
@Validation()
public class LoginAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private String uid;
	private String pwd;
	private String yanzhengma;
	private String result="";
	private LoginDB loginDB;
	@RequiredStringValidator(message="${getText(\"validate.uidempty\")}")
	public void setUid(String uid){
		
		this.uid=uid;
		
	}
	public String getUid(){
		
		return this.uid;
	}
	@RequiredStringValidator(message="${getText(\"validate.pwdempty\")}")
	public void setPwd(String pwd){
		
		this.pwd=pwd;
		
	}
	public String getPwd(){
		
		return this.pwd;	
		
	}
	public void setYanzhengma(String yanzhengma){
		
		this.yanzhengma=yanzhengma;
		
	}
	public String getYanzhengma(){
		
		return this.yanzhengma;
		
	}
	public String getResult(){
		
		return result;
		
	}
	public void setLoginDB(LoginDB loginDB){this.loginDB=loginDB;}
	public String execute(){
		String yanzhengma=(String)ActionContext.getContext().getSession().get("yanzhengma");
		if(yanzhengma!=null){
			
			if(!yanzhengma.equals(this.yanzhengma.toLowerCase())){
				this.result=this.getText("login.yanzhengmaerror");
				return SUCCESS;
			}
			else{
				
				String hql="from User u where u.uid='"+uid+"' and u.pwd='"+pwd+"'";
				List list=loginDB.getUser(hql);
				
				if(list.size()>0){
					User user=(User)list.get(0);
					int right=user.getRole().getRoleRight();
					this.getSession().put("user",user.getUserNumber());
					this.getSession().put("right",right);
					return "mainmanage";
				}
				else{
					this.result="用户名或密码错误";
					return SUCCESS;
				}
			}
		}
		return SUCCESS;
	}
	public Map getSession(){//获得session的方法
		return ActionContext.getContext().getSession();}
}