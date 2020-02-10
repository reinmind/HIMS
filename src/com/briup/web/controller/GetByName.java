package com.briup.web.controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.bean.Staff;
import com.briup.dao.impl.StaffDaoImpl;

/**
 * Servlet implementation class GetByName
 */
public class GetByName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetByName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vector<Staff> staffs ;
		StaffDaoImpl staffdao = new StaffDaoImpl();
		String name = request.getParameter("name");
		staffs = staffdao.getByName(name);
		HttpSession session = request.getSession();
		session.setAttribute("staffs", staffs);
		session.setAttribute("currentPage", 1);
		session.setAttribute("totalPage", 1);
		session.setAttribute("totalCount", staffs.size());
		response.sendRedirect("html/staff.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
