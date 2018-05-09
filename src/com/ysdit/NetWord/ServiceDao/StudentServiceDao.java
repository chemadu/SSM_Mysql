package com.ysdit.NetWord.ServiceDao;

import java.util.List;

import com.ysdit.NetWork.entity.Student;

public interface StudentServiceDao  {
	//全部学生
	List<Student> AllStudent(int page,int row);

	List<Student> AllStudentList();
}
