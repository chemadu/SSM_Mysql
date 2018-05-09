package com.ysdit.employee.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysdit.employee.ServiceDao.DepartmentServiceDao;
import com.ysdit.employee.ServiceDao.EmployeeServiceDao;
import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.entity.RoleAndMenu;
import com.ysdit.employee.utils.Getuuid;
import com.ysdit.employee.utils.Result;

@Controller
public class DeparmentController {
	@Autowired
	DepartmentServiceDao departmentService;
	
	@RequestMapping("/department.action")
	@ResponseBody
	// 转换为json
	public Map<String, Object> AllDepartment(Integer page, Integer rows,
			Department p) {

		List<Department> list = departmentService.AllDepartment(p);
		
		int total = departmentService.AllDepartmentAlls(p);
		
		Map<String, Object> m  = new HashMap<String, Object>();
		m.put("total", total);
		m.put("rows", list);
		return m;
	}
	
	//根据用户id找角色
	@RequestMapping("/roleByName.action")
	@ResponseBody
	// 转换为json
	public Map<String, Object> roleByName(String name) {

		List<Department> list = departmentService.roleByName(name);
		Map<String, Object> m  = new HashMap<String, Object>();
		m.put("rows", list);
		return m;
	}
	
	
	
	
	// 删除部门
	@RequestMapping("/DelDepartment.action")
	@ResponseBody
	public Result DelUser(String[] delIds) {
		int delUser = departmentService.DelDepartment(delIds);

		if (delUser > 0)
			return Result.toClient(true, delIds.length);
		else
			return Result.toClient(false, "失败");
	}

	// 添加部门
	@RequestMapping("/AddDepartment.action")
	@ResponseBody
	public Result DelUser(Department p) {
		
		p.setId(Getuuid.getUUID32());
		
		int addUser = departmentService.AddDepartment(p);

		if (addUser > 0)
			return Result.toClient(true, "成功");
		else
			return Result.toClient(false, "失败");
	}
	
	// 修改部门
		@RequestMapping("/UpDepartment.action")
		@ResponseBody
		public Result UpDepartment(Department p) {
			int addUser = departmentService.UpDepartment(p);

			if (addUser > 0)
				return Result.toClient(true, "成功");
			else
				return Result.toClient(false, "失败");
		}
		
		@RequestMapping("/departmentByName.action")
		@ResponseBody
		// 转换为json
		public Map<String, Object> departmentByName(Department p) {

			List<Department> list = departmentService.AllDepartment(p);
			int total = departmentService.AllDepartmentAlls(p);
			Map<String, Object> m  = new HashMap<String, Object>();
			m.put("total", total);
			m.put("rows", list);
			return m;
		}
		
		// 给角色添加一个模块
		@RequestMapping("/AddRole.action")
		@ResponseBody
		public Result AddRole(int[] ModuleId,String RoleId) {
			
			//System.out.println(ModuleId[0]+" "+RoleId);
			List<RoleAndMenu> r = new ArrayList<RoleAndMenu>();
			
			for (int i : ModuleId) {
				RoleAndMenu ram = new RoleAndMenu();
				ram.setId(Getuuid.getUUID32());
				ram.setModuleId(i);
				ram.setRoleId(RoleId);
				r.add(ram); 
			}
			
			int addRole = departmentService.AddRole(r);

			if (addRole > 0)
				return Result.toClient(true, "成功");
			else
				return Result.toClient(false, "失败");
		}
		
}
