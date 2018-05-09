package com.ysdit.employee.utils;

public class Result {
	public boolean success;
	public String message;
	public String remark;
	
	public static Result toClient(boolean suc,Object msg){
		Result r = new Result();
		r.success =suc;
		r.message = msg.toString();
		r.remark="";
		
		return r;
	}
	public static Result toClient(boolean suc,Object msg,String remark){
		Result r = new Result();
		r.success =suc;
		r.message = msg.toString();
		r.remark=remark;
		return r;
	}	
}
