package com.briup.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.bean.Staff;
import com.briup.dao.impl.StaffDaoImpl;

/**
 * Servlet implementation class InsertStaff
 */
public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<!-- name,deptId,gender,role,phone,birthday,id_card,education,title,position,address -->
		String name = request.getParameter("name");
		int deptId = Integer.parseInt(request.getParameter("deptId"));
		char gender = request.getParameter("gender").charAt(0);
		int role = Integer.parseInt(request.getParameter("role"));
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String id_card = request.getParameter("id_card");
		String education = request.getParameter("education");
		String title = request.getParameter("title");
		String position = request.getParameter("position");
		String address = request.getParameter("address");
		int id = Integer.parseInt(request.getParameter("id"));
		//int role,int id,int deptId,String name,String birthday,char gender,String phone,String address,String id_card,String education,String title,String position
		Staff staff = new Staff(role,deptId,name,birthday,gender,phone,address,id_card,education,title,position,id);
		StaffDaoImpl staffdao = new StaffDaoImpl();
		staffdao.add(staff);
		response.sendRedirect("html/staff.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
