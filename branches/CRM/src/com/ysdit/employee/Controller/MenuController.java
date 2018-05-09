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

	// ȫ����
	@RequestMapping("/AllMenu.action")
	@ResponseBody
	// ת��Ϊjson
	public List<Menu> AllMenu() {

		List<Menu> list = menuService.AllMenu();

		return list;
	}

	// �޸���AddMenu
	@RequestMapping("/UpMenu.action")
	@ResponseBody
	// ת��Ϊjson
	public Result UpMenu(Menu m) {

		int upMenu = menuService.UpMenu(m);

		if (upMenu > 0)
			return Result.toClient(true, "�ɹ�");
		else
			return Result.toClient(false, "ʧ��");
	}

	// �����AddMenu
	@RequestMapping("/AddMenu.action")
	@ResponseBody
	// ת��Ϊjson
	public Result AddMenu(Menu m) {

		int addMenu = menuService.AddMenu(m);

		if (addMenu > 0)
			return Result.toClient(true, "�ɹ�");
		else
			return Result.toClient(false, "ʧ��");
	}

	// ɾ����AddMenu
	@RequestMapping("/DelMenu.action")
	@ResponseBody
	// ת��Ϊjson
	public Result DelMenu(Integer ids) {

		int delMenu = menuService.DelMenu(ids);

		if (delMenu > 0)
			return Result.toClient(true, "�ɹ�");
		else
			return Result.toClient(false, "ʧ��");
	}

	
	//��ǰ�û������ṹ
	@RequestMapping("/UserRoleMondel.action")
	@ResponseBody
	// ת��Ϊjson
	public List<Employee> UserRoleMondel(String LoginName) {

		List<Employee> list = employeeService.UserRoleMondel(LoginName);

		return list;
	}
	
	
	//��ǰ�û�������
	@RequestMapping("/AllUserCheck.action")
	@ResponseBody
	// ת��Ϊjson
	public List<Menu> AllUserCheck(String LoginName) {

		List<Menu> list = menuService.AllMenuBycheck(LoginName);

		return list;
	}

}
