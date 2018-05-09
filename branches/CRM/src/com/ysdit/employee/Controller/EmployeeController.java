package com.ysdit.employee.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysdit.employee.ServiceDao.EmployeeServiceDao;
import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.utils.Getuuid;
import com.ysdit.employee.utils.Result;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeServiceDao employeeService;

	// 全部用户
//	@RequestMapping("/AllUser.action")
//	@ResponseBody
//	public List<Employee> AllUser(Employee e) {
//
//		List<Employee> list = employeeService.AllUser(e);
//		return list;
//	}
	
	
	// 全部用户
		@RequestMapping("/AllUser.action")
		@ResponseBody
		public Map<String, Object> AllUser(Employee e) {

			List<Employee> list = employeeService.AllUser(e);
			int total = employeeService.AllUserAlls(e);
			Map<String, Object> m  = new HashMap<String, Object>();
			m.put("total", total);
			m.put("rows", list);
			return m;
		}

	// 添加用户
	@RequestMapping("/AddUser.action")
	@ResponseBody
	public Result AddUser(Employee e) {
		e.setId(Getuuid.getUUID32());
		System.out.println(Getuuid.getUUID32());
		int addUser = employeeService.AddUser(e);

		if (addUser > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}

	// 删除用户
	@RequestMapping("/DelUser.action")
	@ResponseBody
	public Result DelUser(String[] delIds) {
		int delUser = employeeService.DelUser(delIds);

		if (delUser > 0)
			return Result.toClient(true, delIds.length);
		else
			return Result.toClient(false, "失败");
	}

	// 修改用户
	@RequestMapping("/UpUser.action")
	@ResponseBody
	public Result UpUser(Employee e) {
		int upUser = employeeService.UpUser(e);

		if (upUser > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}
	
	
	//给用户添加角色
		@RequestMapping("/AddUserToRole.action")
		@ResponseBody
		public Result AddUserToRole(String uId,String rId) {
			
			int addUserToRole = employeeService.AddUserToRole(uId,rId);

			if (addUserToRole > 0)
				return Result.toClient(true, "成功");
			else
				return Result.toClient(false, "失败");
		}
	
		//给用户移除角色
				@RequestMapping("/DelUserToRole.action")
				@ResponseBody
				public Result DelUserToRole(String uId,String rId) {
					
					int delUserToRole = employeeService.DelUserToRole(uId,rId);

					if (delUserToRole > 0)
						return Result.toClient(true, "成功");
					else
						return Result.toClient(false, "失败");
				}
}
