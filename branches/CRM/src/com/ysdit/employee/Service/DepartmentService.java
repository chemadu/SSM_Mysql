package com.ysdit.employee.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysdit.employee.ServiceDao.DepartmentServiceDao;
import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.RoleAndMenu;
import com.ysdit.employee.mapper.DepartmentMapper;
import com.ysdit.employee.utils.Getuuid;

@Service("departmentService")
public class DepartmentService implements DepartmentServiceDao{
	@Autowired
	private DepartmentMapper departmentMapper;
	
	//查询全部部门
		@Override
		public List<Department> AllDepartment(Department p) {
			
			p.setPage((p.getPage()-1)*p.getRows());
			return departmentMapper.AllDepartment(p);
		}

		@Override
		public int DelDepartment(String[] delIds) {
			
			for (String id : delIds) {
				departmentMapper.DelDepartment(id);
			}
			
			return 1;
		}

		//添加
		@Override
		public int AddDepartment(Department p) {
			return departmentMapper.AddDepartment(p);
		}

		@Override
		public int UpDepartment(Department p) {
			return departmentMapper.UpDepartment(p);
		}

		@Override
		public int AllDepartmentAlls(Department p) {
			
			return departmentMapper.AllDepartmentAlls(p).size();
		}

		@Override
		public List<Department> roleByName(String name) {
			
			return departmentMapper.roleByName(name);
		}

		@Override
		public int AddRole(List<RoleAndMenu> roleAndMenu) {
			
			
			departmentMapper.DelRoleMoudel(roleAndMenu.get(0).getRoleId());
			for (RoleAndMenu roleAndMenu2 : roleAndMenu) {
				departmentMapper.AddRole(roleAndMenu2);
			}
			
				
			return 1; 
		}

}
