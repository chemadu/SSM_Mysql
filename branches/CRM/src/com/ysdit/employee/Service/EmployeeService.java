package com.ysdit.employee.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ysdit.employee.ServiceDao.EmployeeServiceDao;
import com.ysdit.employee.entity.Department;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.mapper.EmployeeMapper;
import com.ysdit.employee.utils.Getuuid;

@Service("employeeService")

public class EmployeeService implements EmployeeServiceDao {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	//查询全部用户
	@Override
	public List<Employee> AllUser(Employee e) {
		e.setPage((e.getPage()-1)*e.getRows());
		return employeeMapper.AllUser(e);
	}

	//添加用户
	@Override
	public int AddUser(Employee e) {
		return employeeMapper.AddUser(e);
	}

//删除用户
	@Override
	@Transactional
	public int DelUser(String[] delIds) {
		
		for (String id : delIds) {
			
			employeeMapper.DelUser(id);
			
		}
		
		
		return 1;
	}
//	修改用户
	@Override
	public int UpUser(Employee e) {
		
		return employeeMapper.UpUser(e);
	}

	@Override
	public int AllUserAlls(Employee e) {
		List<Employee> list = employeeMapper.AllUserAlls(e);
		return list.size();
	}

	
	//用户及其角色，模块
	@Override
	public List<Employee> UserRoleMondel(String s) {
		return employeeMapper.UserRoleMondel(s);
	}

	@Override
	public int AddUserToRole(String uId, String rId) {
		String id = Getuuid.getUUID32();
		return employeeMapper.AddUserToRole(uId,rId,id);
	}

	@Override
	public int DelUserToRole(String uId, String rId) {
		return employeeMapper.DelUserToRole(uId,rId);
	}

	

}
