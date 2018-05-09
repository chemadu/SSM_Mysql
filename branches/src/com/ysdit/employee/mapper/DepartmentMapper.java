package com.ysdit.employee.mapper;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.RoleAndMenu;

public interface DepartmentMapper {

	//ȫ������
	public List<Department> AllDepartment(Department p);
	public List<Department> AllDepartmentAlls(Department p);
	//ɾ��
	public void DelDepartment(String id);

	//���
	public int AddDepartment(Department p);

	//�޸�
	public int UpDepartment(Department p);
	
	public List<Department> roleByName(String name);
	//���
	public void AddRole(RoleAndMenu r); 
	//ɾ��
	public void DelRoleMoudel(String n); 
	
}
