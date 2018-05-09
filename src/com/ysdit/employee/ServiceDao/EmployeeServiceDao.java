package com.ysdit.employee.ServiceDao;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;

public interface EmployeeServiceDao {
 
	
	List<Employee> AllUser(Employee e);
	
	int AddUser(Employee e);

	int DelUser(String[] delIds);

	int UpUser(Employee e);
	
	int AllUserAlls(Employee e);
	
	List<Employee> UserRoleMondel(String s);

	int AddUserToRole(String uId, String rId);

	int DelUserToRole(String userid,String roleId);

}
