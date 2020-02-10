package com.briup.bean;

import java.io.Serializable;

public class Department implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private int flag;
	private String description;
	public Department(int id,String name,int flag,String description) {
		this.id = id;
		this.name = name;
		this.flag = flag;
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int isFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String toString() {
		return "name:"+name+" description:"+description;
	}
	
}
