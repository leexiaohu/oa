package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class MainManageAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SearchDB searchDB;
	private int zongjingli=0;
	private int shichang=0;
	private int jishu=0;
	private int gongguan=0;
	private int caiwu=0;
	private int houqin=0;
	public void setSearchDB(SearchDB searchDB)
	{
		this.searchDB=searchDB;
		
	}

	public int getZongjingli()
	{
		return this.zongjingli;
	}

	public int getShichang()
	{
		return this.shichang;
	}

	public int getJishu()
	{
		return this.jishu;
	}

	public int getGongguan()
	{
		return this.gongguan;
	}

	public int getCaiwu()
	{
		return this.caiwu;
	}

	public int getHouqin()
	{
		return this.houqin;
	}

	public int getTotal(){

		return this.zongjingli+this.shichang+this.jishu+this.gongguan+this.caiwu+this.houqin;
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
	public String execute(){
		String sql="select alarm_dept,count(*) from oa_alarm where alarm_state=0 group by alarm_dept";
		List list=this.searchDB.getArrayList(sql);
		int size=list.size();
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			String deptnumber=(String)o[0];
			if(deptnumber.equals("10000")){
				zongjingli=(Integer)o[1];
			}
			else if(deptnumber.equals("10001")){
				shichang=(Integer)o[1];
			}
			else if(deptnumber.equals("10002")){
				jishu=(Integer)o[1];
			}
			else if(deptnumber.equals("10003")){
				gongguan=(Integer)o[1];
			}
			else if(deptnumber.equals("10004")){
				caiwu=(Integer)o[1];
			}
			else if(deptnumber.equals("10005")){
				houqin=(Integer)o[1];
			}
		}
		return "success";
	}
}