package com.ysdit.employee.mapper;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.RoleAndMenu;

public interface DepartmentMapper {

	//全部部门
	public List<Department> AllDepartment(Department p);
	public List<Department> AllDepartmentAlls(Department p);
	//删除
	public void DelDepartment(String id);

	//添加
	public int AddDepartment(Department p);

	//修改
	public int UpDepartment(Department p);
	
	public List<Department> roleByName(String name);
	//添加
	public void AddRole(RoleAndMenu r); 
	//删除
	public void DelRoleMoudel(String n); 
	
}
