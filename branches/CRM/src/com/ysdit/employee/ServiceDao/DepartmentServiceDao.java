package com.ysdit.employee.ServiceDao;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.RoleAndMenu;

public interface DepartmentServiceDao {


	List<Department> AllDepartment(Department p);
	int AllDepartmentAlls(Department p);
	//ɾ��
	int DelDepartment(String[] delIds);

	//���
	int AddDepartment(Department p);

	//�޸�
	int UpDepartment(Department p);
	//ͨ���û�id�ҽ�ɫ
	List<Department> roleByName(String name);
	//�޸�һ��ģ��
	int AddRole(List<RoleAndMenu> roleAndMenu);
	
	
}
