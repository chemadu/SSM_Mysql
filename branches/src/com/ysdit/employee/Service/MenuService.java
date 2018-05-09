package com.ysdit.employee.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ysdit.employee.ServiceDao.EmployeeServiceDao;
import com.ysdit.employee.ServiceDao.MenuServiceDao;
import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.Menu;
import com.ysdit.employee.mapper.EmployeeMapper;
import com.ysdit.employee.mapper.MenuMapper;

@Service("menuService")

public class MenuService implements MenuServiceDao {

	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public int DelMenu(Integer delIds) {
		
		return menuMapper.DelMenu(delIds);
	}

	@Override
	public int AddMenu(Menu p) {
		return menuMapper.AddMenu(p);
	}

	@Override
	public int UpMenu(Menu p) {
		return menuMapper.UpMenu(p);
	}

	@Override
	public List<Menu> AllMenu() {
		return menuMapper.AllMenu();
	}

	@Override
	public List<Menu> AllMenuBycheck(String s) {
		
		List<Menu> allMenu = menuMapper.AllMenu();
		
		List<Department> department = menuMapper.RoleMondel(s);
		
		if(department.size()>0){
			
			List<Menu> menu = department.get(0).getMenu();
			
			for (Menu menu1 : allMenu) {
				
				int Mid = menu1.getId();
				
				for (Menu menu2 : menu){
					
					int UMid =menu2.getId();
					
					if(menu1.getParentId()!=0){
					if(UMid==Mid){
						menu1.setchecked("true");
						}
						
						
					}
					
					
				}
			}
		}
		
		return allMenu;
	}
	
}
