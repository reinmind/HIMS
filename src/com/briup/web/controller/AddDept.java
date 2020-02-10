package com.briup.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.bean.Department;
import com.briup.dao.impl.DeptDaoImpl;

/**
 * Servlet implementation class AddDept
 */
public class AddDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("deptId");
		String name = request.getParameter("name");
		int flag = Integer.parseInt(request.getParameter("flag"));
		String description =request.getParameter("description");
		Department dept = new Department(id,name,flag,description);
		DeptDaoImpl deptdao = new DeptDaoImpl();
		deptdao.addDept(dept);
		session.setAttribute("deptId", id+1);
		response.sendRedirect("html/dept.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		doGet(request, response);
	}

}
