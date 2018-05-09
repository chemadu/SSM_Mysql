package com.ysdit.employee.mapper;

import java.util.List;

import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Menu;

public interface MenuMapper {

	 
	public List<Menu> AllMenu();

	public int UpMenu(Menu m);

	public int DelMenu(Integer id);

	public int AddMenu(Menu m);

	public List<Department> RoleMondel(String s);

}
