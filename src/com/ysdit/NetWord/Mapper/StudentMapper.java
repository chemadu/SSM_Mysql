package com.ysdit.NetWord.Mapper;

import java.util.List;

import com.ysdit.NetWork.entity.Student;

public interface StudentMapper {

	//ȫ��ѧ����ҳ
	List<Student> AllStudent(int page,int row);

	//ȫ��ѧ������ҳ
	List<Student> AllStudentList();
}
