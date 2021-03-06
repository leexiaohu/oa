package com.xmut.action;
import com.opensymphony.xwork2.*;
import org.springframework.mail.*;
public class SendEmailAction{
	private String toEmail;
	private String topic;
	private String content;
	private MailSender mailSender;
	private String result="";
	public void setMailSender(MailSender mailSender){
		this.mailSender=mailSender;
	}
	public void setToEmail(String toEmail){
		this.toEmail=toEmail;
	}
	public void setTopic(String topic){
		this.topic=topic;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getToEmail(){
		return this.toEmail;
	}
	public String getTopic(){
		return this.topic;
	}
	public String getContent(){
		return this.content;
	}
	public String getResult(){
		return this.result;
	}
	public String execute(){
		SimpleMailMessage smm=new SimpleMailMessage();
		smm.setFrom("1471789852@qq.com");
		smm.setTo(this.getToEmail());
		smm.setSubject(this.getTopic());
		smm.setText(this.getContent());
		try{
			mailSender.send(smm);	
		}
		catch(MailException e){
			e.printStackTrace();
			this.result="发送失败，请重试";
			return "success";
		}
		this.result="发送成功";
		return "success";
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}