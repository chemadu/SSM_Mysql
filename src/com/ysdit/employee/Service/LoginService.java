package com.ysdit.employee.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysdit.employee.ServiceDao.LoginServiceDao;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.mapper.LoginMapper;

@Service("loginService")
public class LoginService implements LoginServiceDao {

	@Autowired
	LoginMapper  loginmapper;
	
	
	@Override
	public int Login(Employee e) {
		String password = loginmapper.Login(e);
		if(password.equals(e.getPassword())){
			return 1;
		}else{
			return 0;
		}
		
		
	}

}
