package com.ysdit.employee.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysdit.employee.ServiceDao.EmployeeServiceDao;
import com.ysdit.employee.ServiceDao.MenuServiceDao;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.Menu;
import com.ysdit.employee.utils.Result;

@Controller
public class MenuController {

	@Autowired
	MenuServiceDao menuService;
	
	@Autowired
	EmployeeServiceDao employeeService;

	// 全部树
	@RequestMapping("/AllMenu.action")
	@ResponseBody
	// 转换为json
	public List<Menu> AllMenu() {

		List<Menu> list = menuService.AllMenu();

		return list;
	}

	// 修改树AddMenu
	@RequestMapping("/UpMenu.action")
	@ResponseBody
	// 转换为json
	public Result UpMenu(Menu m) {

		int upMenu = menuService.UpMenu(m);

		if (upMenu > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}

	// 添加树AddMenu
	@RequestMapping("/AddMenu.action")
	@ResponseBody
	// 转换为json
	public Result AddMenu(Menu m) {

		int addMenu = menuService.AddMenu(m);

		if (addMenu > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}

	// 删除树AddMenu
	@RequestMapping("/DelMenu.action")
	@ResponseBody
	// 转换为json
	public Result DelMenu(Integer ids) {

		int delMenu = menuService.DelMenu(ids);

		if (delMenu > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}

	
	//当前用户的树结构
	@RequestMapping("/UserRoleMondel.action")
	@ResponseBody
	// 转换为json
	public List<Employee> UserRoleMondel(String LoginName) {

		List<Employee> list = employeeService.UserRoleMondel(LoginName);

		return list;
	}
	
	
	//当前用户的树打勾
	@RequestMapping("/AllUserCheck.action")
	@ResponseBody
	// 转换为json
	public List<Menu> AllUserCheck(String LoginName) {

		List<Menu> list = menuService.AllMenuBycheck(LoginName);

		return list;
	}

}
