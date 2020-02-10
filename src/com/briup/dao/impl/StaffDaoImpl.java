package com.briup.dao.impl;

import com.briup.bean.Staff;
import com.briup.common.util.JdbcUtil;
import java.sql.*;
import java.util.Vector;

import com.briup.dao.inter.*;
public class StaffDaoImpl implements StaffDao{
	
	@Override
	public void insert(Staff staff) {
		String sql = "update staff set username=?,password=? where id=?";
		JdbcUtil.getConnection();
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setString(1, staff.getName());
			pstmt.setString(2, staff.getPassword());
			pstmt.setInt(3, staff.getId());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JdbcUtil.close();
	}

	@Override
	public Staff selectByName(String name) {
		return null;
	}

	@Override
	public String login(String username, String password) {
		String id = null;
		Connection connection = JdbcUtil.getConnection();
		Statement stmt = null;
		try {
			 stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select * from staff where username='"
					+username+ "' and password = '"
					+password+ "'");
			if(rs.next()) {
			id = rs.getString("role");
			
			}else {
				return "false";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null)
					stmt.close();
				if(connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return id;
	}

	@Override
	public boolean hasUser(String id) {
		String sql = "select * from staff where id = ?";
		JdbcUtil.getConnection();
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		JdbcUtil.close();
		return false;
	}

	@Override
	public Vector<Staff> getStaffs(int arg1,int arg2) {
		JdbcUtil.getConnection();
		String sql="select * from staff limit ?,?";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		
		Vector<Staff> staffs = new Vector<>();
		try {
			pstmt.setInt(1, arg1);
			pstmt.setInt(2, arg2);
			ResultSet rs = pstmt.executeQuery();
			int id;
			int deptId;
			String name;
			String education;
			String address;
			String position;
			String phone;
			String title;
			String gender;
			String id_card;
			String birthday;
			int role;
			
			while(rs.next()) {
				role = rs.getInt("role");
				id = rs.getInt("id");
				deptId = rs.getInt("deptId");
				name = rs.getString("name");
				education = rs.getString("education");
				address = rs.getString("address");
				phone = rs.getString("phone");
				title = rs.getString("title");
				gender = rs.getString("gender");
				id_card = rs.getString("id_card");
				position = rs.getString("position");
				birthday = rs.getString("birthday");
				staffs.add(new Staff(role,deptId,name,birthday,gender.charAt(0),phone,address,id_card,education,title,position,id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.close();
		return staffs;
	}
	
	@Override
	public void add(Staff staff) {
		//<!-- name,deptId,gender,role,phone,birthday,id_card,education,title,position,address -->
		//int role,int deptId,String name,String birthday,char gender,String phone,String address,String id_card,String education,String title,String position,int id
		String sql = "insert into staff(name,deptId,gender,role,phone,birthday,id_card,education,title,position,address,id) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		JdbcUtil.getConnection();
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setString(1, staff.getName());
			pstmt.setInt(2, staff.getDeptId());
			pstmt.setString(3,""+staff.getGender());
			pstmt.setInt(4, staff.getRole());
			pstmt.setString(5, staff.getPhone());
			pstmt.setString(6, staff.getBirthday());
			pstmt.setString(7, staff.getId_card());
			pstmt.setString(8, staff.getEducation());
			pstmt.setString(9, staff.getTitle());
			pstmt.setString(10, staff.getPosition());
			pstmt.setString(11, staff.getAddress());
			pstmt.setInt(12, staff.getId());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JdbcUtil.close();
		
	}

	@Override
	public int getStaffsNum() {
		JdbcUtil.getConnection();
		String sql = "select count(*) from staff";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		ResultSet rs;
		int num = 0;
		try {
			
			rs = pstmt.executeQuery();
			if(rs.next())
			num = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtil.close();
		
		return num;
	}

	@Override
	public void delStaff(int id) {
		JdbcUtil.getConnection();
		String sql = "delete from staff where id = ? ";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		
		try {
			pstmt.setInt(1, id);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Vector<Staff> getByName(String name) {
		JdbcUtil.getConnection();
		String sql="select * from staff where name = ?";
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		
		Vector<Staff> staffs = new Vector<>();
		try {
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			int id;
			int deptId;
			String education;
			String address;
			String position;
			String phone;
			String title;
			String gender;
			String id_card;
			String birthday;
			int role;
			
			while(rs.next()) {
				role = rs.getInt("role");
				id = rs.getInt("id");
				deptId = rs.getInt("deptId");
				name = rs.getString("name");
				education = rs.getString("education");
				address = rs.getString("address");
				phone = rs.getString("phone");
				title = rs.getString("title");
				gender = rs.getString("gender");
				id_card = rs.getString("id_card");
				position = rs.getString("position");
				birthday = rs.getString("birthday");
				staffs.add(new Staff(role,deptId,name,birthday,gender.charAt(0),phone,address,id_card,education,title,position,id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.close();
		return staffs;
		
	}

	@Override
	public void update(Staff staff) {
		//<!--id,name,deptId,gender,role,phone,birthday,id_card,education,title,position,address  -->
		String sql = "update staff set name = ?,deptId = ?,gender = ?,role = ?,phone = ?,birthday = ?,id_card = ?,education = ?,title = ?,position = ?,address = ? where id = ?";
		JdbcUtil.getConnection();
		PreparedStatement pstmt = JdbcUtil.getPstmt(sql);
		try {
			pstmt.setString(1,staff.getName());
			pstmt.setInt(2, staff.getDeptId());
			pstmt.setString(3, staff.getGender()+"");
			pstmt.setInt(4, staff.getRole());
			pstmt.setString(5, staff.getPhone());
			pstmt.setString(6, staff.getBirthday());
			pstmt.setString(7, staff.getId_card());
			pstmt.setString(8, staff.getEducation());
			pstmt.setString(9, staff.getTitle());
			pstmt.setString(10, staff.getPosition());
			pstmt.setString(11, staff.getAddress());
			pstmt.setInt(12, staff.getId());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JdbcUtil.close();
	}
	
}
