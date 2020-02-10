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
 * Servlet implementation class UpdateStaff
 */
public class UpdateStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<!--id,name,deptId,gender,role,phone,birthday,id_card,education,title,position,address  -->
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int deptId = Integer.parseInt(request.getParameter("deptId"));
		char gender = request.getParameter("gender").charAt(0);
		int role = Integer.parseInt(request.getParameter("role"));
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String id_card = request.getParameter("id_card");
		String education = request.getParameter("birthday");
		String title = request.getParameter("title");
		String position = request.getParameter("position");
		String address = request.getParameter("address");
		Staff staff = new Staff(role,deptId,name,birthday,gender,phone,address,id_card,education,title,position,id);
		StaffDaoImpl staffdao = new StaffDaoImpl();
		staffdao.update(staff);
		response.sendRedirect("showStaff?currentPage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
