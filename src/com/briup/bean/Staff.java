package com.briup.bean;

import java.io.Serializable;

public class Staff implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private int deptId;
	private String password;
	private int id;
	private String username;
	private char gender;
	private String phone;
	private String address;
	private String id_card;
	private String birthday;
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public void setEducation(String education) {
		this.education = education;
	}

	private String education;
	private String title;
	private int role;
	

	public Staff(int role,int deptId,String name,String birthday,char gender,String phone,String address,String id_card,String education,String title,String position,int id) {
		this.role = role;
		this.id = id;
		this.deptId = deptId;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.id_card = id_card;
		this.education = education;
		this.title = title;
		this.position = position;
		this.birthday = birthday;
	}
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public char getGender() {
		return gender;
	}
	public int getDeptId() {
		return deptId;
	}

	
	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEducation() {
		return education;
	}

	public void setEudcation(String education) {
		this.education = education;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	private String position;

	public Staff(int id, String name, String password) {
		super();
		this.name = name;
		this.password = password;
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
