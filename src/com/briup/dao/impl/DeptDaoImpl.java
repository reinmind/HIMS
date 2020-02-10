package com.briup.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.briup.bean.Department;
import com.briup.common.util.JdbcUtil;
import com.briup.dao.inter.DeptDao;

public class DeptDaoImpl implements DeptDao{

	@Override
	public Vector<Department> depts() {
		JdbcUtil.getConnection();
		String sql="select * from department";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		Vector<Department> depts = new Vector<>();
		try {
			ResultSet rs = pstmt.executeQuery();
			int id;
			String name;
			int flag;
			String description;
			while(rs.next()) {
				id = rs.getInt("id");
				name = rs.getString("name");
				flag = rs.getInt("flag");
				description = rs.getString("description");
				depts.add(new Department(id,name,flag,description));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtil.close();
		return depts;
	}

	@Override
	public void addDept(Department dept) {
		JdbcUtil.getConnection();
		String sql = "insert into department(id,name,flag,description) values(?,?,?,?)";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setInt(1, dept.getId());
			pstmt.setString(2, dept.getName());
			pstmt.setInt(3, dept.isFlag());
			pstmt.setString(4, dept.getDescription());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtil.close();
	}

	@Override
	public void updateDept(Department dept) {
		JdbcUtil.getConnection();
		String sql = "update department set name=?,flag=?,description=? where id=?";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setString(1, dept.getName());
			pstmt.setInt(2, dept.isFlag());
			pstmt.setString(3, dept.getDescription());
			pstmt.setInt(4, dept.getId());
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.close();
		
	}

	@Override
	public void deleteDept(int id) {
		JdbcUtil.getConnection();
		String sql = "delete from departmen where id=?";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setInt(1, id);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.close();
		
	}

	@Override
	public String getDeptById(int id) {
		JdbcUtil.getConnection();
		String sql="select name from department where id = ?";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		String name = "";
		try {
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.close();
		return name;
	}

}
