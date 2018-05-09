package com.ysdit.employee.mapper;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;

public interface EmployeeMapper {

	//全部用户
	public List<Employee> AllUser(Employee e);
	public List<Employee> AllUserAlls(Employee e);
	
	//添加用户
	public int AddUser(Employee e);
	
	//删除用户
	public int DelUser(String id);

	//修改用户
	public int UpUser(Employee e);
	
	//用户及其角色，模块
	public List<Employee> UserRoleMondel (String s);
	
	public int AddUserToRole(String uId, String rId, String id);
	
	public int DelUserToRole(String uId, String rId);
	
	
}
