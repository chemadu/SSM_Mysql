package com.ysdit.employee.ServiceDao;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.Menu;

public interface MenuServiceDao {



	//��ѯȫ��
	List<Menu> AllMenu();
	
	//ɾ��
	int DelMenu(Integer delIds);

	//���
	int AddMenu(Menu p);

	//�޸�
	int UpMenu(Menu p);
	
	//Ĭ�ϴ�
	List<Menu> AllMenuBycheck(String s);
	
}
