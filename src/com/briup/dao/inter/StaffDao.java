package com.briup.dao.inter;

import java.util.Vector;

import com.briup.bean.Staff;

public interface StaffDao {
	void insert(Staff staff);
	Staff selectByName(String name);
	String login(String username,String password);
	boolean hasUser(String id);
	Vector<Staff> getStaffs(int arg1,int arg2);
	void add(Staff staff);
	int getStaffsNum();
	void delStaff(int id);
	Vector<Staff> getByName(String name);
	void update(Staff staff);
}
