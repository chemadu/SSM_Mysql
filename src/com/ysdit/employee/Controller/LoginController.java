package com.ysdit.employee.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysdit.employee.ServiceDao.LoginServiceDao;
import com.ysdit.employee.entity.Employee;
import com.ysdit.employee.utils.Result;

@Controller
public class LoginController {

	@Autowired
	private LoginServiceDao loginService;
	
	// 登陆
	@RequestMapping("/Login.action")
	@ResponseBody
	// 转换为json
	public Result Login(HttpServletRequest request,HttpServletResponse response,Employee e) {

		HttpSession session = request.getSession();
		
		int addMenu = loginService.Login(e);

		if (addMenu > 0){
			session.setAttribute("name", e.getLoginName());
			return Result.toClient(true, "成功");
		}
		else
			return Result.toClient(false, "失败");
	}
	
	
	
}
