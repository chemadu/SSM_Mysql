package com.ysdit.employee.ServiceDao;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.Menu;

public interface MenuServiceDao {



	//查询全部
	List<Menu> AllMenu();
	
	//删除
	int DelMenu(Integer delIds);

	//添加
	int AddMenu(Menu p);

	//修改
	int UpMenu(Menu p);
	
	//默认打勾
	List<Menu> AllMenuBycheck(String s);
	
}
