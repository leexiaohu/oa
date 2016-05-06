package com.xmut.action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.xmut.entity.Alarm;
import com.xmut.entity.Dept;

public class ViewAlarmAction extends FenYeAction{
	
	private static final long serialVersionUID = 1L;
	private String deptNumber="00000";
	private List deptList;
	private String hqldept="from Dept";
	public List getDeptList(){
		List list=this.getSearchDB().getInstanceList(hqldept);
		list.add(0,new Dept("00000","查看全部"));
		return list;
	}
	public void setDeptNumber(String deptNumber){
		this.deptNumber=deptNumber;
	}
	public List getAlarmList(){
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();
		int end=this.getCurrenPage()*this.getPageSpan();
		String deptsql="";
		if(!this.deptNumber.equals("00000")){
			deptsql=" and oa_alarm.alarm_dept='"+this.deptNumber+"' ";
		}
		String sql="select numbers,state,title,deptname,time,fromuser from("+
					"select top 100 percent ROW_NUMBER() OVER (ORDER BY numbers asc) AS rn,numbers,state,title,deptname,time,fromuser from("+
					"select top 100 percent oa_alarm.alarm_number numbers,oa_alarm.alarm_title title,"+
					"oa_alarm.alarm_time time,oa_user.user_realname fromuser,"+
					"oa_alarm.alarm_state state,oa_dept.dept_name deptname from "+
					"oa_alarm,oa_user,oa_dept where oa_alarm.alarm_fromuser="+
					"oa_user.user_number and oa_alarm.alarm_dept=oa_dept.dept_number "+
					deptsql+"order by oa_alarm.alarm_time desc)st)st where rn>"+begin+" and rn<="+end;
		List list=this.getSearchDB().getArrayList(sql);
		int size=list.size();
		System.out.println(size);
		List alarmlist=new ArrayList();
		for(int i=0;i<size;i++){
			Object[] o=(Object[])list.get(i);
			Alarm alarm=new Alarm((String)o[0],(Integer)o[1],(String)o[2],(String)o[3],
			(Date)o[4],(String)o[5]);
			alarmlist.add(alarm);
		}
		return alarmlist;
	}
	public String execute(){
		this.updateInfo();
		return "success";
	}
	public void updateInfo(){
		String deptSql="";
		if(!this.deptNumber.equals("00000")){
			deptSql="where oa_alarm.alarm_dept='"+this.deptNumber+"' "; 
		}
		String sql="select count(*) from oa_alarm "+deptSql;
		List list=this.getSearchDB().getArrayList(sql);
		int total=(Integer) list.get(0);
		System.out.println("总数为"+total);
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));
	}
	public int getRight(){
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
}