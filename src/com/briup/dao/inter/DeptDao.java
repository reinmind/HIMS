package com.briup.dao.inter;

import java.util.Vector;

import com.briup.bean.Department;

public interface DeptDao {
	Vector<Department> depts() ;
	void addDept(Department dept);
	void updateDept(Department dept);
	void deleteDept(int id);
	String getDeptById(int id);
}
