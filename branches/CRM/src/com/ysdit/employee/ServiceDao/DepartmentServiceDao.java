package com.ysdit.employee.ServiceDao;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.RoleAndMenu;

public interface DepartmentServiceDao {


	List<Department> AllDepartment(Department p);
	int AllDepartmentAlls(Department p);
	//删除
	int DelDepartment(String[] delIds);

	//添加
	int AddDepartment(Department p);

	//修改
	int UpDepartment(Department p);
	//通过用户id找角色
	List<Department> roleByName(String name);
	//修改一个模块
	int AddRole(List<RoleAndMenu> roleAndMenu);
	
	
}
