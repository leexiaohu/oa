package com.xmut.action;
import java.util.*;
import org.hibernate.*;
public class LoginDB{
	private SessionFactory sf;
	public void setSf(SessionFactory sf){
		this.sf=sf;
	}
	public List getUser(String hql){
		Session session=sf.openSession();
		Query q=session.createQuery(hql);
		List list=q.list();
		session.close();
		return list;
	}
}