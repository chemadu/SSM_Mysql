package com.ysdit.employee.mapper;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;

public interface EmployeeMapper {

	//ȫ���û�
	public List<Employee> AllUser(Employee e);
	public List<Employee> AllUserAlls(Employee e);
	
	//����û�
	public int AddUser(Employee e);
	
	//ɾ���û�
	public int DelUser(String id);

	//�޸��û�
	public int UpUser(Employee e);
	
	//�û������ɫ��ģ��
	public List<Employee> UserRoleMondel (String s);
	
	public int AddUserToRole(String uId, String rId, String id);
	
	public int DelUserToRole(String uId, String rId);
	
	
}
