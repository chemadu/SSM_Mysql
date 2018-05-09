package com.ysdit.NetWord.Mapper;

import java.util.List;

import com.ysdit.NetWork.entity.Student;

public interface StudentMapper {

	//全部学生分页
	List<Student> AllStudent(int page,int row);

	//全部学生不分页
	List<Student> AllStudentList();
}
