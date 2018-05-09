package com.ysdit.NetWord.Controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysdit.NetWord.ServiceDao.StudentServiceDao;
import com.ysdit.NetWork.entity.Student;

@Controller
public class StudentController {

	@Autowired
	StudentServiceDao studentService;
	
		@RequestMapping("/AllStudent.action")
		@ResponseBody
		// ×ª»»Îªjson
		public HashMap<String, Object> AllStudent(int page,int rows) {
			
			List<Student> list = studentService.AllStudent(page,rows);
			
			
			List<Student> allStudentList = studentService.AllStudentList();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("total", allStudentList.size());
			map.put("rows", list);
			
			return map;
			
		}
		
}
