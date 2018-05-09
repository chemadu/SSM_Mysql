package com.ysdit.NetWord.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysdit.NetWord.Mapper.StudentMapper;
import com.ysdit.NetWord.ServiceDao.StudentServiceDao;
import com.ysdit.NetWork.entity.Student;

@Service("studentService")
public class StudentService implements StudentServiceDao{

	@Autowired
	private StudentMapper studentMapper;
	
	
	//全部学生
	@Override
	public List<Student> AllStudent(int page,int row) {
		
		return studentMapper.AllStudent((page-1)*row,row);
		
	}
	
	//全部学生
		@Override
		public List<Student> AllStudentList() {
			
			return studentMapper.AllStudentList();
		}

}
